<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>帖子</title>
<meta
	content="版主帖子,java,cms,jsp,cms,jsp bbs,开源网站内容管理系统,网站群,站群,多站点,jeecms"
	name="keywords">
<meta
	content="版主帖子,讨论jsp cms、jsp bbs相关资讯，struts,hibernate,spring,freemarker最新技术研究"
	name="description">
<link href="css/front.css" rel="stylesheet" type="text/css">
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/front.js" type="text/javascript"></script>
<link href="css/whole.css" type="text/css" rel="stylesheet">
<link href="css/layout.css" type="text/css" rel="stylesheet">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$("#jvForm").validate($.validator.AlertError);
    </script>
<style type="text/css" adt="123"></style>
<body>
	<!-- header -->
	</script>
	<jsp:include page="header.jsp" />
	<!--main-->
	<div class="main-wrap">

		<div id="main">

			<jsp:include page="login.jsp" />

			<div class="c"></div>
			<div id="breadCrumb">
				<img align="absMiddle" src="img/home.gif"> <a
					href="http://localhost:8080/Zone/">论坛首页</a> » <a
					href="site?siteId=${	article.site.siteId}">${article.site.name}</a>
				» <a href="javascript:void(0)">${article.title}</a>
			</div>
			<div class="c"></div>

			<div class="t3">
				<span class="fr" style="margin-left: 0.5em"> <a
					href="addArticle?siteId=${article.site.siteId}"><img alt="发帖"
						src="img/post.png"></a>
				</span> <span class="fr"><a href="javascript:void(0)"
					onclick="javascript:document.getElementsByTagName('BODY')[0].scrollTop=document.getElementsByTagName('BODY')[0].scrollHeight"><img
						alt="回复" src="img/reply.png"></a></span> <span class="fl">
					<div class="c"></div>
				</span>
			</div>

			<div class="c"></div>
			<!--帖子列表_Begin-->

			<script src="js/jquery.js" type="text/javascript"></script>
			<script type="text/javascript" src="js/wbox.js"></script>
			<link rel="stylesheet" type="text/css" href="css/wbox.css">
			<style type="text/css">
.demo {
	width: 200px;
}
</style>
			<div class="t" style="border-bottom-width: 0pt; margin-bottom: 0pt">
				<table cellspacing="0" cellpadding="0" width="100%"
					style="border-bottom: rgb(169, 213, 233) 1px solid">
					<tbody>
						<tr>
							<td class="tal h b">主题 : ${article.title}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<script type="text/javascript">
function checkContent(){
  if($("#atc_content").val()==""){
     alert("内容不能为空");
     return false;
  }
  return true;
}

function checkedCount(name) {
	var batchChecks = document.getElementsByName(name);
	var count = 0;
	for (var i = 0;i < batchChecks.length; i++) {
		if (batchChecks[i].checked) {
			count++;
		}
	}
	return count;
}

function vote(name, tid){
	var itemNum = checkedCount(name);
	if(itemNum == 0){
		alert("请至少选择一项");
		return;
	}
	var items = document.getElementsByName(name);
	var itemIds = new Array();
	var count = 0;
	for(var i=0; i<items.length; i++){
		if(items[i].checked){
			itemIds[count] = items[i].value;
			count++;
		}
	}
	$.post('/jeebbs/topic/vote.jspx', {
		'itemIds':itemIds,
		'tid':tid
	}, function(data) {
		if(data.success){
			VoteResult();
		}else{
			alert(data.message);
		}
	},"json");
}
function showMagicUL(pid){
	$("#magicUL"+pid).show();
}
function showUserMagicUL(pid){
	$("#user-magic-"+pid).show();
}
function hideMagicUL(pid){
	$("#magicUL"+pid).hide();
}
function hideUserMagicUL(pid){
	$("#user-magic-"+pid).hide();
}
function apply(id, val,pid){
	$.post("/jeebbs/member/applyJson.jhtml",{"u": val},function(data){
		$("#u"+id+"_"+pid).html(data.message);
	});
}
</script>

			<a name="pid2"></a>
			<div class="t5" style="border-top-width: 0pt">
				<table cellspacing="0" cellpadding="0" width="100%"
					style="table-layout: fixed">
					<tbody>
						<tr class="tr1">
							<th class="r_two" rowspan="2"
								style="padding-right: 0pt; padding-left: 0pt; padding-bottom: 2em; width: 185px; padding-top: 0pt">
								<div
									style="padding-right: 5px; padding-left: 12px; padding-bottom: 0pt; line-height: 24px; padding-top: 5px">
									<b class="fl black"> <a target="_blank"
										href="http://localhost:8080/jeebbs/sqzx/2.jhtml#">
											${article.user.username} </a></b>
									<div class="c"></div>
								</div>
								<div class="user-pic">
									<table
										style="border-top-width: 0pt; border-left-width: 0pt; border-bottom-width: 0pt; border-right-width: 0pt">
										<tbody>
											<tr>
												<td width="1"><img class="pic" height="98" width="98"
													alt="" border="0" src="img/none.gif"
													onmouseout="hideUserMagicUL(&#39;2&#39;)"
													onmouseover="showUserMagicUL(&#39;2&#39;)"></td>
												<td style="vertical-align: top"></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div id="user-magic-2" style="display: none;">
									<ul onmousemove="showUserMagicUL(&#39;2&#39;)">
										<li><a href="http://localhost:8080/jeebbs/sqzx/2.jhtml#"
											id="magica_2_2_showip_test" title="使用道具" class="thickbox""="">窥视卡</a></li>
										<li><a href="http://localhost:8080/jeebbs/sqzx/2.jhtml#"
											id="magica_2_2_checkonline_test" title="使用道具"
											class="thickbox""="">雷达卡</a></li>
									</ul>
								</div>
							</th>
							<th class="r_one" id="td_tpc" valign="top" height="100%"
								style="border-top-width: 0pt; padding-right: 0px; padding-left: 0px; border-left-width: 0pt; border-bottom-width: 0pt; padding-bottom: 0px; overflow: hidden; padding-top: 0px; border-right-width: 0pt">
								<div class="tiptop">
									<span class="fl"><span class="b">1#</span></span> <span
										class="fl gray" style="white-space: nowrap">&nbsp;
										发表于:2012-05-03 11:59:18&nbsp; IP:127.0.*.* </span>
									<div class="fr black" style="overflow: hidden">
										<a
											href="file/版主帖子 - JEECMS官方论坛 开源java cms,jsp cms,jsp bbs.htm">显示全部</a>
										<a href="http://localhost:8080/jeebbs/sqzx/2.jhtml#">只看该作者</a>
									</div>
									<div class="c"></div>
								</div>
								<div class="c"></div>
								<div class="tpc_content f14">${article.content }</div>
								<div class="vote"></div>


							</th>
						</tr>
						<tr class="tr1 r_one">
							<th
								style="border-top-width: 0pt; padding-right: 0px; padding-left: 0px; border-left-width: 0pt; border-bottom-width: 0pt; padding-bottom: 0px; vertical-align: bottom; padding-top: 30px; border-right-width: 0pt">
								<div class="c" id="w_tpc"></div>
								<div class="sigline"></div>
								<div class="signature"
									style="overflow: hidden; height: auto; max-height: 100px">
									<table width="100%">
										<tbody>
											<tr>
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>



								<div class="tipad black">
									<span class="fr gray">
										<div id="magicUL2" onmouseout="hideMagicUL(&#39;2&#39;)"
											style="display: none;">
											<ul onmousemove="showMagicUL(&#39;2&#39;)">
												<li><a
													href="http://localhost:8080/jeebbs/sqzx/2.jhtml#"
													id="magica_2_2_open" title="使用道具" class="thickbox""="">喧嚣卡</a></li>
												<li><a
													href="http://localhost:8080/jeebbs/sqzx/2.jhtml#"
													id="magica_2_2_namepost" title="使用道具" class="thickbox""="">照妖镜</a></li>
												<li><a
													href="http://localhost:8080/jeebbs/sqzx/2.jhtml#"
													id="magica_2_2_jack" title="使用道具" class="thickbox""="">千斤顶</a></li>
												<li><a
													href="http://localhost:8080/jeebbs/sqzx/2.jhtml#"
													id="magica_2_2_sofa" title="使用道具" class="thickbox""="">抢沙发</a></li>
												<li><a
													href="http://localhost:8080/jeebbs/sqzx/2.jhtml#"
													id="magica_2_2_stick" title="使用道具" class="thickbox""="">置顶卡</a></li>
												<li><a
													href="http://localhost:8080/jeebbs/sqzx/2.jhtml#"
													id="magica_2_2_highlight" title="使用道具" class="thickbox""="">变色卡</a></li>
												<li><a
													href="http://localhost:8080/jeebbs/sqzx/2.jhtml#"
													id="magica_2_2_close" title="使用道具" class="thickbox""="">沉默卡</a></li>
												<li><a
													href="http://localhost:8080/jeebbs/sqzx/2.jhtml#"
													id="magica_2_2_bump" title="使用道具" class="thickbox""="">提升卡</a></li>
											</ul>
										</div> <a href="http://localhost:8080/jeebbs/sqzx/2.jhtml#"
										onmouseover="showMagicUL(&#39;2&#39;)">使用道具</a><br> <a
										href="http://localhost:8080/jeebbs/member/getreportpage.jspx?url=/jeebbs/sqzx/2.jhtml"
										id="reportA_/jeebbs/sqzx/2.jhtml_2">举报</a> &nbsp;&nbsp; <a
										href="javascript:scroll(0,0)">顶端</a>
									</span>
									<div class="fl readbot"></div>
									<div class="c"></div>
								</div>

							</th>
						</tr>
					</tbody>
				</table>
			</div>
			<a name="pid8"></a>
			<c:forEach var="reply" items="${replies }" varStatus="floor">
				<div class="t5" style="border-top-width: 0pt">
					<table cellspacing="0" cellpadding="0" width="100%"
						style="table-layout: fixed">
						<tbody>
							<tr class="tr1">
								<th class="r_two" rowspan="2"
									style="padding-right: 0pt; padding-left: 0pt; padding-bottom: 2em; width: 185px; padding-top: 0pt">
									<div
										style="padding-right: 5px; padding-left: 12px; padding-bottom: 0pt; line-height: 24px; padding-top: 5px">
										<b class="fl black"> <a target="_blank"
											href="http://localhost:8080/jeebbs/sqzx/2.jhtml#">
												${reply.user.username} </a></b>
										<div class="c"></div>
									</div>
									<div class="user-pic">
										<table
											style="border-top-width: 0pt; border-left-width: 0pt; border-bottom-width: 0pt; border-right-width: 0pt">
											<tbody>
												<tr>
													<td width="1"><img class="pic" height="98" width="98"
														alt="" border="0" src="img/03174851qhix.jpg"
														onmouseout="hideUserMagicUL(&#39;8&#39;)"
														onmouseover="showUserMagicUL(&#39;8&#39;)"></td>
													<td style="vertical-align: top"></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div id="user-magic-8" style="display: none;"></div>
								</th>
								<th class="r_one" id="td_tpc" valign="top" height="100%"
									style="border-top-width: 0pt; padding-right: 0px; padding-left: 0px; border-left-width: 0pt; border-bottom-width: 0pt; padding-bottom: 0px; overflow: hidden; padding-top: 0px; border-right-width: 0pt">
									<div class="tiptop">
										<span class="fl"><span class="b">${floor.index+2}#</span></span>
										<span class="fl gray" style="white-space: nowrap">&nbsp;
											发表于:2015-04-05 11:02:16&nbsp; IP:127.0.*.* </span>
										<div class="fr black" style="overflow: hidden">
											<a
												href="file/版主帖子 - JEECMS官方论坛 开源java cms,jsp cms,jsp bbs.htm">显示全部</a>
											<a href="http://localhost:8080/jeebbs/sqzx/2.jhtml#">只看该作者</a>
										</div>
										<div class="c"></div>
									</div>
									<div class="c"></div>
									<div class="tpc_content f14">${reply.content }</div>
								</th>
							</tr>
							<tr class="tr1 r_one">
								<th
									style="border-top-width: 0pt; padding-right: 0px; padding-left: 0px; border-left-width: 0pt; border-bottom-width: 0pt; padding-bottom: 0px; vertical-align: bottom; padding-top: 30px; border-right-width: 0pt">
									<div class="c" id="w_tpc"></div>
									<div class="sigline"></div>
									<div class="signature"
										style="overflow: hidden; height: auto; max-height: 100px">
										<table width="100%">
											<tbody>
												<tr>
													<td></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="tipad black">
										<span class="fr gray">
											<div id="magicUL8" onmouseout="hideMagicUL(&#39;8&#39;)"
												style="display: none;">
												<ul onmousemove="showMagicUL(&#39;8&#39;)">
													<li><a
														href="http://localhost:8080/jeebbs/sqzx/2.jhtml#"
														id="magica_8_8_namepost" title="使用道具" class="thickbox""="">照妖镜</a></li>
												</ul>
											</div> <a href="http://localhost:8080/jeebbs/sqzx/2.jhtml#"
											onmouseover="showMagicUL(&#39;8&#39;)">使用道具</a><br> <a
											href="http://localhost:8080/jeebbs/member/getreportpage.jspx?url=/jeebbs/sqzx/2.jhtml#pid8"
											id="reportA_/jeebbs/sqzx/2.jhtml#pid8_8">举报</a> &nbsp;&nbsp;
											<a href="javascript:scroll(0,0)">顶端</a>
										</span>
										<div class="fl readbot">
											<a class="r-reply" title="引用此楼"
												href="http://localhost:8080/jeebbs/post/v_quote2.jspx">引用</a>
											<a class="r-reply" title="回复此楼"
												href="http://localhost:8080/jeebbs/post/v_reply2.jspx">回复</a>
											<a class="r-reply" title="评分此楼"
												href="http://localhost:8080/jeebbs/post/v_grade2.jspx">评分</a>
										</div>
										<div class="c"></div>
									</div>
								</th>
							</tr>
						</tbody>
					</table>
				</div>
			</c:forEach>
			<script type="text/javascript"> 
var id;
var strs=new Array();
$("a[id^='magica']").each(function(){
	id=$(this).attr("id");
	strs=id.split("_");
	if(strs.length>=5){
		$(this).wBox({title: "使用道具",requestType:"iframe",iframeWH:{width:400,height:200},target:"/jeebbs/magic/getmagicpage.jspx?pid="+strs[1]+"&ppid="+strs[2]+"&mid="+strs[3]+"&username="+strs[4]});
		}else{
			$(this).wBox({title: "使用道具",requestType:"iframe",iframeWH:{width:400,height:200},target:"/jeebbs/magic/getmagicpage.jspx?pid="+strs[1]+"&ppid="+strs[2]+"&mid="+strs[3]});
			}
	});
$("a[id^='msgSendA']").each(function(){
	id=$(this).attr("id");
	strs=id.split("_");
	$(this).wBox({title: "打招呼",requestType:"iframe",iframeWH:{width:320,height:50},target:"/jeebbs/member/getsendmsgpage.jhtml?username="+strs[2]});
});
$("a[id^='reportA']").each(function(){
	id=$(this).attr("id");
	strs=id.split("_");
	$(this).wBox({title: "举报",requestType:"iframe",iframeWH:{width:320,height:50},target:"/jeebbs/member/getreportpage.jspx?pid="+strs[2]+"&&url="+strs[1]});
});
</script>
			<div class="pg-3 fl">
				<span class="current">1</span> <span class="total">共1页</span>
			</div>
			<div class="t3">
				<div class="c"></div>
			</div>
			<form id="jvForm" action="reply" method="post" validate="true"
				onsubmit="return checkContent();">
				<div class="t" style="margin-top: 5px">
					<table cellspacing="0" cellpadding="0" width="100%" align="center">
						<tbody>
							<tr
								style="color: rgb(102, 102, 102); line-height: 23px; height: 23px">
								<td class="h"><b>快速回复</b></td>
								<td class="h">&nbsp;</td>
								<td class="h" style="text-align: right"><a
									href="javascript:scroll(0,0)">顶端</a></td>
							</tr>
							<tr class="tr2">
								<td colspan="100" style="border-bottom-width: 0pt"></td>
							</tr>
							<tr>
								<td class="f_one" valign="top" width="20%"
									style="padding-right: 7px; padding-left: 7px; padding-bottom: 7px; padding-top: 7px"><b>内容</b><br>
									HTML 代码不可用 <br> <input type="checkbox" checked="checked"
									name="atc_usesign" value="1"> 使用签名 <br> <input
									type="checkbox" checked="checked" name="atc_convert" value="1">
									Code自动转换 <br> <input disabled="disabled" type="checkbox"
									name="atc_anonymous" value="1"> 匿名帖 <br> <input
									disabled="disabled" type="checkbox" name="atc_hide" value="1">
									隐藏此帖 <br> <input disabled="disabled" type="checkbox"
									name="atc_hideatt" value="1"> 隐藏附件</td>
								<td class="f_one" valign="top" width="60%"
									style="padding-right: 7px; padding-left: 7px; padding-bottom: 7px; padding-top: 7px">
									<input name="postTypeId" value="2" type="hidden"> <textarea
										id="atc_content" rows="8" style="width: 96%" name="content"></textarea>
									<input type="hidden" value="${param.id }" name="articleId">
									<div class="fr gray" id="atc_content_warn"
										style="padding-right: 15px; padding-left: 15px; padding-bottom: 0px; padding-top: 0px">限
										50,000 字符</div>
									<div style="margin: 5px 0pt">
										<input type="hidden" name="topicId" value="2"> <input
											class="btn fl b" type="submit"
											style="padding-right: 1em; padding-left: 1em; padding-bottom: 0pt; padding-top: 0pt; height: 30px"
											name="Submit" value=" 提 交 ">
									</div>
								</td>
								<td class="f_one" width="20%"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			<!--帖子列表_End-->
			<div class="c"></div>
		</div>
	</div>
	<!--/main-->
	<!--footer-->
	<div style="clear: both; height: 0; overflow: hidden;"></div>
	<div style="clear: both; height: 0; overflow: hidden;"></div>
	<div id="foot">
		<p>
			<a href="http://www.jeecms.com/gywm.htm" target="_blank">关于我们</a> - <a
				href="http://www.jeecms.com/lxwm.htm" target="_blank">联系我们</a> - <a
				href="http://www.jeecms.com/zhaopin.htm" target="_blank">诚聘英才</a> -
			<a href="http://bbs.jeecms.com/fabu/index.jhtml" target="_blank">程序下载</a>
			- <a href="http://www.jeecms.com/ad.htm" target="_blank">广告服务</a> - <a
				href="http://www.jeecms.com/xkxy.htm" target="_blank">许可协议</a> - <a
				href="http://localhost:8080/jeebbs/sqzx/2.jhtml#"
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
			<script src="file/stat.php" language="JavaScript" charset="gb2312"></script>
			<script src="file/core.php" charset="utf-8" type="text/javascript"></script>
			<a href="http://www.cnzz.com/stat/website.php?web_id=1097297"
				target="_blank" title="站长统计"><img border="0" hspace="0"
				vspace="0" src="img/pic1.gif"></a>
		</p>
	</div>
	<!--footer-->

</body>
</html>