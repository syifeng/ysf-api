import store from '@/store'
import bcs from '@/router/bc-routes'

/** 工具  */
const Alloy = () => import('@/components/tool/editor/alloyEditor')

const BC = () => import('@/page/index')

const routes = [
  {
    path: '/',
    component: BC
  },
  {
    path: '/bc/',
    name: 'api',
    component: BC,
    children: [...bcs]
  }
]

export default routes
