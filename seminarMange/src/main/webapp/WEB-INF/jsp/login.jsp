<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台管理系统</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script type="text/javascript">
        if(window.top !== window.self){
            window.top.location = window.location;
        }
    </script>
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">H+</h1>
        </div>
        <h3>胖先森后台管理系统</h3>

        <form class="m-t" role="form" action="sys/login" method="post" id="loginForm">
            <div class="form-group">
                <input type="text" id="account" name="account" class="form-control" placeholder="用户名" required="" aria-required="true"  autofocus value="admin">
            </div>
            <div class="form-group">
                <input type="password" id="password" name="password" class="form-control" placeholder="密码" required="" aria-required="true" value="admin">
            </div>
            <!-- 使用验证框架这里还是使用type="submit",在js中控制事件 -->
            <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>
            <p class="text-center text-danger">${message}</p>

        </form>
        <button type="submit" class="btn btn-primary block full-width m-b" id="Register">注 册</button>

    </div>
</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/layer/layer.min.js"></script>

<!-- jQuery Validation plugin javascript-->
<!-- 参考学习文档:http://www.runoob.com/jquery/jquery-plugin-validate.html -->
<script src="js/plugins/validate/jquery.validate.min.js"></script>
<script src="js/plugins/validate/messages_zh.min.js"></script>

<!-- 判断浏览器 -->
<script type="text/javascript" src="js/browser.js"></script>

<!-- 登录表单验证-->
<script type="text/javascript" src="js/admin/login.js"></script>


<script>
    $(function () {
        // 绑定点击事件到预约按钮
        $("#Register").click(function () {
            layer.open({
                title:"系统用户管理 - 注册",
                type: 2,
                area: ['780px', '450px'],
                fixed: false, //不固定
                shade: 0.01,
                content: 'sys/user/add'
            });
        });



    });
</script>



</body>

</html>
