<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css" id="37240620000"></style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>发表主题</title>
<link href="umeditor/themes/default/css/umeditor.css" type="text/css"
	rel="stylesheet">
<link href="css/front.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/whole.css">
<link rel="stylesheet" type="text/css" href="css/layout.css">
<link rel="stylesheet" type="text/css" href="css/zone.css">


<script src="js/hm.js"></script>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/front.js" type="text/javascript"></script>
<script type="text/javascript" src="umeditor/third-party/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="umeditor/lang/zh-cn/zh-cn.js"></script>

<script type="text/javascript">
function checkContent(){
  if($("#title").val()==""){
     alert("标题不能为空");
     return false;
  }
  if(UM.getEditor('myEditor').getContent() == ""){
     alert("内容不能为空");
     return false;
  }
  return true;
}

</script>

<script type="text/javascript">
	$("#jvForm").validate($.validator.AlertError);
</script>
<body>
	<jsp:include page="header.jsp" />
	<!--main-->
	<div class="main-wrap">
		<div id="main">
			<div id="breadCrumb">
				<img align="absMiddle" src="img/home.gif"> <a href="main">论坛</a>
				» 发表新主题
			</div>
			<div class="c"></div>
			<div class="t z">
				<form id="jvForm" action="submitArticle" method="post"
					validate="true" onsubmit="return checkContent();">
					<table cellspacing="0" cellpadding="0" width="100%" align="center">
						<tbody>
							<tr
								style="color: #666; line-height: 23px; height: 23px; width: 200px">
								<td class="h th" colspan="2"><b>发表新话题</b></td>
							</tr>
							<tr class="tr2">
								<td colspan="99" style="border-bottom-width: 0px"></td>
							</tr>
							<tr>
								<td class="f_one" valign="top"
									style="padding-bottom: 7px; padding-top: 7px"><strong>标
										题 </strong></td>
								<td class="f_one" valign="top"
									style="padding-bottom: 7px; padding-top: 7px"><input
									class="required" maxlength="100" size="50" id="title"
									name="title" type="text"> <select name="postTypeId">
										<option value="4">程序bug</option>
								</select><br></td>
							</tr>

							<tr>
								<td><strong> 内 容 </strong></td>
								<td>
									<!-- umeditor编辑器 start --> <script type="text/plain"
										id="myEditor" name="content" style="width:99%;height:100%;">
										</script> <!-- umeditor编辑器 end -->
								</td>
							</tr>
							<tr>
								<input type="hidden" name="siteId" value="${param.siteId}">
								<td></td>
								<td><input type="submit" value="提 交" class="btn"></td>
							</tr>

						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>

	<div id="_pop_container"></div>

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
				href="http://bbs.jeecms.com/topic/v_add4.jspx#"
				onclick="this.style.behavior=&#39;url(#default#homepage)&#39;;this.setHomePage(&#39;http://www.jeecms.com&#39;);">设为首页</a>
			- <a
				onclick="javascript:window.external.AddFavorite(&#39;index.html&#39;, &#39;JEEBBS论坛&#39;);"
				href="javascript:void(0)" class="login_user">加入收藏</a>
		</p>
		<p>电话：0791-86538070 13576281815&nbsp;&nbsp;&nbsp;&nbsp;
			传真：0791-86538070&nbsp;&nbsp;&nbsp; ICP备案号：赣ICP备13005266号</p>
		<p>Powered by JeeCms Copyright © 2007-2015 www.jeecms.com, All
			Rights Reserved</p>
	</div>
	<!--footer-->

	<script type="text/javascript">
    //实例化编辑器
    var um = UM.getEditor('myEditor');
    
</script>

</body>
</html>