<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>文件上传</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>
<body>
<!-- 定义列数 -->
<div class="col-sm-12">
    <div class="ibox float-e-margins">
        <!-- 定义内容 -->
        <div class="ibox-content">
            <form method="post" class="form-horizontal" action="sys/user/update/photo" enctype="multipart/form-data" id="userForm">
                <div class="form-group">
                    <div class="col-sm-4">
                        <img id="showImage" alt="image" class="img-responsive"
                             src="attr/${user.photo}"
                             onerror="this.src='img/profile_big.jpg'"
                             style="width: 220px;height: 220px;">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2">
                        <input type="file" id="myfile" name="myfile" accept="image/*" style="display:none;">
                        <button type="button" id="uploadBtn" class="btn btn-primary btn-block">上传文件</button>
                    </div>
                </div>
                <input type="hidden" name="userId" value="${user.userId}">
            </form>
        </div>
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
        $("#uploadBtn").click(function () {
            $("#myfile").click();
            return false;
        });
        $("#myfile").change(function () {
            var myfile =this.files[0];
            //1.获取上传文件的名称
            var fileName = myfile.name;
            //2.获取上传文件的后缀名称
            var ext = fileName.substring(fileName.lastIndexOf(".")+1);
            //3.获取上传文件的后缀名称
            var allowExtArray = ["png","jpeg","png","jpg","gif"];
            var flag = true;
            for(var i=0;i<allowExtArray.length;i++){
                if(ext.toLowerCase()==allowExtArray[i]){
                    flag = false;
                    break;
                }
            }
            if(flag){
                layer.msg("您上传的文件格式不正确<br/>我们支持的上传文件的后缀名称为:<br/>["+allowExtArray.join(" , ")+"]", {icon: 5});

                return false;
            }

            var fileSize = myfile.size;
            if(fileSize>1024*1024*20){
                layer.msg("<strong>您上传的文件过大,请重新选择</strong>", {icon: 5});

                return false;
            }

            //判断浏览器是否支持File API
            if (window.File && window.FileReader && window.FileList && window.Blob) {
                var reader = new FileReader();
                reader.readAsDataURL(myfile); // 读取文件
                // 渲染文件
                reader.onload = function(arg) {
                    $("#showImage").attr("src",arg.target.result);
                }
            } else {
                layer.msg("<strong>不支持File API!!</strong>", {icon: 5});
                return false;
            }

            layer.confirm('您确定要更新头像操作吗？', {
                skin: 'layui-layer-molv', //样式类名
                btn: ['确定上传','再想一下'], //按钮
                shade: 0.01, //显示遮罩
                shift:6
            }, function(){
                $("#userForm").submit();
            }, function(){
                $("#myfile").val("");
                $("#showImage").attr("src","img/profile_big.jpg");
            });


        })
    });

</script>
</body>
</html>