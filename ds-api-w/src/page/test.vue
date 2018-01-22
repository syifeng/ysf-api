<template>
	<div>
		<Button @click="open(false)">按鈕</Button>
    <div class="" @click="view()">测试</div>
<transition enter-active-class="animated rotateIn" leave-active-class="animated slideOutDown">
       <div v-if="test.show" style="width: 60px; height: 80px; background: #eee;">測試部分</div>
  </transition> 
	</div>
</template>

<script type="text/javascript">
  export default{
    data () {
      return {
        test:{
          show:false
        }
      }
    },
    transitions: {
    bounce: {
      enterClass: 'bounceInLeft',
      leaveClass: 'bounceOutRight'
      }
    },
    methods: {
      view () {
        console.log("test")
        this.test.show=!this.test.show;
      },
      open (nodesc) {
        this.test.show=!this.test.show;
        /*this.$Notice.open({
          title : '这是通知标题',
          desc : nodesc ? '' : '这里是通知描述这里,是通知描述这里是通知描述这里,是通知描述这里,是通知描述这里是通知描述这里是通知描述'
        })*/
      }
    }
  }
</script>
