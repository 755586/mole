<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>参数管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="script/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="script/jquery-easyui-1.5/themes/icon.css">
<script type="text/javascript"
	src="script/jquery-easyui-1.5/jquery.min.js"></script>
<script type="text/javascript"
	src="script/jquery-easyui-1.5/jquery.easyui.min.js"></script>
</head>

<body onselectstart="return false">
	<table id="dgPar"></table>
	<div id="parDialog" class="easyui-dialog" style="width:400px"
		closed="true" buttons="#dlg-buttons">
		<form id="parForm" method="post" novalidate
			style="margin:0;padding:20px 50px">
			<div
				style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">
				参数信息</div>

			<div style="margin-bottom:10px">
				<input name="name" class="easyui-textbox" required="true"
					label="参数名:" style="width:100%">
			</div>
			<div style="margin-bottom:10px">
				<input name="value" class="easyui-textbox" required="true"
					label="参数值:" style="width:100%">
			</div>
			<div style="margin-bottom:10px">
				<input name="comment" class="easyui-textbox" required="true"
					label="描述:" style="width:100%">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="savePar()" style="width:90px">Save</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#parDialog').dialog('close')"
			style="width:90px">Cancel</a>
	</div>
	<script type="text/javascript">
		$('#dgPar').datagrid({
			url : 'system/par?action=list',
			queryParams : {
				rand: Math.random()
			},
			method : 'post',
			nowrap : false,//单行显示
			pageSize : 10,//每页显示的记录条数，默认为10
			pageList : [ 5, 10, 20, 30, 50 ],//可以设置每页记录条数的列表
			showFooter : true,//显示页脚
			singleSelect : true,//是否单选
			pagination : true,//分页控件
			rownumbers : false,//行号
			remoteSort : false,//进行服务器端全局排序方式
			idField : 'id', //主键
			loadMsg : '正在加载数据，请稍等...',
			fitColumns : true,
			fit : true,
			sortName : 'name',//Defines which column can be sorted.
			sortOrder : 'asc',//Defines the column sort order,can only be 'asc'升序 or 'desc'降序.
			columns : [ [ {
				field : 'id',
				title : 'ID',
				width : 100,
				hidden : true
			}, {
				field : 'num',
				title : '编号',
				width : 100,
				sortable : true,
				checkbox : true
			}, {
				field : 'name',
				title : '参数名',
				width : 100
			}, {
				field : 'value',
				title : '参数值',
				width : 100
			}, {
				field : 'comment',
				title : '参数描述',
				width : 100,
				align : 'center'
			}] ],
			toolbar : [ {
				text : '添加',
				iconCls : 'icon-add',
				handler : function() {
					preadd();
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					preupdate();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					predelete();
				}
			} ],
		});
		function FormatDate (strTime) {
    		var date = new Date(strTime);
    		return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
		}
	</script>
	<script type="text/javascript">
		var action;
		function preadd() {
			$('#parDialog').dialog('open').dialog('center').dialog('setTitle',
					'新增参数');
			$('#parForm').form('clear');
			action = "add";
		}
		function preupdate() {
			var row = $('#dgPar').datagrid('getSelected');
			if (row) {
				$('#parDialog').dialog('open').dialog('center').dialog(
						'setTitle', '编辑参数');
				$('#parForm').form('load', row);
				action = 'update&id=' + row.id;
			}
		}
		function savePar() {
			$('#parForm').form('submit', {
				url : 'system/par?action=' + action,
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					//console.log(result)
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.show({
							title : '提示',
							msg : result.successMsg
						});
						$('#parDialog').dialog('close'); // close the dialog
						$('#dgPar').datagrid('reload'); // reload the par data
					} else {
						$.messager.show({
							title : '提示',
							msg : result.errorMsg
						});
					}
				}
			});
		}
		function predelete() {
			var row = $('#dgPar').datagrid('getSelected');
			if (row) {
				$.messager.confirm('提示', '您确认删除此参数吗?', function(r) {
					if (r) {
						$.post('system/par', {
							action : 'delete',
							id : row.id
						}, function(result) {
							if (result.success) {
								$.messager.show({
									title : '提示',
									msg : "删除成功"
								});
								$('#dgPar').datagrid('reload'); // reload the par data
							} else {
								$.messager.show({ // show error message
									title : '提示',
									msg :  "删除失败"
								});
							}
						}, 'json');
					}
				});
			}
		}
	</script>
</body>
</html>
