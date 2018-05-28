var generator = {
    baseUrl: "/base/generator",
    toolbarId: "toolbar",
    unique: "id",
    order: "asc",
    currentItems: {}
};


generator.init = function () {

};

layui.use(['form', 'layedit', 'laydate'], function () {
    generator.init();
    //初始化页面上面的按钮事件
    $('#btn_generate').on('click',function(){

        let modelname=$("#modelname").val();
        let port=$("#port").val()
        location.href = "/base/generator/model?modelname="+modelname+"&port="+port;

    });
});