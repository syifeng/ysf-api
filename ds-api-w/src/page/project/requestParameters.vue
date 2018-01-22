<template>
  <div>
    <el-table
      :data="requestDetail.parameterVos"
      border
      style="width: 100%">
      <el-table-column
        prop="uname"
        label="字段名"
        width="180">
      </el-table-column>
      <el-table-column
        prop="fieldKey"
        label="键"
        width="180">
      </el-table-column>
      <el-table-column
        prop="fieldValue"
        label="值"
        width="180">
      </el-table-column>
      <el-table-column
        label="类型">
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{fieldTypeFilter(scope.row.fieldType)}}</span>
        </template>
      </el-table-column>
      <el-table-column
        prop="fieldGrade"
        label="层级">
      </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
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
    <parameter-operate
      :operateModal="fieldModal.operate"
      :loadData="loadData">

    </parameter-operate>
  </div>
</template>

<script>
  import ParameterOperate from "@/page/project/parameterOperate";

  export default {
    components: {ParameterOperate},
    name: "request-fields",
    data() {
      return {
        fieldModal: {
          operate: {
            title: '添加/编辑',
            show: false,
            type: 1,
            url: '',
            toOperate: {}
          },
          fields: {},
          search: {}
        },
      }
    },
    props: {
      requestDetail: Object,
      loadData: Function
    },
    methods: {
      fieldTypeFilter(cellValue) {
        if (!cellValue) return '';
        switch (cellValue) {
          case 1:
            return 'String';
          case 2:
            return 'Integer';
          case 3:
            return 'Double';
          case 4:
            return 'Float';
          case 4:
            return 'Long';
          case 6:
            return 'Boolean';
          case 7:
            return 'Date'
        }
      },
      // loadData() {},
      beanOperate(operateType, val) {
        if (operateType == 1) {
          this.fieldModal.operate.url = this.$store.state._api._api_parameter_add
          this.fieldModal.operate.show = true;
        } else if (operateType == 2) {
          this.fieldModal.operate.url = this.$store.state._api._api_parameter_edit
          //获取详情
          this.$http.get(this.$store.state._api._api_parameter_detail + val.uid).then(res => {
            if (res.status == 200) {
              this.fieldModal.operate.toOperate = res.data.data;
            }
          })
          this.fieldModal.operate.show = true;
        } else if (operateType == 3) {
          //删除当前接口
          this.$http.post(this.$store.state._api._api_parameter_del + row.uid, {
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
    }
  }
</script>

<style scoped>

</style>
