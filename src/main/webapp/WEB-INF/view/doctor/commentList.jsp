<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min3.37.css">
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
<div class="container" style="position: relative;top: 50px;">
    <c:forEach items="${dataList}" var="o" varStatus="status">
    <div <c:if test="${status.index%2==0}">class="panel  panel-primary" </c:if>
         <c:if test="${status.index%2!=0}">class="panel  panel-info" </c:if>>
        <div class="panel-heading">
            <h3 class="panel-title">评价</h3>
        </div>
        <div class="panel-body">
            <div class="col-sm-6">   <label class="control-label" >科室</label>
              ${o.departmentName}
            </div>
            <div class="col-sm-6">    <label class="control-label" >评价内容</label>
                ${o.content}
            </div>

                <div class="col-sm-6">  <label class="control-label" >优点</label>
                    ${o.advantage}
                </div>
          <div class="col-sm-6"> <label class="control-label" >缺点</label>
             ${o.disadvantage}
              </div>

        </div>
        <div class="panel-footer"><fmt:formatDate value="${o.commitDate}" pattern="yyyy-MM-dd"></fmt:formatDate></div>
    </div><br>
    </c:forEach>
    <div>



         <%--   <div class="panel panel-primary">...</div>
            <div class="panel panel-success">...</div>
            <div class="panel panel-info">...</div>
            <div class="panel panel-warning">...</div>
            <div class="panel panel-danger">...</div>--%>


        <%--<table id="userTable" class="table table-bordered" width="90%">
            <thead>
            <tr>

                <th>科室</th>
                <th>总体评价</th>
                <th>优点</th>
                <th>不足之处</th>
                <th>评价日期</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
             <c:forEach items="${dataList}" var="o" varStatus="status">
             <tr>
                 <td>${o.departmentName}</td>
                 <td>${o.content}</td>
                 <td>${o.advantage}</td>
                 <td>${o.disadvantage}</td>
                 <td><fmt:formatDate value="${o.commitDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                 <td>
                     <a href="#">随访记录</a>
                 </td>
             </tr>
             </c:forEach>
            </tbody>
        </table>--%>
    </div>



</div>
</body>
</html>