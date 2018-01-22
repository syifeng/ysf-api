import Vue from 'vue'
import Router from 'vue-router'
import routes from './api-routes'

Vue.use(Router)

const router = new Router({
  mode: 'history',
  base: 'ds-api',
  scrollBehavior: () => ({ y: 0 }),
  routes
})

export default router
