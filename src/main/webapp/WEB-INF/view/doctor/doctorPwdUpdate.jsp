<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery.min.js"></script>
      <%--  <script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>--%>
    <script src="/js/bootstrap.min.js"></script>
	<link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css" rel="stylesheet">

 <!--     <link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="/netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css" rel="stylesheet">
    <script src="js/bootstrap-paginator.min.js"></script> -->
    
    <script type="text/javascript">


    </script>
    <style type="text/css">

    </style>
</head>
<body>
<div class="container">
<div class="center-block" >
<form class="form-horizontal" action="/doctor/updatepassword" method="post">

    <fieldset>
      <div id="legend" class="">

        <legend class="">修改个人信息</legend>


      </div>
<div class="row">
    <div class="col-sm-12">
        <div class="control-group">
            <input type="hidden" name="id" value="${user.id}"/>
            <!-- Text input-->
            <label class="control-label">旧密码</label>
            <div class="controls">
                <input type="password" style="height: 30px" placeholder="密码"  name="oldPwd" class="input-xlarge">
                <div id="pwdTips" style="display: none;"><font style="color: red">密码错误</font></div>
            </div>
        </div>

    </div>
    <div class="col-sm-12">
    <div class="control-group">

        <!-- Select Basic -->
        <label class="control-label">新密码</label>
        <div class="controls">
            <input type="password" style="height: 30px" placeholder="密码"  name="newPwd" class="input-xlarge">
            <div id="pwdTips2" style="display: none;"><font id="fontTips" style="color: red">两次密码不一致或者不能小于6位</font></div>
        </div>

    </div>
    </div>

    <div class="col-sm-6">

        <div class="control-group">

            <!-- Select Basic -->
            <label class="control-label">密码确认</label>
            <div class="controls">
                <input type="password" style="height: 30px" placeholder="密码"  name="pwd" class="input-xlarge">

            </div>


        </div>
    </div>

</div>

    <div class="control-group" id="update-submit">
          <label class="control-label">提交</label>

          <!-- Button -->
          <div class="controls">
            <button class="btn btn-success" type="submit">提交</button>
          </div>
        </div>

    </fieldset>
  </form>

</div>
</div>
<script id="rowTemplate" type="application/html">
     <option></option>
    </script>
<script type="text/javascript">
    var result;
$(function(){

    $("form").submit(function () {
        var newPwd = $("input[name='newPwd']").val();
        var pwd = $("input[name='pwd']").val();
        if(pwd!=newPwd){
            $("input[name='newPwd']").focus();
            $("#pwdTips2").show();
            result=false
        }else if(pwd.length<6||newPwd.length<6){
            $("input[name='newPwd']").focus();
            $("#pwdTips2").show();
            result=false;
        }else{
            $("#pwdTips2").hide();
            result=true;
        }
        return result;
    })

$("input[name='oldPwd']").blur(function () {
    $.ajax({
        url:"/doctor/checkpassword",
        type:"POST",
        dataType:"json",
        data:{oldPwd:$("input[name='oldPwd']").val()},
        success:function (data) {
            if(data==0){
            $("#pwdTips").show();
            $("input[name='oldPwd']").focus();
            result=false;
            }else if(data==1){
                result=true;
                $("#pwdTips").hide();
            }
        }
    });
})
	
})





</script>
</body>
</html>