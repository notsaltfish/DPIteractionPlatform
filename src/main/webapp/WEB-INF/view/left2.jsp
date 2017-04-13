<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>左侧导航</title>
<head>

<style type="text/css">
body{margin:0;padding:0;overflow-x:hidden;}
html, body{height:100%;}
img{border:none;}
*{font-family:'微软雅黑';font-size:12px;color:#626262;}
dl,dt,dd{display:block;margin:0;}
a{text-decoration:none;}

#bg{background-image:url(../images/content/dotted.png);}
.container{width:100%;height:100%;margin:auto;}

/*left*/
.leftsidebar_box{width:90%;height:auto !important;overflow:visible !important;position:fixed;height:100% !important;background-color:#3992d0;}
.line{height:2px;width:100%;background-image:url(/images/left/line_bg.png);background-repeat:repeat-x;}
.leftsidebar_box dt{padding-left:40px;padding-right:10px;background-repeat:no-repeat;background-position:10px center;color:#f5f5f5;font-size:14px;position:relative;line-height:48px;cursor:pointer;}
.leftsidebar_box dd{background-color:#317eb4;padding-left:40px;}
.leftsidebar_box dd a{color:#f5f5f5;line-height:20px;}
.leftsidebar_box dt img{position:absolute;right:10px;top:20px;}
.system_log dt{background-image:url(/images/left/system.png)}
.custom dt{background-image:url(/images/left/custom.png)}
.channel dt{background-image:url(/images/left/channel.png)}
.app dt{background-image:url(/images/left/app.png)}
.cloud dt{background-image:url(/images/left/cloud.png)}
.syetem_management dt{background-image:url(/images/left/syetem_management.png)}
.source dt{background-image:url(/images/left/source.png)}
.statistics dt{background-image:url(/images/left/statistics.png)}
.leftsidebar_box dl dd:last-child{padding-bottom:10px;}
</style>

</head>

<body id="bg">

<div class="container">

	<div class="leftsidebar_box">
		<div class="line"></div>
<c:if test="${role=='doctor'}">
		<dl class="system_log">
			<dt onClick="changeImage()">患者管理<img src="/images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="/patient/list?pType=1" target="mainFrame">住院患者</a></dd>
			<dd><a href="/patient/list?pType=2" target="mainFrame">门诊患者</a></dd>
			<!--
			<dd><a href="#">消费记录</a></dd>
			<dd><a href="#">操作记录</a></dd>
			-->
		</dl>
</c:if>
		<c:if test="${role!='patient'}">
		<dl class="custom">
			<dt onClick="changeImage()">患者随访<img src="/images/left/select_xl01.png"></dt>
			<c:if test="${role!='admin'}">
			<dd class="first_dd"><a href="/randominterview/uninter" target="mainFrame">随访记录</a></dd>
			</c:if>
			<dd><a href="/randominterview/statistic" target="mainFrame">随访统计</a></dd>
			<!--
			<dd><a href="#">未成交客户管理</a></dd>
			<dd><a href="#">即将到期客户管理</a></dd>
			-->
		</dl>
		</c:if>
<c:if test="${role!='admin'}">
		<dl class="channel">
			<dt>评价留言<img src="/images/left/select_xl01.png"></dt>
	<c:if test="${role=='doctor'}">
			<dd class="first_dd"><a href="/doctor/comment" target="mainFrame">查看我的评价</a></dd>
			<dd><a href="/doctor/livemessage" target="mainFrame">查看我的留言</a></dd>
	</c:if>
			<c:if test="${role=='patient'}">
				<dd class="first_dd"><a href="/patient/tocomment" target="mainFrame">对我的医生评价</a></dd>
				<dd class="first_dd"><a href="/patient/toleavemessage" target="mainFrame">对我的医生留言</a></dd>
				<dd><a href="/patient/checkleavemessage" target="mainFrame">查看我的留言回复</a></dd>
			</c:if>

			<!--
			<dd><a href="#">系统通知</a></dd>
			<dd><a href="#">渠道商管理</a></dd>
			<dd><a href="#">渠道商链接</a></dd>
			-->
		</dl>
</c:if>
		<c:if test="${role=='doctor'}">
		<dl class="app">
			<dt onClick="changeImage()">科室延伸<img src="/images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="/doctor/diseasetracklist" target="mainFrame">病情跟踪</a></dd>
			<dd><a href="/doctor/mediceinstructlist" target="mainFrame">指导用药</a></dd>
		<!--	<dd><a href="#">接口类型管理</a></dd>-->
		</dl>
		</c:if>

		<c:if test="${role=='admin'}">

			<dl class="syetem_management">
				<dt>医院设置<img src="images/left/select_xl01.png"></dt>
				<dd class="first_dd"><a href="/admin/todepartmentmana" target="mainFrame">科室管理</a></dd>
				<dd><a href="/admin/tomedicinemana" target="mainFrame">药品管理</a></dd>
				<dd><a href="/admin/todiseasemana" target="mainFrame">病种管理</a></dd>
				<%--<dd><a href="#">栏目管理</a></dd>
				<dd><a href="#">微官网模板组管理</a></dd>
				<dd><a href="#">商城模板管理</a></dd>
				<dd><a href="#">微功能管理</a></dd>
				<dd><a href="#">修改用户密码</a></dd>--%>
			</dl>

			<dl class="source">
				<dt>人员管理<img src="images/left/select_xl01.png"></dt>
				<dd class="first_dd"><a href="/admin/todoctormana" target="mainFrame">医生管理</a></dd>
				<dd><a href="/admin/topatientmana" target="mainFrame"> 患者管理</a></dd>
				<%--<dd><a href="#">推广管理</a></dd>--%>
			</dl>

		</c:if>


		<dl class="cloud">
			<dt>个人信息<img src="/images/left/select_xl01.png"></dt>
			<c:if test="${role=='doctor'}">
			<dd class="first_dd"><a href="/doctor/toupdate" target="mainFrame">修改我的信息</a></dd>
			</c:if>
			<dd class="first_dd"><a href="/${role}/toupdatepassword" target="mainFrame">修改<c:if test="${role=='doctor'||role=='patient'}">密码</c:if><c:if test="${role=='admin'}">管理员信息</c:if></a></dd>
		</dl>
	<!-- 
		<dl class="syetem_management">
			<dt>系统管理<img src="images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="#">后台用户管理</a></dd>
			<dd><a href="#">角色管理</a></dd>
			<dd><a href="#">客户类型管理</a></dd>
			<dd><a href="#">栏目管理</a></dd>
			<dd><a href="#">微官网模板组管理</a></dd>
			<dd><a href="#">商城模板管理</a></dd>
			<dd><a href="#">微功能管理</a></dd>
			<dd><a href="#">修改用户密码</a></dd>
		</dl>
	
		<dl class="source">
			<dt>素材库管理<img src="images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="#">图片库</a></dd>
			<dd><a href="#">链接库</a></dd>
			<dd><a href="#">推广管理</a></dd>
		</dl>
	
		<dl class="statistics">
			<dt>统计分析<img src="images/left/select_xl01.png"></dt>
			<dd class="first_dd"><a href="#">客户统计</a></dd>
		</dl>
		-->
	
	</div>

</div>

<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
$(".leftsidebar_box dt").css({"background-color":"#3992d0"});
$(".leftsidebar_box dt img").attr("src","/images/left/select_xl01.png");
$(function(){
	$(".leftsidebar_box dd").hide();
	$(".leftsidebar_box dt").click(function(){
		$(".leftsidebar_box dt").css({"background-color":"#3992d0"})
		$(this).css({"background-color": "#317eb4"});
		$(this).parent().find('dd').removeClass("menu_chioce");
		$(".leftsidebar_box dt img").attr("src","/images/left/select_xl01.png");
		$(this).parent().find('img').attr("src","/images/left/select_xl.png");
		$(".menu_chioce").slideUp(); 
		$(this).parent().find('dd').slideToggle();
		$(this).parent().find('dd').addClass("menu_chioce");
	});
})
</script>


</body>
</html>
