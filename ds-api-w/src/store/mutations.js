const mutations = {
  increment ({scores}, {amount = 1, index = 0}) {
    let metric = scores[index]
    metric.value = Math.max(Math.min(metric.value + amount, metric.max), 0)
  },
  tabSwitch (state, val1) {
    console.log(val1)
    if (val1.nodeCode === 'dashboard') {
      state.simsBreads[1].title = ''
      state.simsBreads[2].title = ''
    } else {
      state.simsBreads[1].title = val1.parentNode.nodeName
      state.simsBreads[1].url = val1.parentNode.nodeUrl
      state.simsBreads[2].title = val1.nodeName
      state.simsBreads[2].url = val1.nodeUrl
    }
  },
  tabOpen (state, val1) {
    console.log(val1)
    if (val1.nodeCode === 'dashboard') {
      state.simsBreads[1].title = ''
      state.simsBreads[2].title = ''
    } else {
      state.simsBreads[1].title = val1.nodeName
      state.simsBreads[1].url = val1.nodeUrl
      state.simsBreads[2].title = ''
    }
  }
}
export default mutations
