<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<style type="text/css" id="32977032000"></style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>您尚未登录</title>
<link href="css/front.css" rel="stylesheet" type="text/css">
<script src="js/hm.js"></script>
<script src="js/jquery.js" type="text/javascript"></script>
<style type="text/css" adt="123"></style>
<script src="js/front.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/whole.css">
<link rel="stylesheet" type="text/css" href="css/layout.css">
<script type="text/javascript">

	/**
	 * 点击刷新验证码	
	*/
	function loadimage() {
		document.getElementById("randImage").src = "image";
	}
	
	$(function() {
		$("#jvForm").validate();
	});
	</script>
<style type="text/css">
object,embed {
	-webkit-animation-duration: .001s;
	-webkit-animation-name: playerInserted;
	-ms-animation-duration: .001s;
	-ms-animation-name: playerInserted;
	-o-animation-duration: .001s;
	-o-animation-name: playerInserted;
	animation-duration: .001s;
	animation-name: playerInserted;
}

@
-webkit-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@
-ms-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@
-o-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@
keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}
}
</style>
</head>
<body>
	<!--header-->
	<div>
		<div class="wrapper"
			style="margin-top: 5px !important; margin-top: 12px;">
			<div class="dhlheader">
				<div class="dhlmenu">
					<a title="JEECMS官方网站" href="http://bbs.jeecms.com/" class="logo"
						id="logo"></a>
					<ul class="dhlmenu-list">
						<li class="dhlmenu-list-index current"><a href="main">首页</a></li>
						<li><a href="http://www.jeecms.com/" target="_blank">官网</a></li>
						<li><a href="http://www.jeecms.com/buy/index.htm"
							target="_blank">购买</a></li>
						<li><a href="http://www.jeecms.com/service/index.htm"
							target="_blank">服务</a></li>
						<li id="search" class=""><a
							href="http://bbs.jeecms.com/topic/search.jhtml">主题搜索</a></li>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--/header-->
	<!--main-->
	<div class="main-wrap">
		<div id="main">
			<div class="t z">
				<form id="jvForm" action="validate" method="post">
					<table width="100%" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th class="h" colspan="2">
									<h2>JEEBBS提示信息</h2>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr class="tr2">
								<td align="left"><input type="hidden" name="returnUrl"
									value="${refer != null ? refer : param.refer}"> <ulstyle
										="margin-left:60px; line-height:="" 30px;"="">
									<li style="list-style-type: circle; color: red;">
										${message} ${param.message }</li>
									</ulstyle="margin-left:60px;></td>
							</tr>

							<tr class="tr2">
								<td align="left">
									<table width="200" cellspacing="0" cellpadding="0" border="0"
										align="center">
										<tbody>
											<tr>
												<th colspan="2">会员登录</th>
											</tr>
											<tr>
												<td width="40%" align="right">用户名：</td>
												<td><input type="text" title="用户名不能为空"
													class="required input" size="15" name="username"
													id="username"></td>
											</tr>
											<tr>
												<td align="right">密码：</td>
												<td><input type="password" title="密码不能为空"
													class="required input" size="15" name="password"></td>
											</tr>
											<tr>
												<td align="right">验证码：</td>
												<td><input type="text" title="请填写验证码"
													class="required input" size="15" name="rand" id="captcha"></td>
											</tr>
											<tr>
												<td align="right"></td>
												<td><img id="randImage" src="image"
													onclick="javascript:loadimage();"></td>
											</tr>
											<tr>
												<td align="center" colspan="2"><input type="checkbox"
													value="true" name="rememberMe">&nbsp;下次自动登录 <input
													type="submit" style="vertical-align: middle;" value="提交"
													class="bta"> &nbsp;尚未注册？<a href="register">点这里注册吧.</a>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!--/main-->
	<!--footer-->
	<div style="clear: both; height: 0; overflow: hidden;"></div>
	<div id="foot">
		<p>
			<a href="http://www.jeecms.com/gywm.htm" target="_blank">关于我们</a> - <a
				href="http://www.jeecms.com/lxwm.htm" target="_blank">联系我们</a> - <a
				href="http://www.jeecms.com/zhaopin.htm" target="_blank">诚聘英才</a> -
			<a href="http://bbs.jeecms.com/fabu/index.jhtml" target="_blank">程序下载</a>
			- <a href="http://www.jeecms.com/ad.htm" target="_blank">广告服务</a> - <a
				href="http://www.jeecms.com/xkxy.htm" target="_blank">许可协议</a> - <a
				href="http://bbs.jeecms.com/login.jspx#"
				onclick="this.style.behavior=&#39;url(#default#homepage)&#39;;this.setHomePage(&#39;http://www.jeecms.com&#39;);">设为首页</a>
			- <a
				onclick="javascript:window.external.AddFavorite(&#39;index.html&#39;, &#39;JEEBBS论坛&#39;);"
				href="javascript:void(0)" class="login_user">加入收藏</a>
		</p>
		<p>电话：0791-86538070 13576281815&nbsp;&nbsp;&nbsp;&nbsp;
			传真：0791-86538070&nbsp;&nbsp;&nbsp; ICP备案号：赣ICP备13005266号</p>
		<p>
			Powered by JeeCms Copyright © 2007-2015 www.jeecms.com, All Rights
			Reserved
			<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?8c933a6a57a1ba5cd5325545075ee4ad";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
		</p>
	</div>
	<!--footer-->

</body>
</html>