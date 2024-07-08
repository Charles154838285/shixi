<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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

    <title>预约时间设计</title>

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
                <form class="form-horizontal" id="book">  <!-- 会用这个id将下面的数据直接转换为JSON数据 -->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学（工）号</label>
                        <div class="col-sm-4">
                            <input type="text" name="account" id="account" value="${userinfo.account}" class="form-control readonly" readonly>
                        </div>
                        <div class="col-sm-6">
                            <span class="help-block m-b-none text-success"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">预约人姓名</label>
                        <div class="col-sm-4">
                            <input type="text" name="username" id="username" value="${userinfo.userName}" class="form-control readonly" readonly>
                        </div>
                        <div class="col-sm-6">
                            <span class="help-block m-b-none text-success"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">起始时间</label>
                        <div class="col-sm-4">
                            <input type="datetime-local" name="startDate" id="startDate" class="form-control">
                        </div>
                        <div class="col-sm-6">
                            <span class="help-block m-b-none text-success"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">结束时间</label>
                        <div class="col-sm-4">
                            <%--                            <input type="datetime-local" name="endtime" id="endtime" value="${Seminar.bookInfo.endDate}" class="form-control">--%>
                            <input type="datetime-local" name="endDate" id="endDate" class="form-control">
                        </div>
                        <div class="col-sm-6">
                            <span class="help-block m-b-none text-success"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" name="remark" id="remark" rows="4" placeholder="请输入备注信息"></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-3">
                            <button class="btn btn-primary" type="submit" id="book_btn">确认</button>
                            <button class="btn btn-default" type="reset">取消</button>
                        </div>
                    </div>
                    <input type="hidden" name="roomId" id="roomId" value="${Seminar.roomId}">
                    <input type="hidden" name="roomStatus" id="roomStatus" value="${Seminar.status}">
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
<script>
    $(document).ready(function () {
        let icon = "<i class='fa fa-times-circle'></i> ";

        // 自定义验证方法：验证时间是否为整点（格式为YYYY-MM-DDTHH:00）
        jQuery.validator.addMethod("wholeHourTime", function (value, element) {
            var regex = /^\d{4}-\d{2}-\d{2}T[0-2][0-9]:00$/; // 匹配YYYY-MM-DDTHH:00格式
            return this.optional(element) || regex.test(value);
        }, icon + "时间必须为整点，例如2024-07-07T14:00。");

        // 自定义验证方法：验证结束时间是否至少比开始时间晚一个小时
        jQuery.validator.addMethod("minDuration", function (value, element) {
            var startTime = $("#startDate").val();
            var endTime = value;
            if (startTime && endTime) {
                var startDateTime = new Date(startTime);
                var endDateTime = new Date(endTime);
                // 比较日期时间，确保结束时间至少比开始时间晚一个小时
                return endDateTime - startDateTime >= 3600000; // 3600000毫秒 = 1小时
            }
            return true;
        }, icon + "预约时间不得少于一个小时。");

        // 初始化表单验证
        $("#book").validate({
            rules: {
                account: {
                    required: true
                },
                username: {
                    required: true
                },
                startDate: {
                    required: true,
                    wholeHourTime: true
                },
                endDate: {
                    required: true,
                    wholeHourTime: true,
                    minDuration: true // 使用自定义规则
                },
                remark: {
                    maxlength: 200
                },
                roomStatus: {
                    equalTo: 1
                }
            },
            messages: {
                account: {
                    required: icon + "请输入学（工）号"
                },
                username: {
                    required: icon + "请输入预约人姓名"
                },
                startDate: {
                    required: icon + "请选择起始时间",
                    wholeHourTime: icon + "请选择整点时间，如2024-7.7 14:00"
                },
                endDate: {
                    required: icon + "请选择结束时间",
                    wholeHourTime: icon + "请选择整点时间，如2024-7.7 14:00",
                    minDuration: icon + "预约时间不得少于1小时！"
                },
                remark: {
                    maxlength: icon + "备注信息不能超过200字"
                },
                roomStatus: {
                    equalTo: icon + "该时间段不可预约！"
                }
            },
            onfocusout: false,
            onkeyup: false,
            submitHandler: function(form) {
                // 使用Ajax方式提交表单数据
                var bookInfo = {
                    account: $("#account").val(),
                    username: $("#username").val(),
                    startDate: $("#startDate").val(),
                    endDate: $("#endDate").val(),
                    remark: $("#remark").val(),
                    roomId: $("#roomId").val(), // 确保 roomId 被正确获取
                    status: 1 // 设置预约记录的初始状态
                };

                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/sys/demo/seminar/book", // 确保路径正确
                    data: JSON.stringify(bookInfo),
                    contentType: "application/json;charset=UTF-8",
                    // processData: false,
                    dataType: "json",
                    success: function(data) {
                        if (data.flag == "success") {
                            layer.msg(data.message, function() {
                                window.parent.location.reload();
                            });
                        } else {
                            layer.msg(data.message);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error("Error details:", textStatus, errorThrown);
                        // 根据不同的错误状态码进行不同的处理
                        if (jqXHR.status == 0) {
                            layer.msg('未连接，请检查网络');
                        } else if (jqXHR.status == 404) {
                            layer.msg('请求的页面未找到 [404]');
                        } else if (jqXHR.status == 500) {
                            layer.msg('服务器内部错误 [500]');
                        } else if (textStatus === 'parsererror') {
                            layer.msg('请求JSON解析失败');
                        } else if (textStatus === 'timeout') {
                            layer.msg('请求超时');
                        } else if (textStatus === 'abort') {
                            layer.msg('请求中止');
                        } else {
                            layer.msg('未知错误：' + jqXHR.responseText);
                        }
                    }
                });
                return false; // 阻止表单的默认提交行为
            }
        });

        // 在确认按钮点击时触发表单提交
        $("#book_btn").click(function() {
            $("#book").submit();
        });
    });
</script>
</body>
</html>
