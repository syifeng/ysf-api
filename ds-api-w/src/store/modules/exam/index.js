const examModule = {
  state: {
    beansPage: {},
    bean: {},
    searchFields: {}
  },
  mutations: {
    loadBeans (state, val) {
      state.beanPage = {}
      console.log('student module load beans : ', state.beanPage)
    },
    loadBean (state, val) {
      state.bean = {}
      console.log('student module load bean : ', state.beanPage)
    }
  }
}
export default examModule
