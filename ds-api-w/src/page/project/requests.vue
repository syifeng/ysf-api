<template>
  <div>
    <div>
      <el-form :inline="true" :model="requestModal.search" class="demo-form-inline">
        <el-form-item label="项目名" v-if="!moduleId">
          <el-input v-model="requestModal.search.uname" placeholder="项目名"></el-input>
        </el-form-item>
        <el-form-item label="URI">
          <el-input v-model="requestModal.search.requestUri" placeholder="URI"></el-input>
        </el-form-item>
        <el-form-item label="测试域名">
          <el-input v-model="requestModal.search.testDomain" placeholder="测试域名"></el-input>
        </el-form-item>
        <el-form-item label="生产域名">
          <el-input v-model="requestModal.search.productDomain" placeholder="生产域名"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="loadData()">查询</el-button>
          <el-button type="primary" @click="requestModal.search = {}">重置</el-button>
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
        label="URL">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.requestUri }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="接口名">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.uname }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="项目"
        width="180">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.projectName }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="模块"
        width="180">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.moduleName }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="接口类型"
        width="180">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ scope.row.requestMethod }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="日期"
        width="180">
        <template slot-scope="scope">
          <i class="el-icon-time"></i>
          <span style="margin-left: 10px">{{ scope.row.createTime }}</span>
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
    <div class="block">
      <span class="demonstration">显示总数</span>
      <el-pagination
        @current-change="loadData()"
        :current-page.sync="pageData.pageNum"
        layout="total, prev, pager, next"
        :total="pageData.total">
      </el-pagination>
    </div>
    <request-operate :operateModal="requestModal" :loadData="loadData"></request-operate>

  </div>
</template>
<script>
  import RequestOperate from '@/page/project/requestOperate'

  export default {
    name: 'users',
    components: {RequestOperate},
    data() {
      return {
        loading: false,
        requestModal: {
          detail: {
            title: '请求详情',
            show: false
          },
          operate: {
            title: '请求添加',
            show: false,
            toOperate: {}
          },
          fields: {},
          search: {}
        },
        pageData: {}
      }
    },
    props: {
      moduleId: String
    },
    methods: {
      loadData(pageNum) {
        if (pageNum) this.requestModal.search.pageNum = pageNum;
        this.requestModal.search.pageNum = (pageNum?1:pageNum)
        this.requestModal.search.pageSize = 10
        if (this.moduleId) this.requestModal.search.apiModuleId = this.moduleId;
        this.$http.get(this.$store.state._api._api_request_page, {
          params: this.requestModal.search
        }).then(res => {
          if (res.status == 200) {
            this.pageData = res.data.data;
          }
        })
      },
      search() {
        this.userSearch.pageNum = 1;
        this.loadData();
      },
      cleanSearch() {
        this.userSearch = {}
      },
      modalSearch() {

      },
      detail(model) {
        this.$router.push({path: this.$store.state.routes._api_request_detail, query: {uid: model.uid}});
      },
      operateConfirm() {
        this.$http.post(this.requestModal.operate.url, {
          uid: this.request.uid,

        }).then(res => {
          console.log(res.data.data.size);
          this.loading = false;
          if (res.status == 200) {
            this.loadData();
          }
        })
      },
      beanOperate(operateType, row) {
        if (operateType == 1){
          this.requestModal.operate.url=this.$store.state._api._api_request_add
          this.requestModal.operate.show=true;
        }else if(operateType == 2) {
          this.requestModal.operate.url=this.$store.state._api._api_request_edit
          //获取详情
          this.$http.get(this.$store.state._api._api_request_detail + row.uid).then(res => {
            if (res.status == 200) {
              this.requestModal.operate.toOperate = res.data.data;
            }
          })
          this.requestModal.operate.show = true;
        } else if (operateType == 3) {
          //删除当前接口
          this.$http.post(this.$store.state._api._api_request_del + row.uid, {
            uid: row.uid
          }).then(res => {
            if (res.status == 200) {
              this.loadData();
              this.$message({
                // showClose: true,
                message: '成功删除',
                type: 'success'
              });
            }
          })
        }

      }
    },
    created() {
      this.loadData();
//      console.log("store module user :", this.$store.state.userModule.beansPage)
    },
    filters: {
      userMarkConvert: function (value) {

      }

    }
  }
</script>
<style type="text/css">

</style>
