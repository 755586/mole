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

<title>后台</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="script/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="script/jquery-easyui-1.5/themes/icon.css">
<script type="text/javascript"
	src="script/jquery-easyui-1.5/jquery.min.js"></script>
<script type="text/javascript"
	src="script/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript">
	//登录弹框
	var loginDialog;
	$(function() {
		loginDialog = $("#loginDialog");
		loginDialog.dialog({
			closable : false,
			width: 300,
    		height: 200,
    		cache: false,
			modal : true,
			buttons : [ {
				text : '登录',
				handler : function() {
					$.ajax({
						type : 'POST',
						url : 'login?action=checkUserForSystem',
						data : $("#loginForm").serialize(),
						cache : false,
						dataType : 'json',
						success : function(data, testStatus) {
							if (data && data.user) { // 成功, 隐藏dialog
								/* $("#username").html(data.user.username)
								loginDialog.dialog('close');
								$.messager.show({
									title : "提示",
									msg : data.msg,
									timeout : 2000,
								}); */
								window.location.href="system/home";
							} else { // 失败, 弹 对话框
								$.messager.alert('提示', data.msg);
							}
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							$.messager.alert('提示', "请求失败");
						}
					})
				}
			} ]
		})
	})
</script>
</head>

<body class="easyui-layout" style="overflow-y: hidden;" scroll="no"
	onselectstart="return false">
	<div region="south" split="true"
		style="height: 30px;line-height: 20px;text-align: center;">
		<span
			style="height: 20px;font-size: 10px;font-weight: bold;text-align: center;">趣味英语打地鼠后台管理系统</span>
	</div>
	<div id="loginDialog" title="管理员登录"
		style="padding:20px">
		<form id="loginForm" action="post">
			<table>
				<tr>
					<th>用户名:</th>
					<td><input name="username" type="text" />
					</td>
				</tr>
				<tr>
					<th>密&nbsp;码:</th>
					<td><input name="password" type="password" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
