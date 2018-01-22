import _base from './state-base'
import _api from './state-api'

const state = {
  count: 0,
  _api,
  _base,
  routes: {
    _api_project_detail: '/bc/project/projectdetail',
    _api_module_detail: '/bc/project/moduledetail',
    _api_request_detail: '/bc/project/requestdetail'
  },
  nodes: {
    admin: {
      dashboard: {
        nodeName: '控制台',
        nodeCode: 'dashboard',
        nodeStatus: false,
        nodeId: '',
        nodeUrl: '/bc/dashboard/overview'
      },
      list: [
        {
          nodeName: '项目管理',
          nodeCode: 'user',
          nodeStatus: false,
          open: false,
          nodeId: '',
          nideIcon: 'icon-icon_yonghuguanli',
          nodeUrl: '/bc/user/userBoard',
          nodeChildren: [
            {
              nodeName: '所有项目',
              nodeCode: 'projects',
              nodeStatus: false,
              nodeId: 'projects',
              nodeUrl: '/bc/project/projects'
            },
            {
              nodeName: '所有模块',
              nodeCode: 'modules',
              nodeStatus: false,
              nodeId: 'modules',
              nodeUrl: '/bc/project/modules'
            },
            {
              nodeName: '所有接口',
              nodeCode: 'requests',
              nodeStatus: false,
              nodeId: 'requests',
              nodeUrl: '/bc/project/requests'
            }
          ]

        }
      ]
    },
  },
}

export default state
