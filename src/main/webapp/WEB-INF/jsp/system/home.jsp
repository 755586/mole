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

<title>登录</title>

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
<script type="text/javascript" src="script/js/menu.js">
</script>
</head>

<body class="easyui-layout" style="overflow-y: hidden;" scroll="no"
	onselectstart="return false">
	<div region="north" split="true" border="false"
		style="height: 60px;background:#0033CC;line-height:50px;text-align:center;">
		<span
			style="height: 50px;font-size: 30px;font-weight: bold;text-align: center;color: white;">趣味英语打地鼠后台管理系统</span>
		<span
			style="height: 50px;float: right;margin-right:10px;font-size: 15px;text-align: center;color: white;">
			欢迎 ${user.name} , <a href=""><span style="color: white;" id="username"></span>
		</a> <a href="login?action=exit"><span style="color: white;">安全退出</</span> </a> </span>
	</div>
	<div region="south" split="true"
		style="height: 30px;line-height: 20px;text-align: center;">
		<span
			style="height: 20px;font-size: 10px;font-weight: bold;text-align: center;">趣味英语打地鼠后台管理系统</span>
	</div>
	<div region="west" hide="true" split="true" title="导航菜单"
		style="width:180px;" id="west">
		<div id="nav" class="easyui-accordion" fit="true" border="false">
		</div>

	</div>
	<div id="mainPanle" region="center"
		style="background: #eee; overflow-y:hidden">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="起始页">
				<iframe scrolling="auto" frameborder="0"  src="" ></iframe>
			</div>
		</div>
	</div>
</body>
</html>
