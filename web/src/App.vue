<template>
  <div id="App">
    <!--<img src="./assets/logo.png">
    <router-view></router-view>-->
    <!--<Test class="main"></Test>-->
    <template v-if="!goLogin">
      <el-container style="height: 966px; ">
        <el-header style="font-size: 12px;background-color:#138e5e">
          <img src="../static/images/logo_image.png" style="padding-top: 10px"/>
          <div style="float: right;padding-top: 15px">
            <screenfull style="position: absolute;top: 20px;right: 300px"></screenfull>
            <themepicker style="font-size: 30px;color: white;margin-right: 40px"></themepicker>
            <i class="el-icon-search" style="font-size: 30px;color: white;margin-right: 40px"></i>
            <i class="el-icon-share"  style="font-size: 30px;color: white;margin-right: 40px"></i>
            <i class="el-icon-circle-close" @click="logout"  style="font-size: 30px;color: white"></i>
          </div>
        </el-header>


        <el-container>
          <el-aside width="268px" style="border-right: 1px solid #eee">
            <menus :menus="getMenus"></menus>
          </el-aside>
          <el-main>
            <TagView style="margin-bottom: 15px"></TagView>
            <router-view></router-view>
          </el-main>
        </el-container>
      </el-container>


    </template>
    <template v-else>
      <login  v-on:loginchange="loginchange"></login>
    </template>

  </div>
</template>
<style>
  a{
    text-decoration: none;
  }
</style>
<script>
  import themepicker from './components/common/ThemePicker'
  import TagView from './components/common/TagView'
  import screenfull from './components/common/screenfull'
  import Vue from 'vue';
  import store from './store/store';
  import menus from './menus.vue'
  import login from './components/login.vue'
  import {USER, URL_CENTER_URL} from './assets/constants/constant-common';
  import { mapGetters,mapMutations } from 'vuex'
  import {
    GET_USER,
    SET_USER,
    GET_MSG,
    SET_MSG,
    GET_MENUS,
    SET_MENUS,
    GET_ALLMENUS,
    SET_ALLMENUS,
    SET_LOGIN_OUT,
    GET_CLIENT, GET_TOKEN
  } from './store/mutations'
  import utils from './assets/util/utils';
  export default {
    data(){
      return{
        nav:{modelName:'',menuNav:''},
        msg: 'Hello Vue23!',
        goLogin:true,

      }
    },
    name: 'app',
    store,
    computed:{
      ...mapGetters([
        GET_USER,GET_MENUS,GET_ALLMENUS,GET_MSG,GET_CLIENT,GET_TOKEN
      ])
    },
    watch:{
      "goLogin":function () {
        if(!this.goLogin){
          //30分钟自动更新token
          let onceflag=false;
          setInterval(function(){
            if(onceflag){
              this.$http.post(URL_CENTER_URL+'gameley-auth/oauth/token',{token:localStorage.getItem("token")}).then(function (response) {
                  let data=response.body.data;
                  localStorage.setItem("token", data);


              }, function (response) {

              });
            }
            onceflag=true;


          }, 60 * 1000 * 30)
        }

      }

    },
    beforeCreate:function (){
//      Vue.config.debug = true;
      Vue.config.debug = false;
      Vue.http.options.emulateJSON = false;
      Vue.http.options.emulateHTTP = true;
    },
    created:function(){
      let Base64 = require('js-base64').Base64;
      if(localStorage.getItem("token")){
        this.goLogin=false;
      }else{
        this.goLogin=true;
      }
      if(this.getUser==null&&!this.goLogin){
        let o = localStorage.getItem(USER);
        if(o !=null ){
          this.setUser(JSON.parse(o));
        }
      }
      if(this.getMenus==null&&!this.goLogin){
        let o = localStorage.getItem("client");
        let payload=o.substring(o.indexOf(".")+1,o.lastIndexOf("."));
        let basedata=JSON.parse(Base64.decode(payload));

        if(o !=null ){
          this.setMenus(basedata.menu);
        }
      }
      if(this.getAllMenus==null&&!this.goLogin){
        let o = localStorage.getItem("client");
        let payload=o.substring(o.indexOf(".")+1,o.lastIndexOf("."));
        let basedata=JSON.parse(Base64.decode(payload));
        if(o !=null ){
          this.setAllMenus(basedata.element);
        }
      }

      this.$router.beforeEach((to, from, next) => {
        let path = to.path;
        let na = next;
        let menus=this.getMenus;
        if (path === "/login"){
          next();
        } else {
          let flag=false;
          for(let i=0;i<menus.length;i++){
            if(path===menus[i].url){
              flag=true;
              break;
            }
            let submenus=menus[i].subMenu;
            for(let j=0;j<submenus.length;j++){
              if(path===submenus[j].url){
                let view={name:submenus[j].name,path:submenus[j].url}
                this.$store.dispatch('addVisitedViews', view);
                flag=true;
                break;
              }
            }
            if(flag){
              break;
            }
          }
          if(flag){
            next()
          }else{
            this.$message.error('路径输入有误');
          }


        }


      })
      //ajax 拦截
      Vue.http.interceptors.push((request, next)  => {
        switch(request.method){
          case 'POST':
            if(this.getToken){
              request.headers.set('token', this.getToken)
            }else{
              if(localStorage.getItem("token")){
                request.headers.set('token', localStorage.getItem("token"))
              }
            }
            if(this.getClient){
              request.headers.set('client', this.getClient)
            }else{
              if(localStorage.getItem("client")){
                request.headers.set('client', localStorage.getItem("client"))
              }
            }
            break;
          case 'GET':
            break;
        }
        next((response) => {
            if(response.status===401){
              this.$message.error('登录超时');
              this.go("/login")
              localStorage.clear();
              this.setLoginOut
              this.goLogin=true;
            }
          if(response.status===402){
            this.$message.error('编辑保存失败，请核实数据后重试');
          }
          if(response.status===403){
            this.$message.error('您无权限进行该操作');
          }
          if(response.status===405){
            this.$message.error('创建失败，请核实数据后重试');
          }
          if(response.status===406){
            this.$message.error('后台操作异常,删除失败');
          }
          if(response.status===500){
            this.$message.error('后台操作异常,请稍后再试');
          }
          if(response.status===501){
            this.$message.error('用户过期，请重新登录');
            this.go("/login")
            localStorage.clear();
            this.setLoginOut
            this.goLogin=true;

          }

        });
      });
    },
    components: {
      login,menus,themepicker,screenfull,TagView
    },
    methods: {
      ...mapMutations([
        SET_USER,SET_MSG,SET_MENUS,SET_ALLMENUS,SET_LOGIN_OUT
      ]),
      loginNotify:function(){
      },
      go: function (path, data) {
        this.$router.push({
            path: path,
            query: data
          }
        );

      },
      logout:function () {
        localStorage.clear();
        this.setLoginOut
        this.go("/login")
        this.goLogin=true;
      },
      loginchange(flag){
        this.goLogin=flag;

      }
    }
  }


</script>

<style>


</style>
