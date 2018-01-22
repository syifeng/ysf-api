<template>
  <div v-bind:style="{backgroundImage: 'url(' + loginBg + ')'}" class="login-box">
    <!--<img :src="loginBg"/>-->
    <Form ref="formInline" :model="formInline" :rules="ruleInline" class="login-panel">
      <Form-item prop="user">
        <Input type="text" v-model="formInline.user" placeholder="Username">
        <Icon type="ios-person-outline" slot="prepend"></Icon>
        </Input>
      </Form-item>
      <Form-item prop="password">
        <Input type="password" v-model="formInline.password" placeholder="Password"> <Icon type="ios-locked-outline" slot="prepend"></Icon> </Input>
      </Form-item>
      <Form-item>
        <Button type="primary" @click="handleSubmit('formInline')">登录</Button>
      </Form-item>
    </Form>
    <!--<vue-particles color="#dedede" class="login-bg"></vue-particles>-->
  </div>
</template>
<script>
  export default {
    data () {
      return {
        loginBg: require('@/assets/login-bg.png'),
        formInline: {
          user: '',
          password: ''
        },
        ruleInline: {
          user: [
            { required: true, message: '请填写用户名', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '请填写密码', trigger: 'blur' },
            { type: 'string', min: 6, message: '密码长度不能小于6位', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      handleSubmit(name) {
        this.$refs[name].validate((valid) => {
          if (valid) {
            if(this.formInline.user !='' && this.formInline.password=='sims147258'){
              this.$store.state.userOn.loginStatus = true;
              if(this.formInline.user=='admin'){
                this.$store.state.userOn.userType= 95;
                this.$store.state.nodeOn = this.$store.state.nodes.admin
                this.$router.push({path:"/bc/dashboard/overview"})
              }else if(this.formInline.user=='student'){
                this.$store.state.userOn.userType= 1;
                this.$store.state.nodeOn = this.$store.state.nodes.student
                this.$router.push({path:"/stu/dashboard/overview"})
              }else if(this.formInline.user=='teacher'){
                this.$store.state.userOn.userType= 2;
                this.$store.state.nodeOn = this.$store.state.nodes.teacher
              }else if(this.formInline.user=='staff'){
                this.$store.state.userOn.userType= 3;
                this.$store.state.nodeOn = this.$store.state.nodes.staff
              }else if(this.formInline.user=='parent'){
                this.$store.state.userOn.userType= 4;
                this.$store.state.nodeOn = this.$store.state.nodes.parent
              }else {
                this.$Message.error('用户名错误!');
              }
              console.log(this.$store.state.nodeOn);
            }else {
              this.$Message.error('用户名密码错误!');
            }
          } else {
            this.$Message.error('表单验证失败!');
          }
        })
      }
    },
    created() {
      const config = {
        title: '登录提示',
        content: '<p>提示：系统登录用户名不同，后台展示内容有差别</p></br>' +
        '<p>以admin用户名登录，展示整体管理后台</p></br>' +
        '<p>以student用户名登录，展示学生个人中心</p></br>' +
        '<p>以teacher用户名登录，展示教师个人管理中心</p></br>' +
        '<p>以staff用户名登录，展示教务个人管理中心</p></br>' +
        '<p>以parent用户名登录，展示家长个人管理中心</p></br>',
        okText: 'OK'
      }
      this.$Modal.confirm(config)
    }
  }
</script>
<style type="text/css">
  @media screen and (min-width: 800px){
    .login-panel{
      margin: 300px 60%;
      width: 260px;
      height: 230px;
      padding: 50px;
      border: 1px solid #eee;
      border-radius: 5px;
      z-index: 100;
      background: #fff;
      position: relative;
    }
  }
  @media screen and (max-width: 800px){
    .login-panel{
      margin: 100px auto;
      width: 260px;
      height: 230px;
      padding: 50px;
      border: 1px solid #eee;
      border-radius: 5px;
      z-index: 100;
      background: #fff;
      position: relative;
    }
  }
  .login-bg{
    background: #1c2438;
    z-index: auto;
    position: fixed;
    top: 0px;
    left: 0px;
    bottom: 0px;
    width: 100%;
  }
  .login-box{
    background-position-x: 0px;
    background-position-y: 10%;
    background-repeat: no-repeat;
  }
</style>
