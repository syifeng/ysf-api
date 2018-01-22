import Vue from 'vue'
import Vuex from 'vuex'
import actions from './actions'
import state from './state/state'
import mutations from './mutations'

Vue.use(Vuex)
const store = new Vuex.Store({
  state,
  mutations,
  actions
})

export default store
