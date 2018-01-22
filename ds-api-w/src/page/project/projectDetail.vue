<template>
  <div>
    <div>
      <el-button @click="$router.go(-1)">返回</el-button>
    </div>
    <el-row :gutter="20">
      <el-col :span="4">
        <div class="info-label">项目名：</div>
      </el-col>
      <el-col :span="8">
        <div class="info-value">{{projectDetail.uname}}&nbsp;</div>
      </el-col>
      <el-col :span="4">
        <div class="info-label">项目编码：</div>
      </el-col>
      <el-col :span="8">
        <div class="info-value">{{projectDetail.hostName}}&nbsp;</div>
      </el-col>
      <el-col :span="4">
        <div class="info-label">测试域名：</div>
      </el-col>
      <el-col :span="8">
        <div class="info-value">{{projectDetail.testDomain}}&nbsp;</div>
      </el-col>
      <el-col :span="4">
        <div class="info-label">简介：</div>
      </el-col>
      <el-col :span="8">
        <div class="info-value">{{projectDetail.intro}}&nbsp;</div>
      </el-col>
    </el-row>
    <el-tabs value="first">
      <el-tab-pane label="模块" name="first">
        <data-module
          :projectId="$route.query.uid">
        </data-module>
      </el-tab-pane>
    </el-tabs>

  </div>
</template>

<script>
  import DataModule from '@/page/project/modules'
  import ElButton from "element-ui/packages/button/src/button";

  export default {
    name: "project-detail",
    components: {
      ElButton,
      DataModule
    },
    data() {
      return {
        projectDetail: {},
        modulesPage: {},
        moduleModal: {
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
      }
    },
    methods: {
      loadModel() {
        const uid = this.$route.query.uid
        this.$http.get(this.$store.state.api.pro.detail + uid, {
          params: {uid: uid}
        }).then(res => {
          if (res.status == 200) {
            console.log(res);
            this.projectDetail = res.data.data;
          }
        })
      },
      loadModules(pageNum) {
        if (pageNum) this.moduleModal.search.pageNum = pageNum;
        const uid = this.$route.query.uid
        this.moduleModal.search.apiProjectId = uid;
        this.$http.get(this.$store.state.api.module.page, {
          params: this.moduleModal.search
        }).then(res => {
          if (res.status == 200) {
            console.log(res);
            this.modulesPage = res.data.data;
          }
        })
      },
      beanOperate(operateType, row) {
        if (operateType == 1) {
          this.moduleModal.operate.url = this.$store.state.api.module.insert
        } else if (operateType == 2) {
          this.moduleModal.operate.url = this.$store.state.api.module.update
          this.$http.get(this.$store.state.api.module.detail + row.uid).then(res => {
            console.log(res)
            if (res.status == 200) {
              this.moduleModal.operate.toOperate = res.data.data;
            }
          })
          this.moduleModal.operate.show = true;
        }
        if (operateType == 1) {
          this.moduleModal.operate.toOperate = {}
        } else if (operateType == 1) {
          this.moduleModal.operate.toOperate = {}
        } else {

        }
      }

    },
    created() {
      this.loadModel();
      this.loadModules();
    }
  }
</script>

<style scoped>

</style>
