<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 44522
  Date: 2024/7/5
  Time: 上午11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${pageContext.request.contextPath}/">

    <title>研讨室展示</title>

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
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
                    <h5>研讨室信息管理</h5>
                    <div class="ibox-tools">
                        <a href="javascript:;" id="room-add-btn" class="btn btn-primary btn-xs">
                            <i class="fa fa-plus"></i> 新增研讨室
                        </a>
                        <a href="javascript:;" class="btn btn-white btn-xs" style="color: #000000" onclick="javascript:window.location.reload()">
                            <i class="fa fa-refresh"></i> 刷新
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 研讨室列表数据 -->
    <div class="row">
        <c:forEach items="${toRoomList}" var="Room">
            <div class="col-sm-4">
                <div class="ibox">
                    <div class="ibox-title">
                        <h5>${Room.roomName}</h5>
                        <div class="ibox-tools">
                            <a href="javascript:;" pk-id="${Room.roomId}" class="btn btn-success btn-xs room-update-btn" style="color: #FFFFFF">编辑</a>
                            <a href="javascript:;" pk-id="${Room.roomId}" class="btn btn-danger btn-xs room-delete-btn" style="color: #FFFFFF">删除</a>
                        </div>

                    </div>
                    <div class="ibox-content">
                        <h5>研讨室信息</h5>
                        <p>
                            类型：${Room.roomType}
                        </p>
                        <p>
                            容量：${Room.capacity}
                        </p>
                        <c:choose>
                            <c:when test="${Room.status == 1}">
                                <p>状态：未被预约</p>
                            </c:when>
                            <c:when test="${Room.status == 2}">
                                <p>状态：已被预约</p>
                            </c:when>
                            <c:otherwise>
                                <p>状态：未知</p>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>

<script type="text/javascript">
    $(function () {
        $("#room-add-btn").on("click",function () {
            layer.open({
                title:"新建研讨室信息",
                type: 2,
                area: ['800px', '330px'],
                fixed: false, //不固定
                shade: 0.01,
                content: 'sys/demo/seminar/add'
            });
        });
        $(".room-update-btn").on("click",function () {
            var room_id = $(this).attr("pk-id");
            layer.open({
                title:"更新研讨室信息",
                type: 2,
                area: ['800px', '330px'],
                fixed: false, //不固定
                shade: 0.01,
                content: 'sys/demo/seminar/update/'+room_id
            });
        });
        $(".room-delete-btn").on("click", function () {
            var id = $(this).attr("pk-id");
            console.log("Delete button clicked. Room ID:", id); // 调试输出

            layer.confirm('您确定要删除该研讨室吗？', {
                btn: ['确定删除', '取消'], // 按钮
                shade: 0.01, // 显示遮罩
                shift: 6,
            }, function () {
                console.log("Confirmed deletion for Room ID:", id); // 调试输出

                // 需要发送ajax请求
                $.ajax({
                    type: "POST",
                    url: "sys/demo/seminar/delete/" + id, // 确保URL正确
                    contentType: "application/json;charset=UTF-8",
                    success: function (data) {
                        console.log("AJAX request succeeded:", data); // 调试输出
                        if (data.code == 0) {
                            layer.msg('删除成功', {icon: 1}); // 提示删除成功
                        } else {
                            layer.msg('删除失败', {icon: 2}); // 提示删除失败
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log("AJAX request failed:", xhr, status, error); // 调试输出
                        layer.msg('操作失败', {icon: 2});
                    }
                });
            }, function () {
                layer.msg('操作取消');
            });
        });
    });
</script>
</body>
</html>
