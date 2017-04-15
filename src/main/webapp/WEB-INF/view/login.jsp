<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>医患交互平台登录</title>
	<link rel="stylesheet" type="text/css" href="/css/styles.css">

		<script src="http://libs.baidu.com/html5shiv/3.7/html5shiv.min.js"></script>
		<script src="/js/jquery.min.js"></script>

	<script type="text/javascript">
        $(function(){
            var flag = "${login}";

            if(flag=="-1"){
                $("#loginNoti").show();
            }else{
                $("#loginNoti").hide();
            }


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

        })


	</script>
</head>
<body background="/images/loginbg.jpg">
	<div class="jq22-container" style="padding-top:100px">

		<div class="login-wrap">

			<div class="login-html">
				<img src="/images/mini-logo.png" style="position: relative;bottom: 45px;right: 20px"/>
				<font style="position: relative;bottom: 50px;font-size: 25px">医患互动信息系统登录</font>
				<form action="/doctor/login" method="post">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登录</label>
				<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
				<div class="login-form">
					<div class="sign-in-htm">
						<div  id="loginNoti" style="display: none;color: red;"> 密码或ID错误</div>
						<div class="group" style="display:inline">
							<label for="user" class="label">用户类型</label>
							 <select name="userType" class="input" style="">
								<option style="background-color:rgba(40,57,101,.9)" value="doctor">医生</option>
								<option style="background-color:rgba(40,57,101,.9)" value="patient">患者</option>
								<option style="background-color:rgba(40,57,101,.9)" value="admin">管理员</option>
							</select >
						
							<!--
							<label for="user" class="label">医生</label>
							<input id="user" name="type" type="radio" class="input" value="医生">患者<input id="user" name="type" type="radio" class="input" value="患者">
							
							管理员<input id="user" name="type" type="radio" class="input" value="管理员">-->
						</div>
						<div class="group">
							<label for="user" class="label">用户ID</label>
							<input id="user" name="id" type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">密码</label>
							<input id="pass" name="pwd" type="password" class="input" data-type="password">
						</div>
						<!--  
						<div class="group">
							<input id="check" type="checkbox" class="check" checked>
							<label for="check"><span class="icon"></span> Keep me Signed in</label>
						</div>
						-->
						<div class="group">
							<input type="submit" class="button" value="登录">
						</div>
						<div class="hr"></div>
						<!--  -->
						<!--  
						<div class="foot-lnk">
							<a href="#forgot">Forgot Password?</a>
						</div>
						-->
					</div>
					
				</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>