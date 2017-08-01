<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html ng-app="myApp" ng-controller="myCtrl">
<head>
<base href="<%=basePath%>">

<title>悅信家具鋁材</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="script/jquery/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="script/angular-1.4.1/angular.min.js"></script>
<script type="text/javascript" src="script/angular-1.4.1/angular-ui-router.js"></script>


</head>
<body>
	<% request.getRequestDispatcher("login").forward(request, response); %>
</body>

</html>
