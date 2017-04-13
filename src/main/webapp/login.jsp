<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <script src="/js/jquery.min.js"></script>
  <script type="text/javascript">
      $(function(){
          var flag = "${login}";

          if(flag=="-1"){
              $("#loginNoti").show();
          }else{
              $("#loginNoti").hide();
          }

      })


    $("select[name='userType']").change(function(){
       var val = $("select[name='userType']").val();
       if(val=="doctor"){
        $("form").attr("action","/doctor/login")
       }else if(val=="patient" ){
           $("form").attr("action","/patient/login")
       }else if(val=="admin"){
           $("form").attr("action","/admin/login")
       }

    });

  </script>
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
  <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

  <c:if test="${!empty msg}">
    <script>
        alert('${msg}');
    </script>
  </c:if>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="147" background="/images/top02.gif"><img src="/images/top03.gif" width="776" height="147" /></td>
  </tr>
</table>
<table width="562" border="0" align="center" cellpadding="0" cellspacing="0" class="right-table03">
  <tr>
    <td width="221"><table width="95%" border="0" cellpadding="0" cellspacing="0" class="login-text01">

      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="login-text01">
          <tr>
            <td align="center"><img src="/images/ico13.gif" width="107" height="97" /></td>
          </tr>
          <tr>
            <td height="40" align="center">&nbsp;</td>
          </tr>

        </table></td>
        <td><img src="/images/line01.gif" width="5" height="292" /></td>
      </tr>
    </table></td>
    <td>
      <form action="/doctor/login" method="post">
        <span align="left" class="login-text02">用户登录</span>
        <div display="none" id="loginNoti" style="color: red;"> 密码或ID错误</div>

        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="31%" height="35" class="login-text02">用户类型：<br /></td>
            <td width="69%">
              <select name="userType" style="width: 200px;">
                <option value="doctor" selected>医生</option>
                <option value="patient">病人</option>
                <option value="admin">管理员</option>
              </select>
            </td>
          </tr>
          <tr>
            <td width="31%" height="35" class="login-text02">用户ID：<br /></td>
            <td width="69%"><input name="id" type="text" size="30" value="1"/></td>
          </tr>
          <tr>
            <td height="35" class="login-text02">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<br /></td>
            <td><input name="pwd" type="password" size="31" value="xll"/></td>
          </tr>
          <tr>
            <td height="35">&nbsp;</td>
            <td><input name="Submit2" type="submit" class="right-button01" value="确认登陆"/>
              <input name="Submit232" type="submit" class="right-button01" value="重新填写" style="margin-left: 20px"/></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
</html>