<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>系统用户管理 - 编辑</title>

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
                    <h5>系统用户管理 <small>编辑用户资料信息</small></h5>
                </div>
                <!-- 定义内容 -->
                <div class="ibox-content">
                    <form method="post" class="form-horizontal" action="sys/user/update" id="userForm">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">账号</label>
                            <div class="col-sm-4">
                                <input type="text"  class="form-control" readonly value="${user.account}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-4">
                                <input type="text" name="userName" id="userName" class="form-control" required value="${user.userName}">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary" type="submit">更新</button>
                                <button class="btn btn-default" type="reset">取消</button>
                            </div>
                        </div>
                        <input type="hidden" name="userId" value="${user.userId}"/>
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
                userName: {
                    required: true,
                    minlength: 2,
                    maxlength: 10
                }

            },
            messages:{
                userName: {
                    required: icon + "请输入您的姓名",
                    minlength: icon + "姓名必须2位以上",
                    maxlength: icon + "姓名最大长度为10位"
                }
            },
            onfocusout:false,
            onkeyup:false
        });
    });
</script>
</body>
</html>