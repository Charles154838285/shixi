<%--
  Created by IntelliJ IDEA.
  User: 44522
  Date: 2024/7/6
  Time: 上午10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>预约记录信息 - 主页</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="row">
    <div class="col-sm-12">
        <div class="ibox">
            <div class="ibox-title">
                <h5>预约记录信息</h5>
            </div>
            <div class="ibox-content">
                <div class="row m-b-sm m-t-sm">
                    <div class="col-md-2">
                        <button type="button" id="user-add0-btn" class="btn btn-primary btn-sm"><i class="fa fa-user-plus"></i> 新建</button>
                        <button type="button" id="user-loading-btn" class="btn btn-white btn-sm"><i class="fa fa-refresh"></i> 刷新</button>
                    </div>
                    <form action="sys/demo/info/index" method="get" id="searchForm">
                        <div class="col-md-2">
                            <div class="input-group">
                                <input type="text" placeholder="请输入研讨室号" class="input-sm form-control" name="queryMap['roomName']" value="${page.queryMap.roomName}">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="input-group">
                                <input type="text" placeholder="请输入预约人账号" class="input-sm form-control" name="queryMap['account']" value="${page.queryMap.account}">
                                <span class="input-group-btn">
                                <button type="button" class="btn btn-sm btn-primary" id="search-btn"> 搜索</button>
                            </span>
                            </div>
                        </div>
                        <%-- 传递当前页 pageNow类Page中的属性，会自动赋值--%>
                        <input type="hidden" name="pageNow" id="pageNow" value="${page.pageNow}"/>
                        <input type="hidden" id="totalPages" value="${page.totalPages}"/>
                    </form>
                </div>
                <div class="project-list">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <td>预约号</td>
                            <td>预约账号</td>
                            <td>研讨室号</td>
                            <td>研讨室类型</td>
                            <td></td>
                            <td>开始时间</td>
                            <td>结束时间</td>
                            <td>预约状态</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.datas}" var="bookInfo">
                            <tr>
                                    <%--class="client-avatar"--%>
                                <td>
                                   ${bookInfo.bookId}
                                </td>
                                <td>
                                    <a href="javascript:;" class="client-link">${bookInfo.account}</a>
                                </td>
                                <td>${bookInfo.seminar.roomName}</td>
                                <td>${bookInfo.seminar.roomType}</td>
                                <td class="contact-type">
                                    <i class="fa fa-clock-o"> </i>
                                </td>
                                <td>
                                    <fmt:formatDate value="${bookInfo.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </td>
                                <td>
                                    <fmt:formatDate value="${bookInfo.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </td>
                                <td>
                                    <c:if test="${bookInfo.status==1}" var="flag">
                                        已预约
                                    </c:if>
                                    <c:if test="${!flag}">
                                        已取消
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row m-b-sm m-t-sm">
                    <div class="col-md-2">
                        <span style="line-height: 30px;">显示 ${page.pageNow} / ${page.totalPages} 页，共 ${page.totalCount} 条记录</span>
                    </div>
                    <div class="col-md-5 col-md-offset-5">
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-sm btn-white" id="start" ${page.pageNow==1?"disabled":""}> 首页</button>
                            <button type="button" class="btn btn-sm btn-white" id="pre" ${page.pageNow==1?"disabled":""}> 上一页</button>
                            <button type="button" class="btn btn-sm btn-white" id="next" ${page.pageNow==page.totalPages?"disabled":""}> 下一页</button>
                            <button type="button" class="btn btn-sm btn-white" id="end" ${page.pageNow==page.totalPages?"disabled":""}> 尾页</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/layer/layer.min.js"></script>


<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>
<script>
    $(function(){
        let pageNowObj = $("#pageNow");
        let totalPagesObj = $("#totalPages");
        let searchForm = $("#searchForm");
        $("#search-btn").click(function(){
            pageNowObj.val(1);
            searchForm.submit();
        });
        $("#start").click(function(){
            pageNowObj.val(1);
            searchForm.submit();
        });
        $("#pre").click(function(){
            pageNowObj.val( pageNowObj.val()-1);
            searchForm.submit();
        });
        $("#next").click(function(){
            pageNowObj.val(parseInt(pageNowObj.val())+1);
            searchForm.submit();
        });
        $("#end").click(function(){
            pageNowObj.val(totalPagesObj.val());
            searchForm.submit();
        });
    });
</script>


<script>
    $(document).ready(function(){
        $('#user-loading-btn').click(function () {
            simpleLoad($(this), true)
        });

        $("#user-add-btn").click(function () {
            layer.open({
                title:"系统用户管理 - 新建",
                type: 2,
                area: ['780px', '450px'],
                fixed: false, //不固定
                shade: 0.01,
                content: 'sys/book/add'
            });
        });
        $(".user-update-btn").click(function () {
            //获取自定义属性，主键ID
            let id = $(this).attr("pk-id");
            layer.open({
                title:"系统用户管理 - 更新",
                type: 2,
                area: ['780px', '450px'],
                fixed: false, //不固定
                shade: 0.01,
                content: 'sys/user/update/'+id
            });
        });

        $(".user-status-btn").click(function () {
            //获取两个自定义属性
            let id = $(this).attr("pk-id");
            let status = $(this).attr("user-status");

            layer.confirm('您确定要更改用户状态操作吗？', {
                skin: 'layui-layer-molv', //样式类名
                btn: ['确定继续','取消'], //按钮
                shade: 0.01, //显示遮罩
                shift:6
            }, function(){

                //需要发送ajax请求
                $.get("sys/user/update/status",{userId:id,status:status},function (data) {
                    if(data.flag=="success"){
                        layer.msg(data.message,function(){
                            window.location.reload();
                        });
                        return false;
                    }else{
                        layer.msg(data.message);
                        return false;
                    }
                },"json")
            }, function(){});

        });

        $(".user-role-btn").click(function () {
            let id = $(this).attr("pk-id");
            layer.open({
                title:"系统用户 - 角色",
                type: 2,
                area: ['400px', '220px'],
                fixed: false, //不固定
                shade: 0.01,
                content: 'sys/user/update/role/'+id
            });
        });

        $(".user-photo-btn").click(function () {
            let id = $(this).attr("pk-id");
            layer.open({
                title:"系统用户 - 头像",
                type: 2,
                area: ['350px', '400px'],
                fixed: false, //不固定
                shade: 0.01,
                content: 'sys/user/update/photo/'+id
            });
        });
    });

    function simpleLoad(btn, state) {
        if (state) {
            btn.children().addClass('fa-spin');
            btn.contents().last().replaceWith(" Loading");
            window.location.reload();
        } else {
            setTimeout(function () {
                btn.children().removeClass('fa-spin');
                btn.contents().last().replaceWith(" Refresh");
                window.location.reload();
            }, 2000);
        }
    }
</script>
</body>
</html>

