<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<div class="container" style="position: relative;top: 50px;">

    <div>

        <table id="userTable" class="table table-bordered" width="90%">
            <thead>
            <tr>

                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>电话</th>
                <th>科室</th>
                <th>病种</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
             <c:forEach items="${dataList}" var="o" varStatus="status">
             <tr>
                 <td>${o.name}</td>
                 <td>${o.sex}</td>
                 <td>${o.age}</td>
                 <td>${o.phone}</td>
                 <td>${o.departmentName}</td>
                 <td>${o.icdName}</td>
                 <td><c:if test="${o.status=='出院'}">未访问</c:if></td>
                 <td>
                     <a href="/randominterview/toadd?patientId=${o.id}&doctorId=${o.doctorId}">随访记录</a>
                 </td>
             </tr>


             </c:forEach>
            </tbody>
        </table>
    </div>



</div>
</body>
</html>