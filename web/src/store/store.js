/**
 * Created by C168 on 2016/12/19.
 */

import Vue from 'vue'
import Vuex from 'vuex'
import tagsView from "./tagView";
Vue.use(Vuex)
const store = new Vuex.Store({
  modules: {
    tagsView
  },
  state: {
    user: null,
    menus: null,
    allMenus: null,
    msg: null,
    token: null,
    client: null,

  },
  getters: {
    getUser: function (state) {
      return state.user
    },
    getMenus: function (state) {
      return state.menus
    },
    getAllMenus: function (state) {
      return state.allMenus
    },
    getMsg: function (state) {
      return state.msg
    },
    getToken: function (state) {
      return state.token
    },
    getClient: function (state) {
      return state.client
    },
    visitedViews: state => state.tagsView.visitedViews,
    cachedViews: state => state.tagsView.cachedViews,

  },
  mutations: {
    setUser: function (state, user) {
      // console.log("setUser");
      state.user = user
    },
    setMenus: function (state, menus) {
      // console.log("setMenus");
      state.menus = menus
    },
    setAllMenus: function (state, allMenus) {
      // console.log("setAllMenus");
      state.allMenus = allMenus
    },
    setMsg: function (state, msg) {
      // console.log("setMsg");
      state.msg = msg
    },
    setToken: function (state, token) {
      // console.log("setMsg");
      state.token = token
    },
    setClient: function (state, client) {
      // console.log("setMsg");
      state.client = client
    },
    setLoginOut: function (state) {
      // console.log("setLoginOut");
      state.user = null
      state.menus = null
      state.allMenus = null
      state.token=null
      state.client=null
    }
  },

  strict: process.env.NODE_ENV !== 'production' // 是否开启严格模式
})

export default store
