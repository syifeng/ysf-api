<template>
  <el-dialog
    :title="operateModal.title"
    :visible.sync="operateModal.show"
    width="60%">
    <el-form ref="form" :model="operateModal.toOperate" label-width="80px" style="text-align: left;">
      <el-form-item label="项目名">
        <el-input v-model="operateModal.toOperate.uname"></el-input>
      </el-form-item>
      <el-form-item label="测试域名">
        <el-input v-model="operateModal.toOperate.testDomain"></el-input>
      </el-form-item>
      <el-form-item label="生产域名">
        <el-input v-model="operateModal.toOperate.productDomain"></el-input>
      </el-form-item>
      <el-form-item label="简介">
        <el-input type="textarea" v-model="operateModal.toOperate.intro"></el-input>
      </el-form-item>
    </el-form>
    <el-button @click="operateModal.show = false">取 消</el-button>
    <el-button type="primary" @click="operateConfirm()">确 定</el-button>
  </el-dialog>
</template>
<script>
  export default {
    data() {
      return {
      }
    },
    props: {
      operateModal: Object,
      loadDatas: Function
    },
    methods: {
      operateConfirm () {
        this.$http.post(this.operateModal.url,{
          uid: this.operateModal.toOperate.uid,
          uname: this.operateModal.toOperate.uname,
          testDomain: this.operateModal.toOperate.testDomain,
          intro: this.operateModal.toOperate.intro,
        }).then(res => {
          if (res.status == 200) {
            this.operateModal.show = false;
            this.loadDatas();
          }
        })
      },
    }
  }
</script>
