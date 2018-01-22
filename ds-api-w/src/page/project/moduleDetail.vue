<template>
  <div>
    <div>
      <el-button @click="$router.go(-1)">返回</el-button>
      <el-button @click="edit">编辑</el-button>
    </div>
    <el-row :gutter="20">
      <el-col :span="4">
        <div class="info-label">模块名称：</div>
      </el-col>
      <el-col :span="8">
        <div class="info-value">{{moduleDetail.uname}}&nbsp;</div>
      </el-col>
      <el-col :span="4">
        <div class="info-label">所属项目：</div>
      </el-col>
      <el-col :span="8">
        <div class="info-value">{{moduleDetail.projectName}}&nbsp;</div>
      </el-col>
      <el-col :span="4">
        <div class="info-label">模块编码：</div>
      </el-col>
      <el-col :span="8">
        <div class="info-value">{{moduleDetail.apiCode}}&nbsp;</div>
      </el-col>
      <el-col :span="4">
        <div class="info-label">简介：</div>
      </el-col>
      <el-col :span="8">
        <div class="info-value">{{moduleDetail.intro}}&nbsp;</div>
      </el-col>
    </el-row>
    <el-tabs value="first">
      <el-tab-pane label="模块" name="first">
        <data-request
          :moduleId="$route.query.uid">
        </data-request>
      </el-tab-pane>
    </el-tabs>
    <module-operate
      :moduleModal="moduleModal"
      :loadData="loadModel">
    </module-operate>
  </div>
</template>

<script>
  import DataRequest from '@/page/project/requests'
  import ModuleOperate from '@/page/project/moduleOperate'

  export default {
    name: "module-detail",
    components: {
      DataRequest,
      ModuleOperate
    },
    data() {
      return {
        moduleDetail: {},
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
        this.$http.get(this.$store.state.api.module.detail + uid, {
          params: {uid: uid}
        }).then(res => {
          if (res.status == 200) {
            console.log(res);
            this.moduleDetail = res.data.data;
          }
        })
      },
      edit() {
        this.moduleModal.operate.url = this.$store.state.api.module.update
        this.moduleModal.operate.toOperate = this.moduleDetail
        this.moduleModal.operate.show = true;
      }
    },
    created() {
      this.loadModel();
    }
  }
</script>

<style scoped>

</style>
