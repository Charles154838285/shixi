<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>系统用户管理 - 设置角色</title>

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
                    <h5>系统用户管理 <small>设置用户角色</small></h5>
                </div>
                <!-- 定义内容 -->
                <div class="ibox-content">
                    <form method="post" class="form-horizontal" action="sys/user/update/role" id="userForm">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">账号</label>
                            <div class="col-sm-4">
                                <input type="text"  class="form-control" readonly value="${user.account}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">角色</label>
                            <div class="col-sm-4">
                                <select class="form-control m-b" name="roleId" id="roleId">
                                    <c:if test="${empty user.roleId}" var="flag">
                                        <option value="">请选择要分配的角色</option>
                                    </c:if>
                                    <c:forEach items="${roleList}" var="role">
                                        <option value="${role.roleId}"
                                        <c:if test="${role.roleId==user.roleId}">selected</c:if>
                                        >${role.roleName}</option>
                                    </c:forEach>
                                    <c:if test="${!flag}">
                                        <option value="-1">设置取消角色</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary" type="submit">设置</button>
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

</body>
</html>