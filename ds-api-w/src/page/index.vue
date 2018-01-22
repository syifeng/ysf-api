<template>
  <el-container>
    <!--<sims-header class="sims-top"></sims-header>-->
      <el-aside style="width: 180px; background: #2a3542;">
        <sims-aside></sims-aside>
      </el-aside>
      <el-main>
        <sims-content></sims-content>
      </el-main>
  </el-container>
</template>
<script type="text/javascript">
  import simsHeader from '@/page/header'
  import simsAside from '@/page/aside'
  import simsContent from '@/page/content'
  export default{
    data () {
      return {

      }
    },
    components:{
      simsHeader,
      simsAside,
      simsContent
    }
  }
</script>
<style type="text/css">
  .el-container{
    width: 100%;
    height: 100%;
  }
  @media screen and (min-width: 800px) {
    .sims-top{
      position: fixed;
      width: 100%;
      height: 60px;
      border-bottom: 1px solid #eee;
      z-index: 10;
    }
    .sims-aside{
      width: 180px;
      height: 100%;
      position: fixed;
      top: 60px;
      left: 0px;
      bottom: 0px;
      background: #2a3542;
      overflow-y: auto;
    }
    .content-box{
      position: fixed;
      top: 60px;
      bottom: 0px;
      left: 0px;
      width: 100%;
    }
    .sims-content{
      height: 100%;
      overflow-y: auto;
      padding: 30px 20px;
      margin-left: 180px;
    }
  }
  @media screen and (max-width: 800px) {
    .sims-top{
      position: relative;
      width: 100%;
      border-bottom: 1px solid #eee;
      z-index: 10;
    }
    .sims-aside{
      display: none;
    }
    .content-box{
      position: relative;
      width: 100%;
    }
    .sims-content{
      height: 100%;
      overflow-y: auto;
      padding: 30px 20px;
    }
  }
</style>
