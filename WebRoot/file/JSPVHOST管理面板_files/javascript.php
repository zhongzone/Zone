var editfiles="|php|php3|txt|jsp|java|inc|bat|ini|conf|policy|properties|sh|in|out|htm|html|js|log|css|c|sql|bat|vbs|cgi|dhtml|shtml|xml|xsl|tpl|";
var imgfiles="jpg|jpeg|gif|png|bmp";
var i=0,n=0,filen=0,dirn=0,v='403';
var cookieexp=60*1000; //cookie����ʱ��(����)
var path='./tomcat/vhost/mfzhou/ROOT/';
var debug = 0; //����
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
var file_item='<table cellSpacing=1 cellPadding=2 class=\'list file\' ondblclick=\"window.open(\'{url}\',\'_blank\',\'\')\"><tr onmouseover=\"setHover(this,\'#e4edf9\');\" onmouseout=\"reHover(this);\" >	<td class=\'td1\'><input style=\'display:{display};\' type=\'checkbox\' id=\'checkbox_f{id}\'></td>	<td class=\'td2\'><a href=\'?path={path}&action=editfile\' target=_blank><img border=0 src=\'images/icon_{type}.gif\' /></a></td>	<td class=\'td3\' id=\'filename_{id}\'><a href=\"#\" title=\'{fullname}\' id=\'{hrefid}\' target=_self><nobr>{name}</nobr></a>{zip}</td>	<td class=\'td4\'>		<span class=\'size\'>{size}</span>	</td>	<td class=\'td5\' >		<span class=\'down\'><a href=\"javascript:downfile1({id});\" title=\"�����ļ�\">����</a>&nbsp;&nbsp;</span>		<a href=\"javascript:filerename({id});\"><span style=\'display:{display}\'>����</span></a>&nbsp;&nbsp;		<span style=\'display:{display}\'><a href=\"?path={path}&action=editfile\" target=_blank>�༭</a>&nbsp;&nbsp;</span>		<span style=\'display:{display}\'><a href=\"javascript:makesure(\'f\',{id});\">ɾ��</a></span>	</td></tr></table>';
var dir_item='<table cellSpacing=1 cellPadding=2 class=\'list folder\' ondblclick=\"opendir(\'{path}\')\"><tr onmouseover=\"setHover(this,\'#e4edf9\')\" onmouseout=\"reHover(this)\" >	<td class=\'td1\'><input style=\'display:{display}\' type=\'checkbox\' id=\'checkbox_d{id}\'></td>	<td class=\'td2\'><img src=\'images/icon_folder.gif\'></td>	<td class=\'td3\' >		<span id=\'dirname_{id}\'><span id=\'dirname_{id}_name\'><a href=\"javascript:opendir(\'{path}\');\" title=\'{title}\'><nobr>{name}</nobr></a></span></span>	</td>	<td class=\'td4\' style=\'display:{display}\'>		<a href=\"javascript:filerename({id},1);\">����</a>&nbsp;&nbsp;		<a href=\"javascript:makesure(\'d\',{id});\">ɾ��</a>	</td></tr></div>';
var foldernamelen=75,filenamelen=55;  //��Сͼ���µ�Ŀ¼�����ļ����ĳ���
var namelength=15; //�ڴ�ͼ����
var preload=false;  //Ԥ����
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
	first: "<span style='font-size:12px;color:#333333'>���ǵ�һ��ͼƬ</span>",
	last : "<span style='font-size:12px;color:#333333'>�������һ��ͼƬ</span>",
	notfound : "<span style='font-size:12px;color:#00ff00'>ͼƬû���ҵ�</span>",
	previous : "",
	next     : "",
	close    : "�˳�BlueShowͼƬ�����",
	open     : "",
	title    : "",
	alt      : "��������BlueShowͼƬ�����"	//replace tag A's title and tag IMG's alt
}

var lang = {overtime:"��¼��ʱ",not_permitted:"��û��Ȩ�޲鿴��Ŀ¼",not_found:"�Ҳ����ļ����ļ���",cannot_write:"�ļ����ļ��в���д",cannot_del:"ɾ��ʧ��",cannot_types:"�㲻�ܲ��� php,php3,php5,asp,aspx,php3,cgi,cer,cdx,asa ���͵��ļ�",only_types:"��ֻ�ܲ��� php,php3,php5,asp,aspx,php3,cgi,cer,cdx,asa ���͵��ļ�",nothing_del:"û��ɾ���κ��ļ����ļ���",deleted:"�ܹ�ɾ����",del:"ɾ��",file:"�ļ�",folder:"�ļ���",error:"����",name_error:"��������",already_exist:"��ͬ���ļ����ļ��д���",make:"����",br:"\n",success:"�ɹ�",fail:"ʧ��",rename:"������",change_name:"����",deny:"Ȩ�޲���",save:"����",var_error:"��������",download:"����",clipboard_empty:"������������",cut:"�ƶ�",copy:"����",follow_exist:"�����ļ��Ѿ�����",do_cover:"��Ҫ������",extract:"��ѹ",compress:"ѹ��",extracted:"�ɹ���ѹ��",and:"��",orig_file:"ԭ�ļ�",size:"��С",here:"��ǰ",total:"�ܹ�",property:"����",writeable:"��д",not_writeable:"����д",no_select:"û��ѡ���κ��ļ����ļ���",do_you:"��ȷ��Ҫ",confirm_del_folder:"��Ҫɾ����Ŀ¼���ܺ������ļ� һ��ɾ���Ͳ��ָܻ� Ҫ������",loading:"������...",new_file_name:"�½��ļ�.txt",new_folder_name:"�½�Ŀ¼",error_occur:"��������",default_zip_name:"root.zip",name:"��",please_input:"������",extract_quote:"(��ǰĿ¼������.)",if_cover:"�����ѹ�������ļ����Ѿ����ڵ��ļ�����",no_up:"���Ѿ��Ǹ�Ŀ¼��",when:"��",open:"��",edit:"�༭",hide:"����",display:"��ʾ",close:"�ر�",local:"����",url_error:"��������ȷ��URL��ַ",name_error2:"�ļ����ļ��������ܺ��������ַ�",ctrl_panel:"�������",root:"��Ŀ¼",search:"����",result:"���",search_no_result:"û�������������ļ�!",search_input_error:"������ѡ��һ��:\n�����ļ���\n�����ļ�����",search_filename:"�����ļ���",search_content:"�����ļ�����",care_case:"���ִ�Сд",search_charset:"���ֱ���"}

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