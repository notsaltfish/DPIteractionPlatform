<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery.min.js"></script>
    <!--   <script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script> -->
    <script src="/js/bootstrap.min.js"></script>
    <%-- <link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css" rel="stylesheet">
 --%>
    <!-- 	<link href="/netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css" rel="stylesheet"> -->


    <!--    <link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"> -->
    <!-- <script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="/netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css" rel="stylesheet">
    <script src="js/bootstrap-paginator.min.js"></script> -->

    <script type="text/javascript">

    </script>
</head>
<body >
<div class="container" style="position: relative;top: 20px;">
    <div class="page-header">
        <h1>留言 <small>回复</small></h1>
    </div>
    <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-3">
                    <label class="controls">姓名：</label>
                    <font> ${p.name}</font>
                </div>
                <div class="col-sm-3">
                    <label class="controls">性别：</label>
                    <font> ${p.sex}</font>
                </div>
                <div class="col-sm-3">
                    <label class="controls">年龄：</label>
                    <font> ${p.age}</font>
                </div>
                <div class="col-sm-3">
                    <label class="controls">科室：</label>
                    <font> ${p.departmentName}</font>
                </div>

            </div>

        <div class="row" style="position: relative;top:20px">
            <div class="col-sm-12">
                    <label class="controls">留言内容：</label>
                <p style="position: relative;left: 80px;">${o.content}</p>
            </div>
            <div class="col-sm-12">

                <font><fmt:formatDate value="${o.leaveDate}" pattern="yyyy-MM-dd"></fmt:formatDate></font>
            </div>
    </div>
        <hr>
        <form action="/doctor/leavemessagereply" method="post">
            <input type="hidden" name="id" value="${o.id}"/>
        <div  class="row">
            <div class="col-sm-12">
                <div class="controls control-group">
                    <textarea cols="60"  rows="10" type="text"  placeholder="回复" name="reply" class="input-xlarge"></textarea>
                    <p class="help-block"></p>

                </div>

            </div>

        </div>
            <div class="control-group">
                <!-- Button -->
                <div class="controls">
                    <button class="btn btn-success" type="submit">提交</button>
                </div>
            </div>
        </form>

</div>
<script>

</script>
</body>
</html>