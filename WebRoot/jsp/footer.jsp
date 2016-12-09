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
<title>尾部</title>

<!--footer-->
<div style="clear: both; height: 0; overflow: hidden;"></div>
<div id="foot">
	<p>
		<a href="http://www.jeecms.com/gywm.htm" target="_blank">关于我们</a> - <a
			href="http://www.jeecms.com/lxwm.htm" target="_blank">联系我们</a> - <a
			href="http://www.jeecms.com/zhaopin.htm" target="_blank">诚聘英才</a> - <a
			href="http://bbs.jeecms.com/fabu/index.jhtml" target="_blank">程序下载</a>
		- <a href="http://www.jeecms.com/ad.htm" target="_blank">广告服务</a> - <a
			href="http://www.jeecms.com/xkxy.htm" target="_blank">许可协议</a> - <a
			href="http://localhost:8080/jeebbs/#"
			onclick="this.style.behavior=&#39;url(#default#homepage)&#39;;this.setHomePage(&#39;http://www.jeecms.com&#39;);">设为首页</a>
		- <a
			onclick="javascript:window.external.AddFavorite(&#39;index.html&#39;, &#39;JEEBBS论坛&#39;);"
			href="javascript:void(0)" class="login_user">加入收藏</a>
	</p>
	<p>电话：0791-86538070 13576281815&nbsp;&nbsp;&nbsp;&nbsp;
		传真：0791-86538070&nbsp;&nbsp;&nbsp; ICP备案号：赣ICP备08101024号</p>
	<p>
		Powered by JeeCms Copyright © 2007-2012 www.jeecms.com, All Rights
		Reserved
		<!-- 
			<script
				src="./JEEBBS论坛 - JEECMS官方论坛 开源java cms,jsp cms,jsp bbs_files/stat.php"
				language="JavaScript" charset="gb2312"></script>
			<script
				src="./JEEBBS论坛 - JEECMS官方论坛 开源java cms,jsp cms,jsp bbs_files/core.php"
				charset="utf-8" type="text/javascript"></script>
 -->
		<a href="http://www.cnzz.com/stat/website.php?web_id=1097297"
			target="_blank" title="站长统计"><img border="0" hspace="0"
			vspace="0" src="img/pic1.gif"></a>
	</p>
</div>
<!--footer-->
</body>
</html>
