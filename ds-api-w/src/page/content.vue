<template>
  <div >
    <router-view></router-view>
  </div>
</template>
<script>
  export default {
    data () {
      return {
        value1: '1',
        loading: false,
        simsBreads:this.$store.state.simsBreads,
        intro: {
          title: '文章模块',
          content: '文章模块主要为网站内容提供相关的新闻，通知等图文信息，文章可编辑标题、封面图、摘要、作者、正文内容等，亦可针对文章添加相关标签是文章更富针对性'
        }
      }
    }
  }
</script>
<style type="text/css">
  .main{
    padding-top: 10px;
    width: 100%;
  }
  .content-bread{
    margin-bottom: 20px;
  }
  .content-oper-box{
    margin-bottom: 20px;
    min-width: 900px;
    overflow-y: auto;
  }
  .content-table{
    min-width: 900px;
    overflow-y: auto;
  }
  .ivu-poptip-popper[x-placement^=bottom] .ivu-poptip-arrow:after {
    content: " ";
    top: 1px;
    margin-left: -5px;
    border-top-width: 0;
    border-bottom-color: #18b566;
  }
  .ivu-poptip-inner {
    background-color: #18b566;
  }
</style>
