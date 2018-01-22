<template>
  <div>
    <div>
      <el-button @click="$router.go(-1)">返回</el-button>
      <el-button @click="edit">编辑</el-button>
    </div>
    <el-row :gutter="20">
      <el-col :span="4">
        <div class="info-label">接口名：</div>
      </el-col>
      <el-col :span="8">
        <div class="info-value">{{requestDetail.uname}}&nbsp;</div>
      </el-col>
      <el-col :span="4">
        <div class="info-label">类型：</div>
      </el-col>
      <el-col :span="8">
        <div class="info-value">{{requestDetail.requestMethod}}&nbsp;</div>
      </el-col>
      <el-col :span="4">
        <div class="info-label">接口请求：</div>
      </el-col>
      <el-col :span="8">
        <div class="info-value">{{requestDetail.requestUri}}&nbsp;</div>
      </el-col>
      <el-col :span="4">
        <div class="info-label">项目：</div>
      </el-col>
      <el-col :span="8">
        <div class="info-value">{{requestDetail.projectName}}&nbsp;</div>
      </el-col>
      <el-col :span="4">
        <div class="info-label">模块：</div>
      </el-col>
      <el-col :span="8">
        <div class="info-value">{{requestDetail.moduleName}}&nbsp;</div>
      </el-col>
      <el-col :span="4">
        <div class="info-label">简介：</div>
      </el-col>
      <el-col :span="8">
        <div class="info-value">{{requestDetail.intro}}&nbsp;</div>
      </el-col>
    </el-row>
    <el-tabs value="first">
      <el-tab-pane label="请求示例" name="first">
        <div class="json-block">
          {{requestDetail.apiResponseVo.requestParameters}}
        </div>
      </el-tab-pane>
      <el-tab-pane label="请求参数" name="second">
          <request-parameters :requestDetail="requestDetail" :loadData="loadModel"></request-parameters>
      </el-tab-pane>
      <el-tab-pane label="结果示例" name="third">
        <el-row :gutter="20">
          <div class="json-block"
               v-html="MyUtils.format_json(requestDetail.apiResponseVo.responseResult)">
          </div>
        </el-row>
      </el-tab-pane>
      <el-tab-pane label="结果参数" name="fouth">
        <response-fields :requestDetail="requestDetail" :loadData="loadModel"></response-fields>
      </el-tab-pane>
    </el-tabs>
    <request-operate :operateModal="requestModal" :loadData="loadModel"></request-operate>

  </div>
</template>

<script>
  import RequestParameters from "@/page/project/requestParameters";
  import ResponseFields from "@/page/project/responseFields";
  import RequestOperate from "@/page/project/requestOperate";

  export default {
    components: {RequestParameters, ResponseFields, RequestOperate},
    name: "detail",
    data() {
      return {
        requestDetail: {
          apiResponseVo: {},
          fieldVos: [],
          uid: '',
          uname: '',
          apiProjectId: 0,
          apiModuleId: '',
          requestUri: '',
          requestMethod: '',
          responseStandard: '',
          createTime: '',
          modifyTime: '',
          status: 0,
          intro: ''
        },
        requestModal: {
          operate: {
            title: '请求添加',
            show: false,
            toOperate: {}
          },
        },
      }
    },
    methods: {
      loadModel() {
        const uid = this.$route.query.uid
        this.$http.get(this.$store.state.api.request.detail + uid).then(res => {
          if (res.status == 200) {
            console.log(res);
            this.requestDetail = res.data.data;
          }
        })
      },
      edit(){
        this.requestModal.operate.url=this.$store.state.api.request.update;
        //获取详情
        // this.$http.get(this.$store.state.api.request.detail + this.$route.query.uid).then(res => {
        //   if (res.status == 200) {
        //     this.requestModal.operate.toOperate = res.data.data;
        //   }
        // })
        this.requestModal.operate.toOperate = this.requestDetail
        this.requestModal.operate.show = true;
      },

    },
    created() {
      this.loadModel();
    }
  }
</script>

<style scoped>

</style>
