<template>
  <div>
    <div class="superlogin"></div>
    <div class="loginBox">
      <div class="logo"><img src="../../static/images/logo_login.png"></div>
      <div class="loginMain">
        <div class="tabwrap">
          <el-form :model="formData" :rules="rules" ref="formData" >
            <tbody>
            <tr>
              <td class="title">用户名：</td>
              <td>
                <input type="text"  v-model="formData.username" class="form-control txt" v-on:keyup.13="show($event)">
              </td>
            </tr>
            <tr>
              <td class="title">密   码：</td>
              <td>
                <input type="password" v-model="formData.passwords"  class="form-control txt" v-on:keyup.13="show($event)">
              </td>
            </tr>
            <tr>
              <td class="title">登录验证：</td>
              <td>
                <drag ref="drag"></drag>
                <!--<input type="text" class="form-control txt txt2" v-model="formData.numbers" v-on:keyup.13="show($event)">-->
                <!--<span class="yzm">-->
                <!--<img src="../../static/images/yzm.jpg"></span>-->
              </td>
            </tr>
            <tr class="errortd">
              <td>&nbsp;</td>
              <td><i class="ico-error"></i>
                <span class="errorword">{{errorMessage}}</span>
              </td>
            </tr>
            <tr><td>&nbsp;</td><td>
              <input type="button" class="loginbtn" value="登录" v-on:click="submitForm()">
              <input type="button" class="resetbtn" value="重置" v-on:click="reset()"></td></tr>
            <tr><td>&nbsp;</td>
              <td class="forgetpsw"><a href="">忘记密码？</a></td></tr>
            </tbody>
          </el-form>
        </div>
      </div>
    </div>
    <div class="footer">Copyright © 2017-2018 gameley  All Rights Reserved.</div>
  </div>

  <!--<div class="content-cha">-->
  <!--<div v-bind:style="{'margin-top': marginTop + 'px'}">-->
  <!--<el-row>-->
  <!--<el-col style="width:500px" v-bind:style="{'margin-left': marginLeft + 'px'}">-->
  <!--<el-form :model="formData" :rules="rules" ref="formData" label-width="100px" class="demo-ruleForm1">-->
  <!--<el-row>-->
  <!--<el-col :offset="9"><h2 style="color:#ffffff">欢迎登陆业务平台</h2></el-col>-->
  <!--</el-row>-->
  <!--<el-form-item prop="username">-->
  <!--<el-input type="text" v-model="formData.username" auto-complete="off" placeholder="登录名"-->
  <!--@keyup.13.native="show($event)"></el-input>-->
  <!--</el-form-item>-->
  <!--<el-form-item prop="passwords">-->
  <!--<el-input type="password" v-model="formData.passwords" auto-complete="off" placeholder="密码"-->
  <!--@keyup.13.native="show($event)"></el-input>-->
  <!--</el-form-item>-->
  <!--<el-form-item>-->
  <!--<el-row>-->
  <!--<el-col >-->
  <!--<el-button type="primary" @click="submitForm('formData')" style="width: 100%"-->
  <!--:loading="loading">登录-->
  <!--</el-button>-->

  <!--</el-col>-->
  <!--</el-row>-->

  <!--</el-form-item>-->
  <!--</el-form>-->
  <!--</el-col>-->
  <!--</el-row>-->

  <!--</div>-->
  <!--</div>-->
</template>
<style scoped>
  @import "../../static/css/login.css";
  @import "../../static/css/base.css";
</style>

<script>
  import { USER,  URL_CENTER_URL} from '../assets/constants/constant-common';
  import {mixin} from '../assets/util/mixin';
  import store from '../store/store';
  import utils from '../assets/util/utils';
  import Des from '../assets/util/des';
  import drag from './common/drag'


  export default {
    data() {
      return{
        submitData:{username:"",password:""},
        createData:{username:"",passwords:"",numbers:""},
        rules: {
          username: [
            { required: true, message: '请输入用户名', trigger: 'blur' },
          ],
          passwords:[
            { required: true, message: '请输入密码', trigger: 'blur' }
          ]
        },
        loading: false,
        user:{id:null,name:null},
        errorMessage:"",
      }

    },
    mixins: [mixin],
    created:function () {
      localStorage.clear();
      this.setLoginOut
      this.loginchange(true);
      this.formData=utils.clone(this.createData);
      let brow=$.browser;
      var explorer = window.navigator.userAgent ;

      if(explorer.indexOf("MSIE") >= 0) {
        if (brow.version < 10) {
          this.setMsg("你好！IE9及以下浏览器不支持该系统正常运行！");
        }
      }

    },
    store,

    mounted () {

    },
    components:{
      drag
    },
    watch:{
    },
    props:['flag'],
    methods:{
      show: function (ev) {
        if (ev.keyCode === 13) {
          let username=this.formData.username
          let password=this.formData.passwords
          let numbers=this.formData.numbers;
          if(username===""||username===null){
            this.errorMessage="用户名不能为空"
            return
          }
          if(password===""||password===null){
            this.errorMessage="密码不能为空"
            return
          }
          if(!this.$refs.drag.confirmSuccess){
            this.errorMessage="验证错误"
            return
          }
          this.login();
        }
      },
      login:function(){
        this.setMsg(null);
        localStorage.clear();

        this.submitData.password = this.getDesPwd(this.formData.passwords);
        this.submitData.username = this.formData.username;
//          this.openFullScreen2()
        this.loading = true
        this.$http.post(URL_CENTER_URL+'gameley-auth/oauth/token',this.submitData).then(function (response) {
          let data=response.data.data;
          this.loading = false;
          if(response.body.status===200){
            this.setToken(data.token)
            localStorage.setItem("token", data.token);
            this.user.id=data.id;
            this.user.name=data.name;
            this.setUser(this.user);
            localStorage.setItem(USER, JSON.stringify(this.user));
            this.$http.post(URL_CENTER_URL+'user-api/menu/getallmenu').then(function (response) {
              let Base64 = require('js-base64').Base64;
              let clientid=response.body.data;
              let payload=clientid.substring(clientid.indexOf(".")+1,clientid.lastIndexOf("."));
              let basedata=JSON.parse(Base64.decode(payload));
              let menudata=basedata.menu;
              let elementcode=basedata.element;
              this.setAllMenus(elementcode);
              this.setMenus(menudata);
              this.setClient(clientid);
              localStorage.setItem("client",clientid);
              this.loginchange(false);
              this.go('/System/menuManage',null);
            }, function (response) {

            });




          }else{
            this.setMsg(response.body.message);
            /**
             * 不启动后台测试时使用
             */
            // this.loginchange(false);
            // this.go('/hello',null);
          }

        }, function (response) {
          this.loading = false
          this.setMsg(null);
        });
      },
      loginchange(flag){
        this.$emit('loginchange',flag);
      },
      getDesPwd:function(pwd){
        let desPwd = '';
        let key1 = "xmob";
        let key2 = "X";
        let key3 = "MOB";
        desPwd = Des.strEnc(pwd,key1,key2,key3);
        return desPwd;
      },
      submitForm() {
        let username=this.formData.username
        let password=this.formData.passwords
        let numbers=this.formData.numbers;
        if(username===""||username===null){
          this.errorMessage="用户名不能为空"
          return
        }
        if(password===""||password===null){
          this.errorMessage="密码不能为空"
          return
        }
        if(!this.$refs.drag.confirmSuccess){
          this.errorMessage="验证错误"
          return
        }
        this.login();

      },
      reset(){
        this.formData.username="";
        this.formData.passwords="";
        this.formData.numbers="";
      }
    }

  }
</script>
