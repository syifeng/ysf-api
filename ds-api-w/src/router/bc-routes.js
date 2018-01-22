const Overview = () => import('@/page/overview')
/**  用户管理 **/
const Projects = () => import('@/page/project/projects')
const ProjectDetail = () => import('@/page/project/projectDetail')
const Modules = () => import('@/page/project/modules')
const ModuleDetail = () => import('@/page/project/moduleDetail')
const Requests = () => import('@/page/project/requests')
const RequestDetail = () => import('@/page/project/requestDetail')


const system = 'bc'
const children = []
const catalog = [
  {
    module: 'dashboard',
    views: {Overview}
  },
  {
    module: 'project', //
    views: {Projects, Modules, Requests, ProjectDetail, ModuleDetail,RequestDetail}
  }
]

catalog.forEach((group) => {
  const {module, views} = group
  Object.entries(views).forEach(([name, comp]) => {
    const route = {}
    const pattern = /[A-Z][a-z]+/g
    route.path = `${module}/${name.toLowerCase()}`
    route.name = `${system}_${name.match(pattern).map(str => str.toUpperCase()).join('_')}`
    route.component = comp
    // console.log(route)
    children.push(route)
  })
})

export default children
