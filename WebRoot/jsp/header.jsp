<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/front.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/whole.css">
<link rel="stylesheet" type="text/css" href="css/layout.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>标题栏</title>
<script language="javascript">
	
	
	window.onload()=function()
	{
		alert("aa");
	}


	function loadimage() {
		document.getElementById("randImage").src = "image";
	}
	
	function logout()
	{
		document.getElementById("returnUrl").submit();
	}
	
</script>
</head>
<body>
	<!--DWLayoutTable_Begin-->
	<!-- 
<table width="256" border="0" cellpadding="0" cellspacing="0"> 

<form action="validate.jsp" method="post" name="loginForm"> 
<tr> 
<td width="118" height="22" valign="middle" align="center"><input type="text" name="rand" size="15"></td> 
<td width="138" valign="middle" align="center"><img alt="code..." name="randImage" id="randImage" src="image" onclick="javascript:loadimage();" width="60" height="20" border="1" align="absmiddle"></td> 
</tr> 
<tr> 
<td height="36" colspan="2" align="center" valign="middle"><a href="javascript:loadimage();"><font class=pt95>看不清点我</font></a></td> 
</tr> 
<tr> 
<td height="36" colspan="2" align="center" valign="middle"><input type="submit" name="login" value="提交"></td> 
</tr> 
</form> 
</table> 
-->
	<!--DWLayoutTable_End -->
	<!--/header-->
	<div>
		<div class="wrapper"
			style="margin-top: 5px !important; margin-top: 12px;">
			<div class="dhlheader">
				<div class="dhlmenu">
					<a title="JEECMS官方网站"
						href="./JEEBBS论坛 - JEECMS官方论坛 开源java cms,jsp cms,jsp bbs_files/JEEBBS论坛 - JEECMS官方论坛 开源java cms,jsp cms,jsp bbs.htm"
						class="logo1" id="logo1"></a>

					<ul class="dhlmenu-list">
						<li class="dhlmenu-list-index current"><a href="main">首页</a></li>
						<li><a href="http://www.jeecms.com/" target="_blank">官网</a></li>
						<li><a href="http://www.jeecms.com/buy/index.htm"
							target="_blank">购买</a></li>
						<li><a href="http://www.jeecms.com/service/index.htm"
							target="_blank">服务</a></li>
						<li id="search" class=""><a
							href="http://localhost:8080/jeebbs/topic/search.jhtml">主题搜索</a></li>
					</ul>

				</div>
			</div>
		</div>
	</div>
	<!--/header-->

</body>
</html>
