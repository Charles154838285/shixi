<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>系统菜单管理 - 主页</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/jsTree/style.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>
<body class="gray-bg">
<div class="row">
    <div class="col-sm-12">
        <div class="ibox">
            <div class="ibox-title">
                <h5>系统菜单管理</h5>
                <!--<div class="ibox-tools">
                    <a href="projects.html" class="btn btn-primary btn-xs">创建新项目</a>
                </div>-->
                <div style="margin-left: 100px; float: none;text-align: left;display: block">
                    <button type="button" id="menu-add-btn" class="btn btn-success btn-xs"><i class="fa fa-tree"></i> 新建菜单</button>
                    <button type="button" id="menu-edit-btn" class="btn btn-primary btn-xs"><i class="fa fa-plus"></i> 编辑菜单</button>
                    <button type="button" id="menu-remove-btn" class="btn btn-danger btn-xs"><i class="fa fa-remove"></i> 删除菜单</button>
                    <button type="button" id="menu-loading-btn" class="btn btn-white btn-xs" onclick="javascript:window.location.reload(true)"><i class="fa fa-refresh"></i></button>
                </div>

            </div>
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-4">

                        <div class="ibox-content">
                            <div id="menu-tree"></div>
                        </div>
                    </div>
                    <div class="col-sm-8">

                        <div class="ibox-content">
                            <iframe src=""  id="menuIframe" width="100%"  frameborder="0"></iframe>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>

<!-- jsTree plugin javascript -->
<script src="js/plugins/jsTree/jstree.min.js"></script>
<style>
    .jstree-default .jstree-icon.none {
        width: 0;
    }
</style>
<script type="text/javascript">
    //全局函数，相当于window对象下增加一个方法
    function loadMenuTree(){
        $.get("sys/menu/list",function(data){
            let treeData = {
                "id":"-1",
                "text":"RBAC菜单管理",
                "icon":"fa fa-folder"
            };
            treeData["children"]=data;
            menuTree.jstree(true).settings.core.data=treeData;
            menuTree.jstree(true).refresh();
        },"json")
    }
    var menuTree = null;//全局变量
    $(function () {
        //加载树
        menuTree = $("#menu-tree").jstree({
            //完成加载完毕就展开全部节点
            'plugins': ["state"],
            'state': {
                "opened":true
            },
            // 配置节点信息
            "core":{
                "multiple" : false,
                "data":null
            }
        });
        loadMenuTree();//加载数据
        $("#menu-tree").on("loaded.jstree",function(event,data){
            menuTree.jstree("open_all");
        });
        $("#menu-tree").on("refresh.jstree",function(event,data){
            menuTree.jstree("open_all");
        });


        $("#menu-add-btn").click(function () {
            //1.获取选中的节点
            var menuTree = $('#menu-tree').jstree(true);
            var selectedNode = menuTree.get_selected();
            if(selectedNode.length==0){
                layer.msg("请选中一个节点进行操作!");
                return false;
            }

            var node = menuTree.get_node(selectedNode[0]);
            //2.获取当前节点的ID--作为父节点使用
            var id = node.id;
            var parentId = menuTree.get_parent(node);
            if(id==-1 || parentId==-1 ){
                //5.设置添加节点的页面
                var url = "sys/menu/add/"+id;//id作为父节点使用，id是-1代表添加父节点，不是-1添加的是子节点
                //6.跳转页面
                $("#menuIframe").attr("src",url);
            }else{
                layer.msg("该节点为子节点，不能继续添加子节点");
                return false;
            }
        });


        $("#menu-edit-btn").click(function () {
            //1.获取选中的节点
            var menuTree = $('#menu-tree').jstree(true);
            var selectedNode = menuTree.get_selected();
            if(selectedNode.length==0){
                layer.msg("请选中一个节点进行操作!");
                return false;
            }

            var node = menuTree.get_node(selectedNode[0]);
            //2.获取当前节点的ID--作为父节点使用
            var id = node.id;
            if(id==-1){
                layer.msg("根节点无法进行编辑操作!");
                return false;
            }
            //5.设置编辑节点的页面
            var url = "sys/menu/update/"+id;
            //6.跳转页面
            $("#menuIframe").attr("src",url);


        });
        $("#menu-remove-btn").click(function () {
            //1.获取选中的节点
            var menuTree = $('#menu-tree').jstree(true);
            var selectedNode = menuTree.get_selected();
            if(selectedNode.length==0){
                layer.msg("请选中一个节点进行操作!");
                return false;
            }

            var node = menuTree.get_node(selectedNode[0]);
            //2.获取当前节点的ID--作为父节点使用
            var id = node.id;
            if(id==-1){
                layer.msg("根节点无法进行删除操作!");
                return false;
            }

            //4.获取当前节点的子节点
            var childNodes = menuTree.get_children_dom(node);
            var parentId = menuTree.get_parent(node);
            if(parentId==-1&&childNodes.length>0){
                layer.msg("该节点下存在子节点,无法进行删除操作");
                return false;
            }
            layer.confirm('您确定要删除节点操作吗？', {
                skin: 'layui-layer-molv', //样式类名
                btn: ['确定删除','取消'], //按钮
                shade: 0.01, //显示遮罩
                shift:6
            }, function(){
                //需要发送ajax请求
                $.post("sys/menu/delete/"+id,function (data) {
                    if(data.flag=="success"){
                        layer.msg(data.message,function(){
                            loadMenuTree();
                        });
                        return false;
                    }else{
                        layer.msg(data.message);
                        return false;
                    }
                },"json")
            }, function(){});


        });


        $('#menu-tree').bind("activate_node.jstree", function (obj, e) {
            $("#menuIframe").attr("src","");
            // 处理代码
            // 获取当前节点
            //var currentNode = e.node;

            // console.log(currentNode)
            // console.log(currentNode.li_attr.id)
            // console.log(currentNode.li_attr["node_type"])
        });
    })

</script>

<script type="text/javascript">
    window.onload=window.onresize=function(){
        console.log($(document).height())
        $("#menuIframe").height($(document).height()-198);
    }

</script>
</body>
</html>