import store from "../store";
import axios from "axios";
import qs from "qs";

const { interceptors } = axios;

axios.defaults.baseURL = store.state._base.base_url;
// axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
// common['Authorization'] = 'AUTH_TOKEN'
// common['Token'] = 'vue-token-0p2sid38c8ms93fa'
// post['Content-Type'] = 'application/x-www-form-urlencoded'
// axios.defaults.timeout = 10000;

const interceptorUrl = (config, store) => {
  const { url, method, data } = config;
  const patten = /role|resource|user|get_user|get_categorys/g;
  const except = /shops/g;
  const lock = url.split("/").some(t => {
    return patten.test(t);
  });

  const valid = url.split("/").some(t => {
    return except.test(t);
  });

  const locker = lock && !valid;

  // if (locker) {
  //   url.split(baseURL).forEach(url => {
  //     config.url = 'http://10.22.218.170:9091/api/auth' + url
  //   })
  // }
  if (method === "post" /* && !locker*/) {
    config.data = qs.stringify(data);
  }
  // handleLoading(config.url, 'req', store);
  return config;
};

/**
 *  @param { String } id The loading change the store loading id
 *  @param { String } type The type has two kinds, res, req
 *  @param { Object } store The store comes from vuex
 */

const handleLoading = (id, type, store) => {
  /*const { commit, state: { cms: { loading } } } = store;
  if ( type === 'req' && loading.show) {
    commit('CMS_SET_LOADING', { loading: { id } });
    return;
  }
  if (type === 'res' && loading.show && loading.id === id) {
    commit('CMS_SET_LOADING', { loading: { show: false, id: ''}});
    return;
  }
  commit('CMS_SET_LOADING', { loading: { show: false, id: ''}});*/
};

interceptors.request.use(
  function(config) {
    return interceptorUrl(config, store);
  },
  function(error) {
    return Promise.reject(error);
  }
);

interceptors.response.use(
  function(response) {
    handleLoading(response.config.url, "res", store);
    return response;
  },
  function(error) {
    handleLoading(error, "err", store);
    return error;
  }
);

export default axios;
