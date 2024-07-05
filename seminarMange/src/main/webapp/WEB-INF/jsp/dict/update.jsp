<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>字典管理 - 编辑</title>

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
                <form  class="form-horizontal" id="dictForm" action="sys/dict/update" method="post">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">字典标识</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="请设置字典分组" class="form-control" id="dictKey" name="dictKey" autofocus value="${dict.dictKey}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">显示值</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="设置字典显示值" class="form-control" id="dictName" name="dictName" value="${dict.dictName}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">实际值</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="设置字典实际值" class="form-control" id="dictValue" name="dictValue" value="${dict.dictValue}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">排序</label>
                        <div class="col-sm-6">
                            <input type="number" placeholder="设置字典数据显示排序" class="form-control" id="sort" name="sort" value="${dict.sort}">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-3">
                            <button class="btn btn-primary" type="submit">更新</button>
                            <button class="btn btn-default" type="reset">取消</button>
                        </div>
                    </div>
                    <input type="hidden" name="id" value="${dict.id}"/>
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
        jQuery.validator.addMethod("isDictKey", function(value, element) {
            var reg = /^[A-Z_]{2,16}$/;
            return this.optional(element) || (reg.test(value));
        }, "角色标识只能使用大写字母和下滑组成");
        $("#dictForm").validate({
           rules:{
               dictKey: {
                   required: true,
                   isDictKey: true
               },
               dictName: {
                   required: true,
                   minlength: 1,
                   maxlength: 10
               },
               dictValue: {
                   required: true,
                   minlength: 1,
                   maxlength: 16
               },
               sort: {
                   required: true,
                   min: 1,
                   max: 20
               },
           },
           messages:{
               dictKey: {
                   required: icon+"请输入字典分组标识"
               },
               dictName: {
                   required: icon+"请输入字典显示值",
                   minlength: icon+"字典显示值最少1位字符",
                   maxlength: icon+"字典显示值最多10位字符"
               },
               dictValue: {
                   required: icon+"请输入字典实际值",
                   minlength: icon+"字典实际值最少1位字符",
                   maxlength: icon+"字典实际值最多16位字符"
               },
               sort: {
                   required: icon+"请输入字典排序",
                   min: icon+"字典排序最小值：1",
                   max: icon+"字典排序最大值：20"
               }
           },
           onfocusout:false,
           onkeyup:false,

        })
    });
</script>
</body>
</html>
