<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    <c:if test="${fn:length(dataLists)==0}">
        <div class="jumbotron">
            <h1>当前没有回复的留言</h1>

        </div>
    </c:if>

    <c:forEach items="${dataLists}" var="o" varStatus="status">
    <div <c:if test="${status.index%2==0}">class="panel  panel-primary" </c:if>
         <c:if test="${status.index%2==0}">class="panel  panel-info" </c:if>>
        <div class="panel-body">
            <div id="readedTab" style="display: none">&nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-default">已读</span><br>
            </div>
                <div class="col-sm-12">   <label class="control-label" >医生</label>
                    ${doctor.name}
            </div>
            <div style="position: relative;top:10px;bottom: 20px">
            <div class="col-sm-6">    <label class="control-label" >我的留言</label>
                    ${o.content}
            </div>

            <div class="col-sm-6">  <label class="control-label" >医生回复</label>
                    ${o.reply}
            </div>
            </div>
        </div>
        <div class="panel-footer">
            <fmt:formatDate value="${o.leaveDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
            <a href="#" onclick="readed(${o.id})" class="btn btn-primary" role="button">已读</a>
        </div>
    </div>
    <div>
        </c:forEach>


    </div>
<script>
    function readed(data){
        $.ajax({
            url:"/patient/leavemessagereaded",
            dataType:"json",
            method:"POST",
            data:{id:data},
            success:function(data){
                if(data==1){
                    $("#readedTab").show();
                }
            }
        });
    }

</script>


</div>
</body>
</html>