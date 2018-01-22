<template>
  <div>
    <div>
      <el-form :inline="true" :model="moduleModal.search" class="demo-form-inline">
        <!-- <el-form-item label="项目名" v-if="!projectId">
           <el-input v-model="moduleModal.search.uname" placeholder="项目名"></el-input>
         </el-form-item>-->
        <el-form-item label="模块名称">
          <el-input v-model="moduleModal.search.uname" placeholder="模块名称"></el-input>
        </el-form-item>
        <el-form-item label="模块编码">
          <el-input v-model="moduleModal.search.apiCode" placeholder="模块编码"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="loadData()">查询</el-button>
          <el-button type="primary" @click="moduleModal.search={}">清空</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div>
      <el-button type="primary" @click="beanOperate(1)">添加</el-button>
    </div>
    <el-table
      :data="pageData.list"
      style="width: 100%;text-align: left;">
      <el-table-column
        label="模块名">
        <template slot-scope="scope">
          <span>{{ scope.row.uname }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="项目">
        <template slot-scope="scope">
          <span>{{ scope.row.projectName }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="编码">
        <template slot-scope="scope">
          <span>{{ scope.row.apiCode }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button
            size="mini"
            @click="detail(scope.row)">详情
          </el-button>
          <el-button
            size="mini"
            @click="beanOperate(2, scope.row)">编辑
          </el-button>
          <el-button
            size="mini"
            type="danger"
            @click="beanOperate(3, scope.row)">删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <module-operate
      :moduleModal="moduleModal"
      :loadData="loadData">
    </module-operate>
  </div>
</template>
<script>
  import ModuleOperate from '@/page/project/moduleOperate'
  export default {
    name: 'modules',
    components: {ModuleOperate},
    data() {
      return {
        loading: false,
        moduleModal: {
          detail: {
            title: '请求详情',
            show: false
          },
          operate: {
            title: '请求添加',
            show: false,
            type: 1,
            url: '',
            toOperate: {}
          },
          fields: {},
          search: {}
        },
        urls: {
          route: {},
          api: {}
        },
        pageData: {}
      }
    },
    props: {
      projectId: String
    },
    methods: {
      loadData() {
        if (this.projectId) this.moduleModal.search.apiProjectId = this.projectId
        this.$http.get(this.$store.state._api._api_module_page, {
          params: this.moduleModal.search
        }).then(res => {
          if (res.status == 200) {
            console.log(res)
            this.pageData = res.data.data;
          }
        })
      },
      detail(model) {
        this.$router.push({path: this.$store.state.routes._api_module_detail, query: {uid: model.uid}})
      },
      beanOperate(operateType, row) {
        switch (operateType) {
          case 1: {
            this.moduleModal.operate.url = this.$store.state._api._api_module_add
            this.moduleModal.operate.type = 1
            this.moduleModal.operate.show = true
          } break
          case 2: {
            this.moduleModal.operate.url = this.$store.state._api._api_module_edit
            this.$http.get(this.$store.state._api._api_module_detail + row.uid).then(res => {
              console.log(res)
              if (res.status == 200) {
                this.moduleModal.operate.toOperate = res.data.data;
              }
            })
            this.moduleModal.operate.show = true;
          } break
          case 3: {
            this.$http.post(this.$store.state._api._api_module_del + row.uid).then(res => {
              if (res.status == 200) {
                this.loadData()
              }
            })
          }
        }
        
      }
    },
    created() {
      this.loadData();
    },
  }
</script>
<style type="text/css">

</style>
