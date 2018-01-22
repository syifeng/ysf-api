// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import http from './http'
import ElementUI from 'element-ui'
import router from './router'
import store from './store'
import 'element-ui/lib/theme-chalk/index.css'
import App from './App.vue'
import MyUtils from './tool/utils.js'

Vue.use(ElementUI)
Vue.prototype.$http = http
Vue.prototype.MyUtils = MyUtils
new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
