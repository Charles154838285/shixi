<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>系统角色管理 - 列表</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>系统角色管理</h5>
                    <div class="ibox-tools">
                        <a href="javascript:;" class="btn btn-primary btn-xs role-add-btn">
                            <i class="fa fa-plus"></i> 新增角色
                        </a>
                        <a href="javascript:;" class="btn btn-white btn-xs" style="color: #000000" onclick="javascript:window.location.reload()">
                            <i class="fa fa-refresh"></i> 刷新
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 角色列表数据 -->
    <c:forEach items="${requestScope.roleList}" var="role" varStatus="vs">
        <c:if test="${vs.index%3==0}">
            <div class="row">
        </c:if>
            <div class="col-sm-4">
                <div class="ibox">
                    <div class="ibox-title">
                        <h5>${role.roleName}</h5>
                        <div class="ibox-tools">
                            <a href="javascript:;" pk-id="${role.roleId}" class="btn btn-success btn-xs role-update-btn" style="color: #FFFFFF">编辑</a>
                            <c:if test="${role.roleId>0}">
                                <a href="javascript:;" pk-id="${role.roleId}" role-status="2" class="btn btn-danger btn-xs role-delete-btn" style="color: #FFFFFF">注销</a>
                            </c:if>

                            <a href="sys/role/update/permission/${role.roleId}" class="btn btn-info btn-xs" style="color: #FFFFFF">授权</a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <h5>角色功能简介</h5>
                        <p>
                            <c:if test="${empty role.remark}" var="flag">
                                这个角色没有进行任何的描述
                            </c:if>
                            <c:if test="${!flag}">
                                ${role.remark}
                            </c:if>
                        </p>
                    </div>
                </div>

            </div>
        <c:if test="${vs.count%3==0 || vs.count==roleList.size()}">
            </div>
        </c:if>

    </c:forEach>


</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>

<script type="text/javascript">
    $(function () {
        $(".role-add-btn").on("click",function () {
            layer.open({
                title:"新建系统角色信息",
                type: 2,
                area: ['800px', '330px'],
                fixed: false, //不固定
                shade: 0.01,
                content: 'sys/role/add'
            });
        });
        $(".role-update-btn").on("click",function () {
            var id = $(this).attr("pk-id");
            layer.open({
                title:"更新系统角色信息",
                type: 2,
                area: ['800px', '330px'],
                fixed: false, //不固定
                shade: 0.01,
                content: 'sys/role/update/'+id
            });
        });
        $(".role-delete-btn").on("click",function () {
            let id = $(this).attr("pk-id");
            layer.confirm('您确定要彻底注销该角色吗？', {
                btn: ['彻底注销','取消'], //按钮
                shade: 0.01, //显示遮罩
                shift:6,
                icon:5
            }, function(){
                //需要发送ajax请求
                $.get("sys/role/delete/"+id,function (data) {
                    if(data.flag=="success"){
                        layer.msg(data.message, {icon: 1},function(){
                            window.location.reload();
                        });

                        return false;
                    }else{
                        layer.msg(data.message,{icon:5});
                        return false;
                    }
                },"json")
            }, function(){});
        })
    });
</script>
</body>
</html>