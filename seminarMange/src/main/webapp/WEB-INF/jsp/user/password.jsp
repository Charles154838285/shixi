<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>系统用户管理 - 设置密码</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <!-- 定义行数 -->
    <div class="row">
        <!-- 定义列数 -->
        <div class="col-md-12">
            <div class="ibox float-e-margins">
                <!-- 定义标题 -->
                <div class="ibox-title">
                    <h5>设置新密码</h5>
                </div>
                <!-- 定义内容 -->
                <div class="ibox-content">
                    <form method="post" class="form-horizontal" action="sys/user/update/password" id="userForm">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">原密码</label>
                            <div class="col-sm-4">
                                <input type="password" name="oldPassword" id="oldPassword" required="" class="form-control" autofocus>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新密码</label>
                            <div class="col-sm-4">
                                <input type="password" name="password" id="password" class="form-control" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-4">
                                <input type="password" name="password2" id="password2" class="form-control" required>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary" type="submit">设置口令</button>
                                <button class="btn btn-default" type="reset">取消</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>
<!-- 静态包含 -->
<%@ include file="../include.jsp"%>
<script>
    $(function(){
        var icon = "<i class='fa fa-times-circle'></i> ";
        $("#userForm").validate({
            rules:{
                oldPassword:{
                    required: true,
                    remote:{
                        type:"GET",
                        dataType: "json",
                        url:"sys/user/valid/password",
                        data: {
                            password: function() {
                                return $("#oldPassword").val();
                            }
                        }

                    }
                },
                password: {
                    required: true,
                    minlength: 5,
                    maxlength: 16
                },
                password2: {
                    required: true,
                    equalTo:"#password"
                }

            },
            messages:{
                oldPassword: {
                    required: icon + "请输入您的原密码",
                    remote:icon + "原密码输入不正确"
                },
                password: {
                    required: icon + "请输入您的新密码",
                    minlength: icon + "新密码必须5位以上",
                    maxlength: icon + "新密码最大长度为16位"
                },
                password2: {
                    required: icon + "请输入您的确认密码",
                    equalTo: icon + "两次密码输入不一致"
                }
            },
            onfocusout:false,
            onkeyup:false
        });
    });
</script>
</body>
</html>