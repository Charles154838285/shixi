<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/plugins/layer/layer.min.js"></script>
    <script type="text/javascript">
        $(function () {
            let message = "${R.message}";
            let flag = "${R.flag}";
            layer.msg(message,{
                icon: 1,
                time: 2000 //2秒关闭（如果不配置，默认是3秒）
            },function () {
                window.location.href="${url}";
            });

        });
    </script>
</html>
