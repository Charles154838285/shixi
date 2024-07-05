<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>系统菜单管理 - 新建</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body >
<!-- 定义行数 -->
<div class="row">
    <!-- 定义列数 -->
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <!-- 定义内容 -->
            <div class="ibox-content" style="border-style: none;">
                <form method="post" class="form-horizontal" action="sys/menu/add" id="menuForm">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">${parentId==-1?"父":"子"}节点名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" placeholder="请输入${parentId==-1?"父":"子"}节点名称"  required autofocus name="menuName" id="menuName">
                            <!-- 传递过来的父节点ID -->
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">图标设置</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="icon" id="icon" placeholder="请设置节点图标">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">节点排序</label>
                        <div class="col-sm-6">
                            <input type="number" class="form-control" name="sort" id="sort" required placeholder="请设置节排序" min="1" max="100" value="1">
                        </div>
                    </div>
                    <c:if test="${parentId!=-1}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">父节点列表</label>
                            <div class="col-sm-6">
                                <select class="form-control m-b" name="parentId" id="parentId" required>
                                    <c:forEach items="${parentMenuList}" var="parent">
                                        <option value="${parent.menuId}"
                                        <c:if test="${parentId==parent.menuId}">selected</c:if>
                                        >${parent.menuName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">访问路径</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="url" id="url" placeholder="请设置访问路径">
                            </div>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-3">
                            <button class="btn btn-primary" type="submit">新增${parentId==-1?"父":"子"}节点</button>
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

<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>
<script src="js/content.js?v=1.0.0"></script>
<!-- 静态包含 -->
<%@ include file="../include.jsp"%>
<script>
    $(function(){
        var icon = "<i class='fa fa-times-circle'></i> ";
        $("#menuForm").validate({
            rules:{
                menuName:{
                    required: true,
                    minlength: 2,
                    maxlength: 16
                },
                sort: {
                    required: true,
                    min: 1,
                    max: 100
                }
            },
            messages:{
                menuName: {
                    required: icon + "请设置菜单名称",
                    minlength: icon + "菜单名称必须2个字符以上",
                    maxlength: icon + "菜单名称最大长度为16个字符"
                },
                sort: {
                    required: icon + "请设置菜单的排序",
                    min: icon + "最小值为1",
                    max: icon + "最大值100"
                }
            },
            onfocusout:false,
            onkeyup:false
        });
        //动态添加验证规则
        let parentId = '${parentId}';
        if (parentId!='-1'){
            $("#url").rules("add",{
                required: true,
                minlength: 2,
                maxlength: 64,
                messages:{
                    required: icon + "请设置菜单访问路径",
                    minlength: icon + "菜单访问路径必须2个字符以上",
                    maxlength: icon + "菜单访问路径最大长度为64个字符"
                }
            })
        }
    });
</script>

</body>
</html>