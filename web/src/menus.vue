<template>
  <div>
    <div>
      <div style="height: 169px;background: url('../static/images/zheng-upms.png')">
        <img src="../static/images/avatar.jpg" style="border-radius: 30px;margin-top: 10px;margin-left: 10px"/>
        <div style="margin-top: 70px;height: 30px;background-color:rgba(0,0,0,0.5);">
          <span style="color: white;line-height: 30px;padding-left: 10px;font-size: 20px;
              ">{{getUser.name}} , 您好！</span>
        </div>
      </div>
      <el-menu :router="false" class="el-menu-vertical-demo">
        <template v-for="item in menus">
          <template v-if="item.url">
            <router-link :to="{ path: item.url, exact: true}" >
              <el-menu-item  :index="item.menuid"><i class="el-icon-menu"></i>{{item.name}}</el-menu-item>
            </router-link>
          </template>
          <template v-else>
            <el-submenu :index="item.menuid">
              <template slot="title">
                <i class="el-icon-location"></i>
                <span>{{item.name}}</span>
              </template>
              <template v-for="items in item.subMenu">
                <router-link :to="{ path: items.url, exact: true}" >
                  <el-menu-item  :index="items.menuid"><i class="el-icon-menu"></i>{{items.name}}</el-menu-item>
                </router-link>
              </template>
            </el-submenu>
          </template>
        </template>
      </el-menu>
    </div>
  </div>
</template>
<style>
</style>
<script>
  import {menuMixin} from './assets/util/menuMixin'
  import subMenu from './subMenu.vue'
  import {GET_ALLMENUS, GET_MENUS, GET_MSG, GET_PATHS, GET_USER} from "./store/mutations";
  import { mapGetters} from 'vuex'
  export default{
    data () {
      return {
      }
    },
    computed:{
      ...mapGetters([
        GET_USER,GET_MENUS,GET_ALLMENUS,GET_MSG,GET_PATHS
      ])
    },
    name: 'menus',
    props: ['menus'],
    created: function () {
    },
    components: {
      subMenu
    },
    mixins: [menuMixin]
  }
</script>
<style>

</style>
