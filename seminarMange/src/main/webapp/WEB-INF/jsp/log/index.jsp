<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.request.contextPath }/">
		<meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>操作日志管理 - 列表</title>

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
                <h5>操作日志列表</h5>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-md-12">
                        <div class="example">
                            <div class="btn-group hidden-xs" id="toolbar" role="group">
                                <button type="button" class="btn btn-outline btn-default remove-btn">
                                    <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                </button>
                                <button type="button" class="btn btn-outline btn-default refresh-btn">
                                    <i class="glyphicon glyphicon-refresh" aria-hidden="true"></i>
                                </button>
                            </div>
                            <table id="logTable" class="table table-striped" data-mobile-responsive="true">
                               
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
	    	let $table = $("#logTable").bootstrapTable({
				url:"sys/log/list",
				method:"GET",
				pagination:true,
				pageNumber:1,
				pageSize:5,
				pageList:[5,10,15],
				paginationHAlign:"right",
				paginationDetailHAlign:"left",
				search:true,
				searchOnEnterKey:true,
				trimOnSearch:true,
				searchAlign:"right",
				toolbar:"#toolbar", //设置自定义工具栏容器ID，也可以是容器样式类名.toolbar
				classes: "table table-bordered table-striped table-sm table-dark",
				idField:"id",//设置列为选中列
				//显示数据
				columns:[
					{
						checkbox:true
					},{
						title:"序号",
						formatter:function(value,row,index){
							return index+1;
						}
					},{
						title:"操作名称",
						field:"name"
					},{
						title:"操作人",
						field:"account"
					},{
						title:"操作时间",
						field:"createDate"
					},{
						title:"客户端IP",
						field:"ip"
					},{
						title:"执行方法",
						field:"method",
						formatter:function(value,row,index){
							let methodName = value.substring(value.lastIndexOf(".")+1);
							return "<a href='javascript:;' class='btn btn-xs btn-info method-btn' content='"+value+"'>"+methodName+"</a>";
						}
					},{
						title:"传递参数",
						field:"params",
						formatter:function(value,row,index){
							return "<a href='javascript:;' class='btn btn-xs btn-warning param-btn' content='"+value+"'>查看参数</a>";
						}
					}
				]
			});
	    	//动态元素的时间绑定
	    	$("#logTable").on("click",".method-btn,.param-btn",function(){
	    		let content = $(this).attr("content");
	    		layer.alert(content);
			});
			$(".refresh-btn").click(function(){
				$("#logTable").bootstrapTable('refresh')
			})
	    	$(".remove-btn").click(function(){
	    		let rows = $("#logTable").bootstrapTable("getSelections");
	    		if(rows.length==0){
	    			layer.msg("请选择要删除的记录");
				}else{
	    			let arr = [];
	    			$(rows).each(function(){
						arr.push(this.id);
					});
					layer.confirm('您确定要删除这些记录吗？', {
						btn: ['确定删除','取消'], //按钮
						shade: 0.01, //显示遮罩
						shift:6
					}, function(){
						//需要发送ajax请求
						$.post("sys/log/delete",{logs:arr},function (data) {
							if(data.flag=="success"){
								layer.msg(data.message,function(){
									$("#logTable").bootstrapTable("refresh");
								});
								return false;
							}else{
								layer.msg(data.message);
								return false;
							}
						},"json")
					}, function(){});
				}
			});
	    });
	    </script>
	    
	</body>
</html>