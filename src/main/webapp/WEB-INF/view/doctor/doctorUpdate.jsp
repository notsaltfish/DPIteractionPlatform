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
<form class="form-horizontal" action="/doctor/update" method="post">

    <fieldset>
      <div id="legend" class="">

        <legend class="">修改个人信息</legend>


      </div>
<div class="row">
    <div class="col-sm-6">
        <div class="control-group">
            <input type="hidden" name="id" value="${user.id}"/>
            <!-- Text input-->
            <label class="control-label" for="input01">姓名</label>
            <div class="controls">
                <input type="text" style="height: 30px" placeholder="姓名" value="${user.name}" name="name" class="input-xlarge">
                <p class="help-block"></p>
            </div>
        </div>

    </div>
    <div class="col-sm-6">
    <div class="control-group">

        <!-- Select Basic -->
        <label class="control-label">科室</label>
        <div class="controls">

            <select class="input-xlarge" name="departmentId">
                <c:forEach var="o" items="${dataList}" varStatus="status">
                <option value="${o.id}" <c:if test="${user.departmentId==o.id}">selected</c:if>  >${o.name}</option>

                </c:forEach>
            </select>
        </div>

    </div>
    </div>

</div>


        <div class="row">


            <div class="col-sm-6">

                <div class="control-group">

                    <!-- Select Basic -->
                    <label class="control-label">简短介绍</label>
                    <div class="controls">
                        <textarea cols="40"  rows="5" type="text"  placeholder="介绍" name="introduction" class="input-xlarge"> ${user.introduction}</textarea>
                        <p class="help-block"></p>
                    </div>


                </div>
            </div>
            <div class="col-sm-6">
                <div class="control-group">
                    <!-- Text input-->
                    <label class="control-label" >性别</label>
                    <div class="controls" style="position: relative;top:5px ">

                        <input name="sex" type="radio" class="input-medium" <c:if test="${user.sex=='男'}">checked</c:if> value="男" style="position: relative;top:-4px;" />&nbsp;男
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        <input name="sex" type="radio" class="input-medium" value="女" <c:if test="${user.sex=='女'}">checked</c:if>  style="position: relative;top:-4px;"/>&nbsp;女

                        <p class="help-block"></p>
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
$(function(){


	
})





</script>
</body>
</html>