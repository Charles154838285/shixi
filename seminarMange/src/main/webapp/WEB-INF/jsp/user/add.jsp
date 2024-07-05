<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>系统用户管理 - 新建</title>

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
                    <h5>系统用户管理 <small>新建用户资料信息</small></h5>
                </div>
                <!-- 定义内容 -->
                <div class="ibox-content">
                    <form method="post" class="form-horizontal" action="sys/user/add" id="userForm">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">账号</label>
                            <div class="col-sm-4">
                                <input type="text" name="account" id="account" required="" class="form-control" autofocus>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-4">
                                <input type="text" name="password" id="password" class="form-control" value="123456">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-4">
                                <input type="text" name="userName" id="userName" class="form-control" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">角色</label>
                            <div class="col-sm-4">
                                <select class="form-control m-b" name="roleId" id="roleId">
                                    <option value="">请选择要分配的角色</option>
                                    <c:forEach items="${roleList}" var="role">
                                        <option value="${role.roleId}">${role.roleName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-4">
                                <div class="checkbox i-checks">
                                    <c:forEach items="${applicationScope['APP_USER_STATUS']}" var="temp" varStatus="vs">
                                        <label>
                                            <input type="radio" name="status" value="${temp.value}" <c:if test="${vs.first}"> checked="checked"</c:if> <i></i> ${temp.label}
                                        </label>
                                    </c:forEach>
                                    <%--<label>
                                        <input type="radio" name="status" value="1" checked="checked"> <i></i> 激活
                                    </label>

                                    <label>
                                        <input type="radio" name="status" value="2" > <i></i> 禁用
                                    </label>--%>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary" type="submit">保存</button>
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
<!-- iCheck -->
<script src="js/plugins/iCheck/icheck.min.js"></script>
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
</script>
<script>
    $(function(){
        var icon = "<i class='fa fa-times-circle'></i> ";
        $("#userForm").validate({
            rules:{
                account:{
                    required: true,
                    minlength: 3,
                    maxlength: 16,
                    remote:{
                        type:"GET",
                        dataType: "json",
                        url:"sys/user/valid/account",
                        data: {
                            account: function() {
                                return $("#account").val();
                            }
                        }

                    }
                },
                password: {
                    required: true,
                    minlength: 5,
                    maxlength: 16
                },
                userName: {
                    required: true,
                    minlength: 2,
                    maxlength: 10
                }

            },
            messages:{
                account: {
                    required: icon + "请输入您的用户名",
                    minlength: icon + "用户名必须3个字符以上",
                    maxlength: icon + "用户名最大长度为16位",
                    remote:icon + "该账号已经被注册，请重新设置"
                },
                password: {
                    required: icon + "请输入您的密码",
                    minlength: icon + "密码必须5位以上",
                    maxlength: icon + "密码最大长度为16位"
                },
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