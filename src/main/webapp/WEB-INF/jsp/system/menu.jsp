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

<title>菜单管理</title>

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
	<table id="dgMenu"></table>
	<div id="menuDialog" class="easyui-dialog" style="width:400px"
		closed="true" buttons="#dlg-buttons">
		<form id="menuForm" method="post" novalidate
			style="margin:0;padding:20px 50px">
			<div
				style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">
				菜单信息</div>
			<div style="margin-bottom:10px">
				<input name="pId" class="easyui-textbox" required="true"
					label="上级菜单:" style="width:100%">
			</div>
			<div style="margin-bottom:10px">
				<input name="name" class="easyui-textbox" required="true"
					label="菜单名:" style="width:100%">
			</div>
			<div style="margin-bottom:10px">
				<input name="url" class="easyui-textbox" required="true"
					label="URL:" style="width:100%">
			</div>
			<div style="margin-bottom:10px">
				<input name="state" class="easyui-textbox" required="true"
					label="状态:" style="width:100%" type="number" >
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="saveMenu()" style="width:90px">Save</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#menuDialog').dialog('close')"
			style="width:90px">Cancel</a>
	</div>
	<script type="text/javascript">
		$('#dgMenu').datagrid({
			url : 'system/menu?action=list',
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
				title : '菜单名',
				width : 100
			}, {
				field : 'url',
				title : 'URL',
				width : 100
			}, {
				field : 'pId',
				formatter:function(val,row){
					return val;
				},
				title : '上级菜单',
				width : 100,
				align : 'center'
			}, {
				field : 'state',
				title : '状态',
				width : 100,
				align : 'center'
			}, {
				field : 'comment',
				title : '描述',
				width : 100,
				align : 'center'
			} ] ],
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
	</script>
	<script type="text/javascript">
		var action;
		function preadd() {
			$('#menuDialog').dialog('open').dialog('center').dialog('setTitle',
					'新增菜单');
			$('#menuForm').form('clear');
			action = "add";
		}
		function preupdate() {
			var row = $('#dgMenu').datagrid('getSelected');
			if (row) {
				$('#menuDialog').dialog('open').dialog('center').dialog(
						'setTitle', '编辑菜单');
				$('#menuForm').form('load', row);
				action = 'update&id=' + row.id;
			}
		}
		function saveMenu() {
			$('#menuForm').form('submit', {
				url : 'system/menu?action=' + action,
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
						$('#menuDialog').dialog('close'); // close the dialog
						$('#dgMenu').datagrid('reload'); // reload the user data
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
			var row = $('#dgMenu').datagrid('getSelected');
			if (row) {
				$.messager.confirm('提示', '您确认删除此菜单吗?', function(r) {
					if (r) {
						$.post('system/menu', {
							action : 'delete',
							id : row.id
						}, function(result) {
							if (result.success) {
								$.messager.show({
									title : '提示',
									msg : "删除成功"
								});
								$('#dgMenu').datagrid('reload'); // reload the menu data
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
