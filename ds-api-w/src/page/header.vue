<template>
  <div>
    <div class="clearfix">
      <div class="top-logo">
        <sims-icon iconName="icon-xuexiao" iconType="2" iconSize="icon-l"></sims-icon>
        <span style="font-size: 30px;">闫李小学</span>
      </div>
      <Carousel class="top-adv-carousel"
        v-model="value3"
        :autoplay="setting.autoplay"
        :autoplay-speed="setting.autoplaySpeed"
        :dots="setting.dots"
        :trigger="setting.trigger"
        :arrow="setting.arrow">
        <CarouselItem>
          <div class="demo-carousel">1</div>
        </CarouselItem>
        <CarouselItem>
          <div class="demo-carousel">2</div>
        </CarouselItem>
        <CarouselItem>
          <div class="demo-carousel">3</div>
        </CarouselItem>
        <CarouselItem>
          <div class="demo-carousel">4</div>
        </CarouselItem>
      </Carousel>
      <Dropdown trigger="click" class="top-user">
        <a href="javascript:void(0)">
          admin
          <Icon type="person"></Icon>
        </a>
        <Dropdown-menu slot="list">
          <Dropdown-item>个人中心</Dropdown-item>
          <Dropdown-item @on-click="logout">注销</Dropdown-item>
        </Dropdown-menu>
      </Dropdown>
    </div>
    <div class="sims-top-nav">
      <sims-aside class="sims-top-nav-panel" v-if="headNavActive"></sims-aside>
      <div class="sims-top-nav-button" @click="navFold()">展开</div>
    </div>
  </div>
</template>
<script>
  import SimsIcon from '@/components/SimsIcon'
  import SimsAside from '@/page/aside'
  export default {
    components: {SimsIcon, SimsAside},
    data () {
      return {
        theme1: 'light',
        topIcon: '#icon-Cathedral',
        headNavActive: false,
        value3: 0,
        setting: {
          autoplay: true,
          autoplaySpeed: 3000,
          dots: 'none',
          trigger: 'click',
          arrow: 'never'
        }
      }
    },
    methods:{
      logout(){
        this.$router.state.userOn.loginStatus = false;
        this.$router.push({path: '/bc/login'})
      },
      navFold() {
        this.headNavActive = !this.headNavActive ;
      }
    }
  }
</script>
<style>
  .top-logo{
    height: 100%;
    float: left;
    width: 250px;
  }
  .top-user{
    float: right;
    line-height: 60px;
    margin-right: 20px;
  }
  .sims-top-nav-button{
    width: 100%;
    text-align: center;
    height: 30px;
    line-height: 30px;
  }
  @media screen  and (min-width: 800px) {
   .sims-top-nav{
     display: none;
   }
  }
  .top-adv-carousel{
    background: #f2f2f2;
    float: left;
    width: 250px;
    height: 60px;
  }
</style>
