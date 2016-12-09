<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0029)http://localhost:8080/jeebbs/ -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>ZZone自空间</title>
<meta name="keywords"
	content="java,cms,jsp,cms,jsp bbs,开源网站内容管理系统,网站群,站群,多站点,jeecms">
<meta name="description"
	content="讨论jsp cms、jsp bbs相关资讯，struts,hibernate,spring,freemarker最新技术研究">
<link href="css/front.css" rel="stylesheet" type="text/css">
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/front.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/whole.css">
<link rel="stylesheet" type="text/css" href="css/layout.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	、 opacity: 1;
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
	<div style="width: 1000px; margin: auto;">
		<jsp:include page="header.jsp" />
		<!--notice-->
		<div id="notice">
			<div id="notice0" style="overflow-y: hidden; float: left;">
				<ul>
					<li><a href="#" target="_blank">赞助商文字链接广告位招租</a></li>
					<li><a href="#" target="_blank">赞助商文字链接广告位招租</a></li>
					<li><a href="#" target="_blank">赞助商文字链接广告位招租</a></li>
					<li><a href="#" target="_blank">赞助商文字链接广告位招租</a></li>
				</ul>
			</div>
			<div style="width: 440px; float: right;">
				<div class="set-tab-box" style="height: 20px; padding-top: 15px;">
					<form action="search" name="jvForm" method="get">
						<select name="forumId">
							<c:forEach items="${kinds}" var="kind">
								<c:forEach items="${kind.sites }" var="site">
									<option value="${site.siteId }">${site.name }</option>
								</c:forEach>
							</c:forEach>
						</select> 关键字：<input type="text" name="keywords" value=""> <input
							type="submit" value="搜索">
					</form>
				</div>
			</div>
			<div style="overflow-y: hidden; height: 3px"></div>
		</div>
		<!--/notice-->
		<jsp:include page="login.jsp" />
		<!--登录统计栏_Begin-->
		<div style="line-height: 28px;">
			<table border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td width="30"><img src="img/icon001.gif"></td>
						<td><span style="color: #838383;">今日:</span>7 <span
							style="color: #838383;">| </span> <span style="color: #838383;">昨日:</span>
							0 <span style="color: #838383;">| </span> <span
							style="color: #838383;">最高日:</span>7 于 2011-10-15 <span
							style="color: #838383;">| </span> <span style="color: #838383;">主题:</span>7
							<span style="color: #838383;">| </span> <span
							style="color: #838383;">帖子:</span>0 <span style="color: #838383;">|
						</span> <span style="color: #838383;">会员:</span>1 <span
							style="color: #838383;">| </span> <span style="color: #838383;">欢迎新会员:</span><span
							class="black">chen</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!--登录统计栏_End-->
	</div>
	<!--main-->
	<div class="main-wrap">
		<div id="main">

			<div id="content">
				<div class="contentwrap z">


					<!-- 每个类别区块 -->
					<c:forEach items="${kinds }" var="kind">
						<div class="t z">
							<table width="100%" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<th class="h" colspan="6"><a class="closeicon fr"><img
												alt="" src="img/cate_fold.gif" /></a>
											<h2>
												» <a class="cfont">≡${kind.name}≡</a>
											</h2></th>
									</tr>

								</tbody>

								<tbody>
									<tr class="tr3">
										<!-- 每个分区只显示前4个站点-->
										<c:forEach var="site" items="${kind.sites}" begin="0" end="3">
											<td bgcolor="#FFFFFF">
												<table width="100%" border="0" align="center"
													cellpadding="0" cellspacing="0">
													<tbody>
														<tr>
															<td width="30" rowspan="2" valign="top">
																<table width="30" border="0" cellspacing="0"
																	cellpadding="0"
																	style="margin-top: 12px !important; margin-top: 5px;">
																	<tbody>
																		<tr>
																			<td valign="top">
																				<div>
																					<img src="img/tie002.gif" />
																				</div>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</td>
															<td></td>
														</tr>

														<tr>
															<td valign="top">
																<table width="100%" border="0" cellpadding="0"
																	cellspacing="0">
																	<tbody>
																		<tr>
																			<td></td>
																		</tr>

																		<tr>
																			<td>
																				<h3 class="b">
																					<a href="site?siteId=${site.siteId}">${site.name}</a>
																				</h3> <span class="b" style="color: #FF0000;">(${site.articles.size()})</span>
																			</td>
																		</tr>

																		<tr>
																			<td class="tal y-style  e"><span
																				style="color: #838383;">主题:</span>2   <span
																				style="color: #838383;">贴数:</span> <span
																				class="gray2 ">5</span></td>
																		</tr>
																		<tr>
																			<td><span style="color: #838383;">标题:</span> <a
																				href="http://localhost:8080/jeebbs/sqzx/2.jhtml#pid8"
																				title="版主帖子">版主帖子</a>  </td>
																		</tr>
																		<tr>
																			<td><span style="color: #838383;">最后发表:</span> <span
																				class="f9">[2015-04-05]</span> </td>
																		</tr>

																		<tr>
																			<td><span style="color: #838383;">作者:</span><span
																				class="gray2">zhong </span></td>
																		</tr>
																	</tbody>
																</table>
															</td>
														</tr>
													</tbody>
												</table>

											</td>
										</c:forEach>
									</tr>
								</tbody>
							</table>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="hotlink">
			&nbsp;&nbsp;
			<div class="fl">
				<img src="img/yqlj.gif">
			</div>
			<div class="fr">&nbsp;&nbsp;&nbsp;&nbsp;</div>
		</div>
	</div>
	<!--/main-->

	<jsp:include page="footer.jsp" />
</body>
</html>