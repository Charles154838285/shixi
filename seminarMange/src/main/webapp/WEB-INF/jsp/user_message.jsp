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
            let message = "${message}";
            let flag = "${flag}";
            let photo = "${photo}";
            layer.msg(message,{
                icon: 1,
                time: 2000 //2秒关闭（如果不配置，默认是3秒）
            },function () {
                if(flag=="photo"){
                    window.parent.$(".user-photo").attr("src","attr/"+photo);
                }
                if(flag=="user"){
                    window.parent.$(".user-name").html('${userName}<b class="caret">');
                }
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index); //再执行关闭

            });

        });
    </script>
</html>
