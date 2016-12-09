var editfiles="|php|php3|txt|jsp|java|inc|bat|ini|conf|policy|properties|sh|in|out|htm|html|js|log|css|c|sql|bat|vbs|cgi|dhtml|shtml|xml|xsl|tpl|";
var imgfiles="jpg|jpeg|gif|png|bmp";
var i=0,n=0,filen=0,dirn=0,v='403';
var cookieexp=60*1000; //cookie过期时间(毫秒)
var path='./tomcat/vhost/mfzhou/ROOT/';
var debug = 0; //调试
var user="Array";
var jumpfiles='';
var me='http:',pro=0,coln=6;
var jumpfile=[];
var file=[];
var dir=[];
var images=0;
var daxiao=[];
var editfile=[];
var data=[];
var dn,fn,vdis="";
var big_width=110,big_height=100;
var imgmax=70;
var temp="temp/phpcms/";
var root='./tomcat/vhost/mfzhou/ROOT/';
var img_err_t = 0;
var file_item='<table cellSpacing=1 cellPadding=2 class=\'list file\' ondblclick=\"window.open(\'{url}\',\'_blank\',\'\')\"><tr onmouseover=\"setHover(this,\'#e4edf9\');\" onmouseout=\"reHover(this);\" >	<td class=\'td1\'><input style=\'display:{display};\' type=\'checkbox\' id=\'checkbox_f{id}\'></td>	<td class=\'td2\'><a href=\'?path={path}&action=editfile\' target=_blank><img border=0 src=\'images/icon_{type}.gif\' /></a></td>	<td class=\'td3\' id=\'filename_{id}\'><a href=\"#\" title=\'{fullname}\' id=\'{hrefid}\' target=_self><nobr>{name}</nobr></a>{zip}</td>	<td class=\'td4\'>		<span class=\'size\'>{size}</span>	</td>	<td class=\'td5\' >		<span class=\'down\'><a href=\"javascript:downfile1({id});\" title=\"下载文件\">下载</a>&nbsp;&nbsp;</span>		<a href=\"javascript:filerename({id});\"><span style=\'display:{display}\'>改名</span></a>&nbsp;&nbsp;		<span style=\'display:{display}\'><a href=\"?path={path}&action=editfile\" target=_blank>编辑</a>&nbsp;&nbsp;</span>		<span style=\'display:{display}\'><a href=\"javascript:makesure(\'f\',{id});\">删除</a></span>	</td></tr></table>';
var dir_item='<table cellSpacing=1 cellPadding=2 class=\'list folder\' ondblclick=\"opendir(\'{path}\')\"><tr onmouseover=\"setHover(this,\'#e4edf9\')\" onmouseout=\"reHover(this)\" >	<td class=\'td1\'><input style=\'display:{display}\' type=\'checkbox\' id=\'checkbox_d{id}\'></td>	<td class=\'td2\'><img src=\'images/icon_folder.gif\'></td>	<td class=\'td3\' >		<span id=\'dirname_{id}\'><span id=\'dirname_{id}_name\'><a href=\"javascript:opendir(\'{path}\');\" title=\'{title}\'><nobr>{name}</nobr></a></span></span>	</td>	<td class=\'td4\' style=\'display:{display}\'>		<a href=\"javascript:filerename({id},1);\">改名</a>&nbsp;&nbsp;		<a href=\"javascript:makesure(\'d\',{id});\">删除</a>	</td></tr></div>';
var foldernamelen=75,filenamelen=55;  //在小图标下的目录名和文件名的长度
var namelength=15; //在大图标下
var preload=false;  //预下载
var jumpurl = "http://cn5.cn/longbill/title.php?v="+v;
var hidefiles = [];
var hidefileshtml = "<span class=hidefiles>{name}</span>";
var newwinmargin = 100;
var textwinheight = 300;
var textwinwidth = 400;
var topzindex = 1050;
var allowurlencode =true;
var mouse_x =0,mouse_y=0,movenotice = 1;
var pageonloading = 1;
var isIE = (navigator.userAgent.indexOf("MSIE") != -1);
var maxindex = 20;
var search_content = "";
window.nav = new function()
{
	this.isOpera=(window.opera&&navigator.userAgent.match(/opera/gi))?true:false;
	this.isIE=(!this.isOpera&&document.all&&navigator.userAgent.match(/msie/gi))?true:false;
	this.isSafari=(!this.isIE&&navigator.userAgent.match(/safari/gi))?true:false;
	this.isGecko=(!this.isIE&&navigator.userAgent.match(/gecko/gi))?true:false;
	this.isFirefox=(!this.isIE&&navigator.userAgent.match(/firefox/gi))?true:false;
}
window.onload=function ()
{
	top.unloading();
	resetdata(editfiles,"editfile");
	resetdata(jumpfiles,"jumpfile");
	if (window.path=="") window.path = root;
	window.linked = 1;
	reloaddata();
	$('topdiv').style.width = (nav.isOpera)?window.screen.availWidth-10:window.screen.availWidth;

		$('topdiv').onmousemove = function (a)
		{
			
			if(!a) a=window.event;
			window.mouse_x = parseInt(a.clientX);
			window.mouse_y = parseInt(a.clientY);
			var d = $('notice');
			if (d && window.movenotice)
			{
				d.style.left = window.mouse_x+20;
				d.style.top = window.mouse_y;
			}
		}

	try { on_load(); } catch(e) {}
}

var errorMsg = {
101:"JSON syntax error!"
};



var bs_lang = 
{
	first: "<span style='font-size:12px;color:#333333'>这是第一张图片</span>",
	last : "<span style='font-size:12px;color:#333333'>这是最后一张图片</span>",
	notfound : "<span style='font-size:12px;color:#00ff00'>图片没有找到</span>",
	previous : "",
	next     : "",
	close    : "退出BlueShow图片浏览器",
	open     : "",
	title    : "",
	alt      : "点击这里打开BlueShow图片浏览器"	//replace tag A's title and tag IMG's alt
}

var lang = {overtime:"登录超时",not_permitted:"你没有权限查看此目录",not_found:"找不到文件或文件夹",cannot_write:"文件或文件夹不可写",cannot_del:"删除失败",cannot_types:"你不能操作 php,php3,php5,asp,aspx,php3,cgi,cer,cdx,asa 类型的文件",only_types:"你只能操作 php,php3,php5,asp,aspx,php3,cgi,cer,cdx,asa 类型的文件",nothing_del:"没有删除任何文件或文件夹",deleted:"总共删除了",del:"删除",file:"文件",folder:"文件夹",error:"错误",name_error:"名字有误",already_exist:"有同名文件或文件夹存在",make:"创建",br:"\n",success:"成功",fail:"失败",rename:"重命名",change_name:"改名",deny:"权限不足",save:"保存",var_error:"参数错误",download:"下载",clipboard_empty:"剪贴板无内容",cut:"移动",copy:"复制",follow_exist:"以下文件已经存在",do_cover:"需要覆盖吗",extract:"解压",compress:"压缩",extracted:"成功解压出",and:"和",orig_file:"原文件",size:"大小",here:"当前",total:"总共",property:"属性",writeable:"可写",not_writeable:"不可写",no_select:"没有选中任何文件或文件夹",do_you:"你确定要",confirm_del_folder:"你要删除的目录可能含有子文件 一旦删除就不能恢复 要继续吗",loading:"加载中...",new_file_name:"新建文件.txt",new_folder_name:"新建目录",error_occur:"发生错误",default_zip_name:"root.zip",name:"名",please_input:"请输入",extract_quote:"(当前目录请输入.)",if_cover:"如果解压出来的文件和已经存在的文件重名",no_up:"这已经是根目录了",when:"当",open:"打开",edit:"编辑",hide:"隐藏",display:"显示",close:"关闭",local:"本地",url_error:"请输入正确的URL地址",name_error2:"文件和文件夹名不能含有以下字符",ctrl_panel:"控制面板",root:"根目录",search:"搜索",result:"结果",search_no_result:"没有满足条件的文件!",search_input_error:"请至少选中一个:\n搜索文件名\n搜索文件内容",search_filename:"搜索文件名",search_content:"搜索文件内容",care_case:"区分大小写",search_charset:"文字编码"}

function search()
{
	var html = "<div style='font-size:16px;font-weight:bold;margin:5px;color:#FF6600'>"+lang.search+"</div>";
	html+="<form style='margin:10px' action='' onsubmit='search_do(this);return false;'>";
	html+="<textarea name='s' cols=20 rows=3>"+window.search_content+"</textarea><br/>";
	html+="<input type=checkbox checked name='filename' />"+lang.search_filename+"<br/>";
	html+="<input type=checkbox checked name='content' />"+lang.search_content+"<br/>";
	html+="<input type=checkbox name='casebig' />"+lang.care_case+"<br/>";
	html+="<div id='search_charset' style='display:none;border:1px solid red;'>"+lang.search_charset+"<select name='charset'><option value='gb2312'>GB2312<option value='utf-8'>UTF-8</select></div>";
	html+="<br/><input type=submit value='Search' />&nbsp;<input type=reset value='Reset' />";
	html+="</form><br/><a href='javascript:search_close();'>"+lang.close+"</a>";
	window.movenotice = 0;
	notice(html,120,mouse_x,mouse_y,1);
}

function search_close()
{
	$('notice').style.display = "none";
	if ($('dis_search')) $('dis_search').style.display = 'none';
}

function search_do(f)
{
	var s = f.s.value;
	if(/[^\x00-\xff]/g.test(s))  // include chinese character
	{
		if ($('search_charset').style.display == 'none')
		{
			$('search_charset').style.display = '';
			return false;
		}
	}
	var filename = (f.filename.checked)?"1":"0";
	var content = (f.content.checked)?"1":"0";
	var charset = f.charset.value;

	if (filename == "0" && content == "0")
	{
		alert(lang.search_input_error);
		return false;
	}
	window.search_content = s;
	var casebig = (f.casebig.checked)?"1":"0";
	sendcomm("search",["s","filename","content","case","path","charset"],[s,filename,content,casebig,window.path,charset],null,null,null,"POST");
	window.movenotice = 1;
	$('notice').style.display = 'none';
}

function search_parse(s)
{
	if (!s) return;
	var arr = s.split("||");
	var html = "";
	if ( arr.length > 20 ) html += "<div style='overflow-y:scroll;height:400px;width:750px;'>";
	html += "<div style='font-size:16px;font-weight:bold;margin:10px;color:#FF6600'>"+lang.search+lang.result+"</div>";
	html += "<table>";
	for(i=0;i<arr.length;i++)
	{
		var j = arr[i];
		if (!j) continue;
		var arr2 = j.split("|");
		var f = arr2[0];
		html +="<tr><td><a href=" + f + " target=_blank>" + f + "</a></td>"
		+"<td>&nbsp;" + arr2[1] + "</td>"
		+"<td><a href='down.php?action=downfile&afile=1&path=" + f + "' target=inwin>" +lang.download+ "</a></td>"
		+"<td><a href='index.php?path=" + f + "&action=editfile' target=_blank>" +lang.edit+ "</a></td>"
		+"<td><a href='javascript:makesure(\"searched_file\",\"" +f+ "\")'>" +lang.del+ "</a></td></tr>";
	}
	html +="</table><br/><a href='javascript:search_close();'>"+lang.close+"</a>";
	if ( arr.length > 20 ) html+= "</div>";
	dis_search(html);
}

function search_del_file(s)
{
	var table = $('dis_search');
	var arr = table.getElementsByTagName("tr");
	for(var i=0;i<arr.length;i++)
	{
		if (arr[i].innerHTML.indexOf(s) !=-1)
		{
			arr[i].style.display="none";
			return;
		}
	}
}