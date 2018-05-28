<template>
  <div>
    <el-form :inline="true" :model="queryForm" class="demo-form-inline">
      <!--<el-form-item>-->
      <!--<el-select v-model="queryForm.id" filterable clearable placeholder="">-->
      <!--<el-option-->
      <!--v-for=""-->
      <!--:key=""-->
      <!--:label=""-->
      <!--:value="">-->
      <!--</el-option>-->
      <!--</el-select>-->
      <!--</el-form-item>-->
      <el-form-item>
        <el-date-picker v-model="queryForm.time" type="date" placeholder="选择日期"></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="query">查询</el-button>
        <el-button type="primary" @click="handleCreate()">新建</el-button>
      </el-form-item>
    </el-form>

    <el-table :data="page.items" border style="width: 100%">
      <el-table-column align="center" label="id" width="65">
        <template scope="scope">
          <span>{{scope.row.id}}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="200px" align="center" label="标题">
        <template scope="scope">
          <span>{{scope.row.title}}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="200px" align="center" label="正文">
        <template scope="scope">
          <span>{{scope.row.content}}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="200px" align="center" label="作者">
        <template scope="scope">
          <span>{{scope.row.article}}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="200px" align="center" label="审核状态">
        <template scope="scope">
          <span>{{scope.row.state}}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="200px" align="center" label="">
        <template scope="scope">
          <span>{{scope.row.dt|formatDate(2)}}</span>
        </template>
      </el-table-column>
      <el-table-column min-width="200px" align="center" label="最后修改人">
        <template scope="scope">
          <span>{{scope.row.modifyid}}</span>
        </template>
      </el-table-column>
      <el-table-column fixed="right" align="center" label="操作" width="150">
        <template scope="scope">
          <el-button size="mini" type="primary" @click="handleEdit(scope.index,scope.row)">编辑
          </el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.index,scope.row)">删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <page :page.once="page" :query.once="queryForm" ref="page"></page>
    <deleteDialog v-on:deleteCon="deleteSubmit" :deleteObj="deleteObj" deleteMsg=""
                  :dialogDeleteVisible="dialogDeleteFormVisible"></deleteDialog>

    <el-dialog title="新建" :visible.sync="dialogFormVisible">
      <el-form :model="formData" :rules="rules" ref="form" label-width="120px">
        <el-form-item label="标题" prop="title">
          <el-input v-model="formData.title" placeholder="请输入标题"></el-input>
        </el-form-item>
        <el-form-item label="正文" prop="content">
          <el-input v-model="formData.content" placeholder="请输入正文"></el-input>
        </el-form-item>
        <el-form-item label="作者" prop="article">
          <el-input v-model="formData.article" placeholder="请输入作者"></el-input>
        </el-form-item>
        <el-form-item label="审核状态">
          <el-input v-model="formData.state" placeholder="请输入审核状态"></el-input>
        </el-form-item>
        <el-form-item label="最后修改日期">
          <el-date-picker v-model="formData.dt" type="date" placeholder="选择日期"></el-date-picker>
        </el-form-item>
        <el-form-item label="最后修改人">
          <el-input v-model="formData.modifyid" placeholder="请输入最后修改人"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible=false">取 消</el-button>
        <el-button type="primary" @click="formValidate()" :loading="isloading">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import Vue from 'vue'
  import page from '../common/page.vue'
  import utils from '../../assets/util/utils';
  import {mixin} from '../../assets/util/mixin';
  import {DOCURL, ERR_MSG, MENUID, URL} from "../../assets/constants/constant-common"

  export default {
    data() {
      return {
        createData: {
          formId: -1,
          id: null,
          title: null,
          content: null,
          article: null,
          state: null,
          dt: null,
          modifyid: null
        },
        rules: {
          title: [
            {
              required: true,
              message: '请输入标题',
              trigger: 'blur'
            }
          ], content: [
            {
              required: true,
              message: '请输入正文',
              trigger: 'blur'
            }
          ], article: [
            {
              required: true,
              message: '请输入作者',
              trigger: 'blur'
            }
          ]
        },
        queryForm: {
          time: null,
          id: null,
        },
        dialogFormVisible: false,
        menuId: DOCURL + MENUID.getpageAgDoc,
        deleteUrl: DOCURL + MENUID.deleteAgDoc,


      }
    },
    created() {
      this.formData = utils.clone(this.createData);

    },
    mixins: [mixin],
    methods: {
      formSubmit: function () {
        let id = this.formData.formId;
        if (id === -1) {
          this.$http.post(DOCURL + MENUID.addAgDoc, this.formData).then(function (response) {
            this.query();
            this.dialogFormVisible = false;
            this.setMsg("创建成功");
          }, function (response) {
            this.isloading = false;

          });
        } else {
          this.$http.post(DOCURL + MENUID.editAgDoc, this.formData).then(function (response) {

            this.query();
            this.setMsg("修改成功");
            this.dialogFormVisible = false
          }, function (response) {
            this.isloading = false;

          });
        }

      },


    }
  }
</script>
