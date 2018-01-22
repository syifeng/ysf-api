<template>
  <div>
    <div>
      <el-form :inline="true" :model="projectModal.search" class="demo-form-inline">
        <el-form-item label="项目名">
          <el-input v-model="projectModal.search.uname" placeholder="项目名"></el-input>
        </el-form-item>
        <el-form-item label="测试域名">
          <el-input v-model="projectModal.search.testDomain" placeholder="测试域名"></el-input>
        </el-form-item>
        <el-form-item label="生产域名">
          <el-input v-model="projectModal.search.productDomain" placeholder="生产域名"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="modalSearch()">查询</el-button>
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
        label="项目名">
        <template slot-scope="scope">
          <span >{{ scope.row.uname }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="模块编码">
        <template slot-scope="scope">
          <span >{{ scope.row.hostName }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="测试域名">
        <template slot-scope="scope">
          <span>{{ scope.row.testDomain }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="生产域名">
        <template slot-scope="scope">
          <span> {{ scope.row.productDomain }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="创建日期">
        <template slot-scope="scope">
          <span> {{ scope.row.createTime }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button
            size="mini"
            @click="detail(scope.row)">详情</el-button>
          <el-button
            size="mini"
            @click="beanOperate(2, scope.row)">编辑</el-button>
          <el-button
            size="mini"
            type="danger"
            @click="beanOperate(3, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <project-operate
      :projectModal="projectModal"
      :operateModal="projectModal.operate"
      :projectToOperate="projectModal.operate.toOperate"
      :loadDatas="loadDatas">
    </project-operate>
  </div>
</template>
<script>
  import ProjectOperate from '@/page/project/projectOperate'
  export default {
    name: 'users',
    components: {ProjectOperate},
    data () {
      return {
        loading: false,
        projectModal: {
          detail: {
            title: '请求详情',
            show: false
          },
          operate: {
            title: '请求添加',
            show: false,
            type: 1,
            url: '',
            toOperate:{}
          },
          fields:{},
          search: {}
        },
        pageData:{}
      }
    },
    methods: {
      loadDatas() {
        this.$http.get(this.$store.state._api._api_project_page,{
          params:this.projectModal.search
        }).then(res => {
          if (res.status == 200) {
            this.pageData = res.data.data;
          }
        })
      },
      cleanSearch(){
        this.userSearch = {}
      },
      detail(model){
        this.$router.push({path: this.$store.state.routes._api_project_detail, query: { uid: model.uid }})
      },
      operateConfirm () {

      },
      pageSizeSwitch:function(pageSize){
        this.pageSize = pageSize;
        console.log(this.pageSize)
      },
      beanOperate (operateType, row) {
        if(operateType == 1){
          this.projectModal.operate.url = this.$store.state._api._api_project_add
          this.projectModal.operate.show = true
          this.projectModal.type = 1
        }else if(operateType == 2){
          this.projectModal.operate.url = this.$store.state._api._api_project_edit
          this.$http.get(this.$store.state._api._api_project_detail + row.uid).then(res => {
            console.log(res)
            if (res.status == 200) {
              this.projectModal.operate.toOperate = res.data.data;
            }
          })
          this.projectModal.operate.show = true;
        }
        if(operateType == 1){
          this.projectModal.operate.toOperate = {}
        }else if(operateType == 1){
          this.projectModal.operate.toOperate = {}
        }else{

        }
      }
    },
    created() {
      this.loadDatas();
//      console.log("store module user :", this.$store.state.userModule.beansPage)
    },
    filters: {
      userMarkConvert:function (value) {

      }

    }
  }
</script>
<style type="text/css">

</style>
