<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="59" background="/images/top.gif"><table width="99%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="70%"><img src="/images/logo.png" border="0" /></td>
        <td width="30%" align="right" style="font-size:12px;vertical-align:top;">欢迎您${user.name}|<a href="/admin/logout" target="_top" >退出系统</a></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
