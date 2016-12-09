<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<!--20条信息_Begin-->
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
	<!--/End-->
</body>
</html>