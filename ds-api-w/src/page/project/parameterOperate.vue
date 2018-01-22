<template>
  <el-dialog
    :title="operateModal.title"
    :visible.sync="operateModal.show"
    width="60%">
    <el-form ref="form" :model="operateModal.toOperate" label-width="80px" style="text-align: left;">
      <el-form-item label="字段名">
        <el-input v-model="operateModal.toOperate.uname"></el-input>
      </el-form-item>
      <el-form-item label="字段key">
        <el-input v-model="operateModal.toOperate.fieldKey"></el-input>
      </el-form-item>
      <el-form-item label="字段value">
        <el-input v-model="operateModal.toOperate.fieldValue"></el-input>
      </el-form-item>
      <el-form-item label="字段类型">
        <el-select v-model="operateModal.toOperate.fieldType">
          <el-option
            v-for="item in options"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </el-form-item>
    </el-form>
    <el-button @click="operateModal.show = false">取 消</el-button>
    <el-button type="primary" @click="operateConfirm()">确 定</el-button>
  </el-dialog>
</template>
<script>
  export default {
    data() {
      return {//1-String，2-Integer，3-Double， 4-Float，5-Long，6-Boolean，7-Date
        options: [{
          value: 'String',
          label: '字符串'
        }, {
          value: 'Integer',
          label: '整数'
        }, {
          value: 'Double',
          label: '双精度'
        }, {
          value: 'Float',
          label: '浮点数'
        }, {
          value: 'Long',
          label: '长整型'
        }, {
          value: 'Boolean',
          label: '布尔'
        }, {
          value: 'Date',
          label: '日期'
        }],
        value: 'String'
      }
    },
    props: {
      operateModal: Object,
      loadData: Function
    }
    ,
    methods: {
      operateConfirm() {
        this.$http.post(this.operateModal.url, {
          uid: this.operateModal.toOperate.uid,
          uname: this.operateModal.toOperate.uname,
          testDomain: this.operateModal.toOperate.testDomain,
          intro: this.operateModal.toOperate.intro,
        }).then(res => {
          if (res.status == 200) {
            this.operateModal.show = false;
            this.loadData();
          }
        })
      }
      ,
    }
  }
</script>
