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
<title>用户登录</title>
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
	<!--登录统计栏_Begin-->
	<div class="dlkbg">
		<div class="t3 cc">
			<c:choose>
				<c:when test="${sessionScope.username == null }">
					<div class="cc" id="nav-user">
						<form id="jvForm" action="validate" method="post">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr>
										<td><input class="uname" title="请输入用户名" maxlength="16"
											name="username" type="text"></td>
										<td><input class="pwd" title="请输入密码" type="password"
											maxlength="18" name="password"></td>
										<td><input class="yan" id="captcha" title="请输入验证码"
											maxlength="10" size="12" name="rand" type="text"></td>
										<td><img src="image" id="randImage" width="70"
											height="28" style="cursor: pointer;"
											onclick="javascript:loadimage();"></td>
										<td><select name="cookieType">
												<option value="4" selected="selected">不保存</option>
												<option value="3">保存1天</option>
												<option value="2">一个月</option>
												<option value="1">1年</option>
												<option value="0">永久</option>
										</select></td>
										<td><input type="hidden" id="return" name="returnUrl">
											<script type="text/javascript">
												document
														.getElementById("return").value = document.location;
											</script> <input type="hidden" name="returnUrl" value=""> <input
											type="submit" name="submit" value="登录" class="loginbutton"></td>
										<td>&nbsp; <a href="register" style="color: red;">注册</a>
											&nbsp; <a href="#" style="color: red;">找回密码</a></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<div class="cc" id="nav-user">

						欢迎您：${sessionScope.username} &nbsp;&nbsp;【级别：童生】 &nbsp;&nbsp;【<a
							href="">用户中心</a>】 &nbsp;&nbsp;【<a href="javascript:void(0)"
							onclick="logout()">退出</a>】
						<form id="returnUrl" action="logout" method="post">
							<input id="return" type="hidden" name="returnUrl">
							<script type="text/javascript">
									document.getElementById("return").value = document.location;
							</script>
						</form>
					</div>
				</c:otherwise>
			</c:choose>

			<div class="cc" id="nav_user"></div>
		</div>




	</div>
	<!--登录统计栏_End-->

</body>
</html>
