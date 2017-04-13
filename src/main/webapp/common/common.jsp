<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	function $(id){
		return document.getElementById(id);
	}
</script>
<c:if test="${!empty msg}">
	<script>
		alert('${msg}');
	</script>
</c:if>

<%
/*	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	User uuser = (User)session.getAttribute("user");
	if(uuser==null||uuser.getId()==0){
		response.sendRedirect(basePath+"login.jsp");
	}*/
%>
<style type="text/css">
.btn {border:1px #C5C5C5 solid;height:20px;line-height:18px;background-image: url(/images/btn_bg2.gif);cursor:pointer;font-size:12px;background-color:#FFFFFF;}
</style>