<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>系统角色管理 - 新建</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
<!-- 定义行数 -->
<div class="row">
    <!-- 定义列数 -->
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <!-- 定义内容 -->
            <div class="ibox-content">
                <form  class="form-horizontal" id="roleForm">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色名称</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="角色名称" class="form-control" id="roleName" name="roleName" autofocus>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色标识</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="设置唯一的角色标识" class="form-control" id="roleKey" name="roleKey">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色描述</label>
                        <div class="col-sm-6">
                            <textarea placeholder="角色功能描述" class="form-control" id="remark" name="remark"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-3">
                            <button class="btn btn-primary" type="submit">新增</button>
                            <button class="btn btn-default" type="reset">取消</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>

</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/layer/layer.min.js"></script>
<script src="js/jquery.serializejson.min.js"></script>
<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>
<!-- 静态包含 -->
<%@ include file="../include.jsp"%>
<script>
    $(function(){
        let icon = "<i class='fa fa-times-circle'></i> ";
        jQuery.validator.addMethod("isRoleKey", function(value, element) {
            var reg = /^[A-Z_]{2,16}$/;
            return this.optional(element) || (reg.test(value));
        }, "角色标识是由大写字母和下划线组成的2~16位字符");
        $("#roleForm").validate({
           rules:{
               roleName: {
                   required: true,
                   minlength: 2,
                   maxlength: 10
               },
               roleKey: {
                   required: true,
                   isRoleKey:true,
                   remote:{
                       type:"GET",
                       dataType: "json",
                       url:"sys/role/valid/key",
                       data: {
                           roleKey: function() {
                               return $("#roleKey").val();
                           }
                       }

                   }
               },
               remark:{
                   maxlength: 128
               }
           },
           messages:{
               roleName: {
                   required: icon+"请输入您的角色名称",
                   minlength: icon+"角色名称最少2位字符",
                   maxlength: icon+"角色名称最多10位字符"
               },
               roleKey: {
                   required: icon+"请输入您的角色唯一标识",
                   remote: icon+"该角色标识已经被使用，请重新设置"
               },
               remark:{
                   maxlength: icon+"角色描述不能操作128个字符"
               }
           },
           onfocusout:false,
           onkeyup:false,
           submitHandler:function(form){
               //使用Ajax方式提交
               $.ajax({
                   type:"post",
                   url:"sys/role/add",
                   data:JSON.stringify($("#roleForm").serializeJSON()),
                   contentType:"application/json;charset=UTF-8",
                   processData:false,
                   dataType:"json",
                   success:function(data){
                       if(data.flag=="success"){
                           layer.msg(data.message,function(){
                              window.parent.location.reload();
                           });
                           return false;
                       }else{
                           layer.msg(data.message);
                           return false;
                       }
                   }
               });
               return false;
            }

        })
    });
</script>
</body>
</html>
