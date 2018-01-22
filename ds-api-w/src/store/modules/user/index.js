import studentModule from './student'
const userModule = {
  state: {
    beansPage: {
    },
    bean: {},
    searchFields: {
      userName: '',
      userType: 0,
      userLevel: '',
      nickname: '',
      age: '',
//          birth: '',
      gender: '',
      mobileNum: '',
      email: '',
      qqNum: '',
      schoolId: 0,
      gradeId: 0,
      classId: 0,
      countryId: 0,
      countryName: '',
      provinceId: 0,
      provinceName: '',
      cityId: 0,
      cityName: '',
      townId: 0,
      townName: '',
      address: '',
      pageNum: 1,
      pageSize: 12
    }
  },
  mutations: {
    loadBeans (state, val) {
      state.beansPage = {}
    }
  },
  modules: {
    studentModule
  }
}
export default userModule
