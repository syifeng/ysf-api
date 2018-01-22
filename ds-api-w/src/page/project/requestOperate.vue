<template>
  <el-dialog
    :title="operateModal.operate.title"
    :visible.sync="operateModal.operate.show"
    width="60%">
    <el-form ref="form" :model="operateModal.operate.toOperate" label-width="80px" style="text-align: left;">
      <el-form-item label="接口名">
        <el-input v-model="operateModal.operate.toOperate.uname"></el-input>
      </el-form-item>
      <el-form-item label="接口URL">
        <el-input v-model="operateModal.operate.toOperate.requestUri"></el-input>
      </el-form-item>
      <el-form-item label="接口类型">
        <el-input v-model="operateModal.operate.toOperate.requestMethod"></el-input>
      </el-form-item>
      <el-form-item label="简介">
        <el-input type="textarea" v-model="operateModal.operate.toOperate.intro"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="operateConfirm">确定</el-button>
        <el-button @click="operateModal.operate.show = false">取消</el-button>
      </el-form-item>
    </el-form>
  </el-dialog>

</template>
<script>
  export default {
    data() {
      return {
        projectToOperate: {
          uid: '',
          uname: '',
          testDomain: '',
          productDomain: '',
          intro: '',
          createTime: ''
        },
      }
    },
    props: {operateModal:Object, loadData: Function},
    methods: {
      operateConfirm() {
        this.$http.post(this.operateModal.operate.url,{
          intro: this.operateModal.operate.toOperate.intro,
          requestMethod: this.operateModal.operate.toOperate.requestMethod,
          requestUri: this.operateModal.operate.toOperate.requestUri,
          responseStandard: this.operateModal.operate.toOperate.responseStandard,
          status: this.operateModal.operate.toOperate.status,
          uid: this.operateModal.operate.toOperate.uid,
          uname: this.operateModal.operate.toOperate.uname,
        }).then(res => {
          console.log(res)
          if(res.status == 200){
            this.operateModal.operate.show = false;
            this.$message({
              // showClose: true,
              message: '编辑成功',
              type: 'success'
            });
            this.loadData();
          }
        })
      }
    }
  }
</script>
