<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>RBAC - 主页</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span>
                            <img alt="image" class="img-circle user-photo" style="width: 64px;height: 64px;"
                                   src="attr/${requestScope.user.photo}"
                                   onerror='this.src="img/profile_small.jpg"' />
                        </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <!-- 通过Session中获取当前用户的账号信息 -->
                                    <span class="block m-t-xs"><strong class="font-bold">${user.account}</strong></span>
                                    <!-- 获取用户的真实姓名,如果没有需要显示"无名氏" -->
                                    <span class="text-muted text-xs block user-name">${user.userName}<b class="caret"></b></span>
                                </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li>
                                <a href="javascript:;" id="myPhoto">修改头像</a>
                            </li>
                            <li>
                                <a href="javascript:;" id="myUser">个人资料</a>
                            </li>
                            <li>
                                <a href="javascript:;" id="myPassword">设置密码</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="javascript:;" class="logout">安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <!-- 折叠导航栏目时候显示的文字 -->
                    <div class="logo-element">RBAC</div>
                </li>
                <li>
                    <a class="J_menuItem active" href="sys/content" ><i class="fa fa-home"></i> <span class="nav-label">主页</span></a>
                </li>
                <c:forEach items="${requestScope.navMenuList}" var="parent">
                <li>
                    <!-- 一级菜单 -->
                    <a href="javascript:;">
                        <i class="${parent.icon}"></i>
                        <span class="nav-label">${parent.menuName}</span>
                        <span class="fa arrow"></span>
                    </a>
                    <!-- 二级菜单 -->
                    <ul class="nav nav-second-level">
                        <c:forEach items="${parent.childMenuList}" var="child">
                        <li>
                            <a class="J_menuItem" href="${child.url}"><i class="${child.icon}"></i> ${child.menuName}</a>
                        </li>
                        </c:forEach>
                    </ul>

                </li>
                </c:forEach>



            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="sys/main"><i class="fa fa-bars"></i> </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown hidden-xs">
                        <a class="right-sidebar-toggle" aria-expanded="false">
                            <i class="fa fa-tasks"></i> 主题
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="sys/content">首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </li>
                </ul>
            </div>
            <a href="javascript:;" class="roll-nav roll-right J_tabExit logout"><i class="fa fa fa-sign-out"></i> 退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="sys/content" frameborder="0" data-id="sys/content" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">&copy; 2014-2015 <a href="http://www.zi-han.net/" target="_blank">zihan's blog</a>
            </div>
        </div>
    </div>
    <!--右侧部分结束-->
    <!--右侧边栏开始-->
    <div id="right-sidebar">
        <div class="sidebar-container">

            <ul class="nav nav-tabs navs-3">

                <li class="active">
                    <a data-toggle="tab" href="#tab-1">
                        <i class="fa fa-gear"></i> 主题
                    </a>
                </li>
                <!--<li class="">
                    <a data-toggle="tab" href="#tab-2">
                        通知
                    </a>
                </li>
                <li>
                    <a data-toggle="tab" href="#tab-3">
                        项目进度
                    </a>
                </li>-->
            </ul>

            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="sidebar-title">
                        <h3> <i class="fa fa-comments-o"></i> 主题设置</h3>
                        <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                    </div>
                    <div class="skin-setttings">
                        <div class="title">主题设置</div>
                        <div class="setings-item">
                            <span>收起左侧菜单</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                    <label class="onoffswitch-label" for="collapsemenu">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定顶部</span>

                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                    <label class="onoffswitch-label" for="fixednavbar">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                                <span>
                        固定宽度
                    </span>

                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                    <label class="onoffswitch-label" for="boxedlayout">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="title">皮肤选择</div>
                        <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                         <a href="#" class="s-skin-0">
                             默认皮肤
                         </a>
                    </span>
                        </div>
                        <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-1">
                            蓝色主题
                        </a>
                    </span>
                        </div>
                        <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-3">
                            黄色/紫色主题
                        </a>
                    </span>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
    <!--右侧边栏结束-->
</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="js/hplus.js?v=4.1.0"></script>
<script type="text/javascript" src="js/contabs.js"></script>

<!-- 第三方插件 -->
<script src="js/plugins/pace/pace.min.js"></script>

<!-- 安全退出功能 -->
<script type="text/javascript">
    $(function(){
        $(".logout").on("click",function () {
            layer.confirm('您确定安全退出系统吗？', {
                anim: 4,
                btn: ['狠心一下','继续逛逛'] //按钮
            }, function(){
                window.top.location.href="sys/logout";
            }, function(){

            });
        });

        $("#myPhoto").click(function(){
            let id = '${sessionScope.session_user.userId}';
            layer.open({
                title:"系统用户 - 头像",
                type: 2,
                area: ['350px', '400px'],
                fixed: false, //不固定
                shade: 0.01,
                content: 'sys/user/edit/photo/'+id
            });
        });
        $("#myUser").click(function(){
            let id = '${sessionScope.session_user.userId}';
            layer.open({
                title:"系统用户 - 资料",
                type: 2,
                area: ['780px', '450px'],
                fixed: false, //不固定
                shade: 0.01,
                content: 'sys/user/edit/'+id
            });
        });
        $("#myPassword").click(function(){
            layer.open({
                title:"系统用户 - 设置密码",
                type: 2,
                area: ['780px', '450px'],
                fixed: false, //不固定
                shade: 0.01,
                content: 'sys/user/update/password'
            });
        });
    });


</script>

</body>

</html>
