<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.request.contextPath }/">
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>字典管理 - 列表</title>

	    <link rel="shortcut icon" href="favicon.ico"> 
	    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
	    <link href="css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="css/animate.css" rel="stylesheet">
	    <link href="css/style.css?v=4.1.0" rel="stylesheet">
	</head>
	<body>
	   <div class="wrapper wrapper-content animated fadeInRight">
	   <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>字典管理</h5>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-md-12">
                        <div class="example">
                            <div class="btn-group hidden-xs" id="toolbar" role="group">
                                <button type="button" class="btn btn-outline btn-default add-btn">
                                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                </button>
                                <button type="button" class="btn btn-outline btn-default refresh-btn">
                                    <i class="glyphicon glyphicon-refresh" aria-hidden="true"></i>
                                </button>
                            </div>
                            <table id="dictTable" class="table table-striped" data-mobile-responsive="true">
                               
                            </table>
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
	
	
	    <!-- Bootstrap table -->
	    <script src="js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	    <script src="js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	    <script src="js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	    <script>
	    $(function(){
	    	let $table = $("#dictTable").bootstrapTable({
				url:"sys/dict/list",
				method:"GET",
				sidePagination:'server',
				pagination:true,
				pageNumber:1,
				pageSize:5,
				pageList:[5,10,15],
				paginationHAlign:"right",
				paginationDetailHAlign:"left",
				search:false,
				// searchOnEnterKey:true,
				// trimOnSearch:true,
				searchAlign:"right",
				toolbar:"#toolbar", //设置自定义工具栏容器ID，也可以是容器样式类名.toolbar
				classes: "table table-bordered table-striped table-sm table-dark",
				idField:"id",//设置列为选中列
				//显示数据
				columns:[
					{
						title:"序号",
						formatter:function(value,row,index){
							return index+1;
						}
					},{
						title:"字典标识",
						field:"dictKey"
					},{
						title:"显示值",
						field:"dictName"
					},{
						title:"实际值",
						field:"dictValue"
					},{
						title:"操作",
						formatter:function(value,row,index){
							let id = row.id;//id是类中的属性
							return [
								'<a href="javascript:;" class="btn btn-xs btn-primary update-btn" pk-id="'+id+'"><i class="fa fa-edit"/> 编辑</a>',
								'<a href="javascript:;" class="btn btn-xs btn-danger delete-btn" pk-id="'+id+'"><i class="fa fa-remove"/> 删除</a>'
							].join(" ");
						}
					}
				]
			});
	    	//动态元素的时间绑定
	    	$("#dictTable").on("click",".update-btn",function(){
				let id = $(this).attr("pk-id");
				layer.open({
					title:"字典管理 -  更新",
					type: 2,
					area: ['800px', '330px'],
					fixed: false, //不固定
					shade: 0.01,
					content: 'sys/dict/update/'+id
				});
			});
			$("#dictTable").on("click",".delete-btn",function(){
				let id = $(this).attr("pk-id");
				layer.confirm('您确定要彻底删除该字典信息吗？', {
					btn: ['彻底删除','取消'], //按钮
					shade: 0.01, //显示遮罩
					shift:6,
					icon:5
				}, function(){
					//需要发送ajax请求
					$.get("sys/dict/delete/"+id,function (data) {
						if(data.flag=="success"){
							layer.msg(data.message, {icon: 1},function(){
								$("#dictTable").bootstrapTable('refresh')
							});

							return false;
						}else{
							layer.msg(data.message,{icon:5});
							return false;
						}
					},"json")
				}, function(){});
			});
			$(".refresh-btn").click(function(){
				$("#dictTable").bootstrapTable('refresh')
			})
	    	$(".add-btn").click(function(){
				layer.open({
					title:"字典管理 -  新建",
					type: 2,
					area: ['800px', '330px'],
					fixed: false, //不固定
					shade: 0.01,
					content: 'sys/dict/add'
				});
			});
	    });
	    </script>
	    
	</body>
</html>