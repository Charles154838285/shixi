<%--
  Created by IntelliJ IDEA.
  User: 44522
  Date: 2024/7/5
  Time: 下午2:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>系统角色管理 - 更新</title>

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
                <form  class="form-horizontal" id="roomForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">研讨室容量</label>
                        <div class="col-sm-4">
                            <input type="text" name="roomName" id="roomName" value="${Room.roomName}" class="form-control">
                        </div>
                        <div class="col-sm-6">
                            <span class="help-block m-b-none text-success"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">研讨室类型</label>
                        <div class="col-sm-4">
                            <select class="form-control m-b" name="roomType" id="roomType" >
                                <option value="${Room.roomType}">${Room.roomType}</option>
                                <option value="办公">办公</option>
                                <option value="讨论">讨论</option>
                                <option value="学术会议">学术会议</option>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <span class="help-block m-b-none text-success"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">研讨室容量</label>
                        <div class="col-sm-4">
                            <input type="number" name="capacity" id="capacity" value="${Room.capacity}" class="form-control">
                        </div>
                        <div class="col-sm-6">
                            <span class="help-block m-b-none text-success"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-3">
                            <button class="btn btn-primary" type="submit">修改</button>
                            <button class="btn btn-default" type="reset">取消</button>
                        </div>
                    </div>
                    <input type="hidden" name="roomId" value="${Room.roomId}">
                </form>
            </div>
        </div>
    </div>

</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/layer/layer.min.js"></script>
<script src="js/jquery.serializejson.min.js"></script>
<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>
<!-- 静态包含 -->
<%@ include file="../include.jsp"%>
<script>
    $(function(){
        let icon = "<i class='fa fa-times-circle'></i> ";
        jQuery.validator.addMethod("isNumber", function (value,element){
            var reg=/^([1-9]\d*|[0]{1,1})$/;
            return this.optional(element) || (reg.test(value));
        }, "研讨室容量必须为正整数");
        $("#roomForm").validate({
            rules:{
                roomName: {
                    required:true,
                    remote:{
                        type:"POST",
                        dataType: "json",
                        url:"sys/demo/seminar/query/name",
                        data: {
                            name:function (){
                                return $("#roomName").val();
                            },
                            oldName: function() {
                                return '${Room.roomName}';
                            }
                        }
                    }
                },
                roomType: {
                    required: true
                },
                capacity:{
                    required:true,
                    isNumber:true,
                }
            },
            messages:{
                roomName:{
                    equired: icon+"请输入研讨室号",
                    remote: icon+"研讨室号必须唯一"
                },
                roomType: {
                    required: icon+"请输入研讨室类型"
                },
                capacity:{
                    required:icon+"请输入研讨室容量",
                    isNumber: icon+"必须为正整数"
                }
            },
            onfocusout:false,
            onkeyup:false,
            submitHandler:function(form){
                //使用Ajax方式提交
                $.ajax({
                    type:"post",
                    url:"sys/demo/seminar/update",
                    data:JSON.stringify($("#roomForm").serializeJSON()),
                    contentType:"application/json;charset=UTF-8",
                    processData:false,
                    dataType:"json",
                    success:function(data){
                        if(data.flag=="success"){
                            layer.msg(data.message,function(){
                                window.parent.location.reload();
                            });
                            return false;
                        }else{
                            layer.msg(data.message);
                            return false;
                        }
                    }
                });
                return false;
            }

        })
    });
</script>
</body>
</html>