<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
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
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <form class="form-horizontal" id="roomForm">
                    <!-- 研讨室号 -->
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="roomName">研讨室号</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="roomName" name="roomName" placeholder="输入研讨室号" autofocus>
                        </div>
                    </div>
                    <!-- 研讨室类型 -->
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="roomType">研讨室类型</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="roomType" name="roomType">
                                <option value="">请选择研讨室类型</option>
                                <option value="小型研讨室">小型研讨室</option>
                                <option value="中型研讨室">中型研讨室</option>
                                <option value="大型研讨室">大型研讨室</option>
                            </select>
                        </div>
                    </div>
                    <!-- 研讨室容量 -->
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="capacity">研讨室容量</label>
                        <div class="col-sm-4">
                            <input type="number" class="form-control" id="capacity" name="capacity" placeholder="输入研讨室容量">
                        </div>
                    </div>
                    <!-- 状态 -->
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="status">状态</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="status" name="status">
                                <option value="">请选择状态</option>
                                <option value="1">未被预约</option>
                                <option value="2">已被预约</option>
                            </select>
                        </div>
                    </div>
                    <!-- 按钮组 -->
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-4">
                            <button class="btn btn-primary" type="submit" id="room-add-btn">新增</button>
                            <button class="btn btn-default" type="reset">取消</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/layer/layer.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/jquery.serializejson.min.js"></script>
<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>
<!-- 静态包含 -->
<%@ include file="../include.jsp"%>
<script>
    $(function(){
        let icon = "<i class='fa fa-times-circle'></i> ";
        // 自定义验证方法：正整数
        jQuery.validator.addMethod("isNumber", function (value, element) {
            var reg = /^([1-9]\d*|[0]{1,1})$/;
            return this.optional(element) || (reg.test(value));
        }, "研讨室容量必须为正整数");

        // 初始化表单验证
        $("#roomForm").validate({
            rules: {
                roomName: {
                    required: true,
                    remote: {
                        type: "POST",
                        dataType: "json",
                        url: "sys/demo/seminar/query/name",
                        data: {
                            name: function () {
                                return $("#roomName").val();
                            },
                            oldName: function () {
                                return '${Room.roomName}';
                            }
                        }
                    }
                },
                roomType: {
                    required: true
                },
                capacity: {
                    required: true,
                    isNumber: true
                },
                status: { // 新添加的 status 字段验证
                    required: true
                }
            },
            messages: {
                roomName: {
                    required: icon + "请输入研讨室名称",
                    remote: icon + "研讨室名称已存在"
                },
                roomType: {
                    required: icon + "请选择研讨室类型"
                },
                capacity: {
                    required: icon + "请输入研讨室容量",
                    isNumber: icon + "研讨室容量必须为正整数"
                },
                status: { // 新添加的 status 字段消息提示
                    required: icon + "请选择研讨室状态"
                }
            },
            onfocusout: false,
            onkeyup: false,
            submitHandler: function(form) {
                // 使用Ajax方式提交表单数据
                $.ajax({
                    type: "post",
                    url: "sys/demo/seminar/add",
                    data: JSON.stringify($("#roomForm").serializeJSON()),
                    contentType: "application/json;charset=UTF-8",
                    processData: false,
                    dataType: "json",
                    success: function(data) {
                        if(data.flag == "success") {
                            layer.msg(data.message, function() {
                                window.parent.location.reload();
                            });
                            return false;
                        } else {
                            layer.msg(data.message);
                            return false;
                        }
                    },
                    error: function() {
                        layer.msg('请求出错，请稍后重试');
                    }
                });
                return false; // 阻止表单的默认提交行为
            }
        });
    });
</script>
</body>
</html>
