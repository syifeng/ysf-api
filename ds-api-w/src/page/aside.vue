<template>
  <div>
    <div id="sidebar" class="nav-collapse " tabindex="5000" style="overflow: hidden; outline: none;">
      <!-- sidebar menu start-->
      <ul class="sidebar-menu">
        <li :class="{active: nodes.dashboard.nodeStatus}" @click="contentSwitch(nodes.dashboard)">
          <a class="" href="javaScript:void(0);">
            <!--<Icon type="home"></Icon>-->
            <sims-icon iconName="icon-zhuye2" iconType="2" iconSize="icon-sm"></sims-icon>
            <span>{{nodes.dashboard.nodeName}}</span>
          </a>
        </li>
        <li class="sub-menu" v-bind:class="{ active : node.nodeStatus, open : node.open }" v-for="(node, index) in nodes.list">
          <a href="javascript:;" class="" @click="node.nodeStatus = !node.nodeStatus">
            <!--<i class="icon-book"></i>-->
            <!--<Icon :type="node.nideIcon"></Icon>-->
            <sims-icon :iconName="node.nideIcon" iconType="2" iconSize="icon-sm"></sims-icon>
            <span v-text="node.nodeName">UI Elements</span>
            <span class="arrow"></span>
          </a>
          <ul class="sub" v-bind:class="{ asideSub : node.nodeStatus }">
            <li v-for="(nodeItem, key) in node.nodeChildren"  v-bind:class="{ active : nodeItem.nodeStatus }">
              <a class="" @click="contentSwitch(nodeItem)" href="javaScript:void(0);">{{nodeItem.nodeName}}</a>
            </li>
          </ul>
        </li>
      </ul>
      <!-- sidebar menu end-->
    </div>
  </div>
</template>
<script>
  import SimsIcon from '@/components/SimsIcon'
  export default {
    components: {SimsIcon},
    data () {
      return {
        theme2: 'light',
        menuActiveName: 'users',
        nodes: this.$store.state.nodes.admin
      }
    },
    methods:{
      contentSwitch(nodeItem){
        this.nodes.dashboard.nodeStatus=false;
        this.nodes.list.forEach(node => {
          node.open = false;
          node.nodeChildren.forEach(nodeChild =>{
            if(nodeChild.nodeCode != nodeItem.nodeCode){
              nodeChild.nodeStatus = false;
//              node.nodeStatus = true;

            }else {
              console.log(nodeChild.parentNode)
              nodeChild.parentNode = node
            }
          })
        })
        nodeItem.nodeStatus = true;
        this.$router.push({path:nodeItem.nodeUrl})
      },
      nodeFold(node){
        this.nodes.list.forEach(nodeItem => {
          if(node.nodeCode != nodeItem.nodeCode){
            nodeItem.open = false;
            nodeItem.nodeStatus=false;
          }
        })
        this.nodes.dashboard.nodeStatus=false;
        node.open= true;
        node.nodeStatus=true;
        console.log(node.nodeUrl)
        this.$router.push({path:node.nodeUrl})
        this.$store.commit("tabOpen", node)
//        console.log(node.nodeStatus)
      },
      menuSelected(d){
//        console.log(d);
        console.log(this.menuActiveName);
      },
      menuItemSelected(nodeChild){
//        console.log(d);
        console.log(nodeChild);
      }
    },
    created() {
      console.log(this.nodes);
    }
  }
</script>
<style scoped>

  @media screen  and (max-width: 800px) {
    #sidebar {
      position: relative;
      background: #2a3542;
    }
    ul.sidebar-menu {
      margin-top: 75px;
    }
  }
  @media screen  and (min-width: 800px) {
    #sidebar {
      width: 180px;
      height: 100%;
      position: relative;
      background: #2a3542;
    }
    ul.sidebar-menu {
      margin-top: 75px;
    }
  }
  .nav-collapse.collapse {
    display: inline;
  }

  ul.sidebar-menu , ul.sidebar-menu li ul.sub{
    margin: -2px 0 0;
    padding: 0;
  }



  #sidebar > ul > li > ul.sub {
    display: none;
  }
  #sidebar > ul > li > ul.asideSub{
    overflow: hidden;
    display: block;
  }
  #sidebar > ul > li.active > ul.sub, #sidebar > ul > li > ul.sub > li > a {
    display: block;
  }

  ul.sidebar-menu li ul.sub li{
    background: #35404D;
    margin-bottom: 0;
    margin-left: 0;
    margin-right: 0;
  }

  ul.sidebar-menu li ul.sub li:last-child{
    border-radius: 0 0 4px 4px;
    -webkit-border-radius: 0 0 4px 4px;
  }

  ul.sidebar-menu li ul.sub li a {
    font-size: 12px;
    padding: 0 0 0 32px;
    line-height: 35px;
    height: 35px;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    transition: all 0.3s ease;
    color: #737B83;
  }

  ul.sidebar-menu li ul.sub li a:hover, ul.sidebar-menu li ul.sub li.active a {
    color: #FF6C60;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    transition: all 0.3s ease;
    display: block;
  }

  ul.sidebar-menu li{
    line-height: 20px !important;
    margin-bottom: 5px;
    margin-left:10px;
    margin-right:10px;
  }

  ul.sidebar-menu li.sub-menu{
    line-height: 15px;
  }

  ul.sidebar-menu li a span{
    display: inline-block;
  }

  ul.sidebar-menu li a{
    color: #8b9199;
    text-decoration: none;
    display: block;
    padding: 15px 0 15px 10px;
    font-size: 12px;
    outline: none;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    transition: all 0.3s ease;
  }

  ul.sidebar-menu li.active a, ul.sidebar-menu li a:hover, ul.sidebar-menu li a:focus {
    background: #35404d;
    color: #fff;
    display: block;
    border-radius: 4px;
    -webkit-border-radius: 4px;

    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    transition: all 0.3s ease;
  }


  ul.sidebar-menu li a i {
    font-size: 15px;
    padding-right: 6px;
  }

  ul.sidebar-menu li a:hover i, ul.sidebar-menu li a:focus i {
    color: #FF6C60;
  }

  ul.sidebar-menu li.active a i {
    color: #FF6C60;
  }


  #sidebar ul > li > a .arrow {
    border-bottom: 4px solid transparent;
    border-left: 4px solid #A0A0A0;
    border-top: 4px solid transparent;
    float: right;
    height: 0;
    margin-right: 10px;
    margin-top: 6px;
    width: 0;
  }

  #sidebar > ul > li > a .arrow.open {
    border-left: 4px solid transparent;
    border-right: 4px solid transparent;
    border-top: 5px solid #A0A0A0;
    float: right;
    height: 0;
    margin-right: 10px;
    margin-top: 8px;
    width: 0;
  }

  #sidebar ul > li.active > a .arrow, #sidebar ul > li > a:hover .arrow, #sidebar ul > li > a:focus .arrow {
    float: right;
    margin-top: 6px;
    margin-right: 10px;
    width: 0;
    height: 0;
    border-left: 4px solid #fff;
    border-top: 4px solid transparent;
    border-bottom: 4px solid transparent;
  }

  #sidebar > ul > li.active > a .arrow.open, #sidebar > ul > li > a:hover .arrow.open, #sidebar > ul > li > a:focus .arrow.open {
    float: right;
    margin-top: 8px;
    margin-right: 10px;
    width: 0;
    height: 0;
    border-top: 5px solid #fff;
    border-left: 4px solid transparent;
    border-right: 4px solid transparent;
  }

  .mail-info, .mail-info:hover {
    margin: 0px 6px 0 0;
    font-size: 11px;
  }

  /*main content*/
</style>
