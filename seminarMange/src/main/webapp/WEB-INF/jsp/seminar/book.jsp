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

    <!-- 引入 jQuery 和 layer 插件 -->
    <script src="js/jquery.min.js"></script>
    <script src="js/layer/layer.js"></script>

    <title>研讨室展示</title>

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
                    <h5>研讨室信息管理</h5>
                    <div class="ibox-tools">
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
                            <c:if test="${Room.status == 1}">
                                <a href="javascript:;" pk-id="${Room.roomId}" class="btn btn-success btn-xs room-book-btn" style="color: #FFFFFF">预约</a>
                            </c:if>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <h5>研讨室信息</h5>
                        <p>类型：${Room.roomType}</p>
                        <p>容量：${Room.capacity}</p>
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

<script>
    $(function () {
        // 绑定点击事件到预约按钮
        $(".room-book-btn").on("click", function () {
            var room_id = $(this).attr("pk-id");
            var account = 'user123'; // 默认账号，实际使用时应该动态获取
            layer.open({
                title: "确认预约研讨室信息",
                type: 2,
                area: ['800px', '330px'],
                fixed: false, //不固定
                shade: 0.01,
                content: 'sys/demo/seminar/book/' + room_id
            });
        });
    });
</script>
</body>
</html>
