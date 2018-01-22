// import * as types from './mutation-types'
export default {
  asyncIncrement ({commit}, {amount = 1, index, delay}) {
    setTimeout(() => {
      commit('increment', {amount, index})
    }, delay)
  }
}
