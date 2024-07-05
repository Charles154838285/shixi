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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${pageContext.request.contextPath}/">
    <title>添加研讨室</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
<!-- 定义行数 -->
<div class="row">
    <!-- 定义列数 -->
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <!-- 定义内容 -->
            <div class="ibox-content">
                <form method="post" class="form-horizontal" action="message.html">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">研讨室号</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="研讨室号" class="form-control" id="roomName" name="roomName" autofocus>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">研讨室类型</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="设置研讨室类型" class="form-control" id="roomType" name="roomType">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">研讨室容量</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="设置研讨室容量" class="form-control" id="capacity" name="capacity">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-3">
                            <button class="btn btn-primary" type="button" id="room-add-btn">新增</button>
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
<script src="js/content.js?v=1.0.0">
</script>
<script>
    $(function (){
        $("#room-add-btn").click(function (){
            let roomName=$.trim($("#roomName").val());
            let roomType=$("#roomType").val();
            let capacity=$("#capacity").val();
            //简单验证
            //判断输入是否为空
            if(roomName == ''){
                alert("研讨室号不能为空");
                return false;
            }
            if(roomType == ''){
                alert("研讨室类型不能为空");
                return false;
            }
            if(capacity == ''){
                alert("研讨室容量不能为空");
                return false;
            }
            $.post("sys/demo/seminar/query/name",{name:roomName},function (response){
                let flag=response;
                if(flag){
                    $.ajax({
                        type:"post",
                        url:"sys/demo/seminar/add",
                        data:JSON.stringify({roomName: roomName,roomType:roomType,capacity:capacity}),
                        contentType:"application/json;charset=UTF-8",
                        success:function (data) {
                            if(data.flag=="success"){
                                window.parent.location.reload();
                                return false;
                            }else{
                                layer.msg('操作失败');
                                return false;
                            }
                        }
                    })
                }
            });
        });
    })
</script>
</body>
</html>
