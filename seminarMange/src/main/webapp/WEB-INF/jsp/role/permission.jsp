<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>系统角色管理 - 授权菜单</title>

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
                    <h5>${role.roleName} <small>菜单授权功能</small></h5>
                </div>
                <!-- 定义内容 -->
                <div class="ibox-content">
                    <form method="post" class="form-horizontal" action="sys/role/update/permission" id="rolePermissionForm">
                        <div class="form-group">
                            <div class="col-md-9 col-md-offset-2">
                                <div class="col-md-4 m-l-n">
                                    <select class="form-control" multiple="multiple" style="height: 300px;" id="leftSelect">
                                        <c:forEach items="${requestScope.unSelectedMenuList}" var="l">
                                            <option value="${l.menuId}">${l.menuName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-1 m-l-n" style="margin-top: 100px;">
                                    <div class="row">
                                        <div class="col-md-1">
                                            <button type="button" class="btn btn-white" id="leftBtn">
                                                <i class="fa fa-chevron-left"></i>
                                                <i class="fa fa-chevron-left"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1">
                                            <button type="button" class="btn btn-white" id="rightBtn">
                                                <i class="fa fa-chevron-right"></i>
                                                <i class="fa fa-chevron-right"></i>
                                            </button>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-4 m-l-n">
                                    <select class="form-control" multiple="" style="height: 300px;" id="rightSelect" name="menus">
                                        <c:forEach items="${requestScope.selectedMenuList}" var="r">
                                            <option value="${r.menuId}">${r.menuName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-md-9 col-sm-offset-4">
                                <button class="btn btn-primary" type="button" id="role-permission-btn">授权设置</button>
                                <button class="btn btn-white" type="button" onclick="javascript:history.back()">返回上页</button>
                            </div>
                        </div>
                        <input type="hidden" name="roleId" value="${role.roleId}">
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

<script type="text/javascript">
    $(function () {
        //1.绑定按钮事件
        $("#leftBtn").click(function(){
            $("#rightSelect").find("option:selected").each(function () {
                $(this).remove().appendTo($("#leftSelect"));
                //取消选中状态
                $("option:selected").prop("selected",false);
            });
        });
        $("#rightBtn").click(function(){
            $("#leftSelect").find("option:selected").each(function () {
                $(this).remove().appendTo($("#rightSelect"));
                //取消选中状态
                $("option:selected").prop("selected",false);
            });
        });
        //2.绑定双击事件
        $("#leftSelect").dblclick(function () {
            $(this).find("option:selected").each(function(){
                $(this).remove().appendTo($("#rightSelect"));
                //取消选中状态
                $("option:selected").prop("selected",false);
            });
        });
        $("#rightSelect").dblclick(function () {
            $(this).find("option:selected").each(function(){
                $(this).remove().appendTo($("#leftSelect"));
                //取消选中状态
                $("option:selected").prop("selected",false);
            });
        });

        //授权提交按钮绑定
        $("#role-permission-btn").click(function () {
            //设置右侧为选中状态
            $("#rightSelect option").prop("selected",true);
            $("#rolePermissionForm").submit();

        });

    });
</script>
</body>
</html>
