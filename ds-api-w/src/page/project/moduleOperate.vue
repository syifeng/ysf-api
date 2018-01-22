<template>
  <el-dialog
    :title="moduleModal.operate.title"
    :visible.sync="moduleModal.operate.show"
    width="60%">
    <el-form ref="form" :model="moduleModal.operate" label-width="80px" style="text-align: left;">
      <el-form-item label="模块名称">
        <el-input v-model="moduleModal.operate.toOperate.uname"></el-input>
      </el-form-item>
      <el-form-item label="模块编码">
        <el-input v-model="moduleModal.operate.toOperate.apiCode"></el-input>
      </el-form-item>
      <el-form-item label="简介">
        <el-input type="textarea" v-model="moduleModal.operate.toOperate.intro"></el-input>
      </el-form-item>
    </el-form>
    <el-button @click="moduleModal.operate.show = false">取 消</el-button>
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
      moduleModal: Object,
      loadData: Function
    },
    methods: {
      operateConfirm () {
        this.$http.post(this.moduleModal.operate.url,{
          uid: this.moduleModal.operate.toOperate.uid,
          uname: this.moduleModal.operate.toOperate.uname,
          apiCode: this.moduleModal.operate.toOperate.apiCode,
          intro: this.moduleModal.operate.toOperate.intro,
        }).then(res => {
          if (res.status == 200) {
            this.moduleModal.operate.show = false;
            this.loadData();
          }
        })
      },
    }
  }
</script>
