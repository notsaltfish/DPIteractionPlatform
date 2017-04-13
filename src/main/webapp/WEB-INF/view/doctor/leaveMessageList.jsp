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
        <h1>留言 <small>主页</small></h1>
    </div>
    <div class="row">
        <c:if test="${fn:length(dataList)==0}">
            <h1>当前没有留言 <span class="label label-default">提示</span></h1>
        </c:if>
        <c:forEach items="${dataList}" var="o" varStatus="status">
        <div class="col-sm-6 col-md-4" id="div${status.index}">

            <div class="thumbnail">
                <img src="/images/message.png" alt="...">
                <div class="caption">
                    <h3><fmt:formatDate value="${o.leaveDate}" pattern="yyyy-MM-dd"></fmt:formatDate></h3>
                    <p>${o.content}</p>
                    <p><a href="/doctor/toleavemessagereply?id=${o.id}&pId=${o.patientId}" class="btn btn-primary" role="button">回复</a> <a href="#" class="btn btn-default" id="a${status.index}" name="${o.id}" onclick="ignore(this)" role="button">忽略</a></p>
                </div>
            </div>
        </div>
        </c:forEach>

    </div>

</div>
<script>
    var lineNum = 3;
    function ignore(obj){
        var id = $(obj).attr("id");
        id = id.substring(1,2);
        var mid = $(obj).attr("name");
        $("#div"+id).fadeOut();
        setTimeout(remove,1000,$("#div"+id));
        //$("#div"+id).remove()
        $.ajax({
            url: "/doctor/nextlivemessage",
            type: "POST",
            dataType: "json",
            data:{recordsNum:lineNum++,id:mid},
            success: function (data) {

                if(data!="null"){
                    leaveMessage(data)
                }else{

                }

            },
            error:function(){
            }
        });


    }

    function remove(obj){
            obj.remove();
        var children = $(".row").children("div");
        if(children.length==0){
            $(".row").append('<h1>当前没有留言 <span class="label label-default">提示</span></h1>');

        }
    }

    function leaveMessage(data){
        alert(data);
        $(".row").append('<div class="col-sm-6 col-md-4" id="div'+lineNum+'">'+
        '<div class="thumbnail">'+
           ' <img src="/images/message.png" alt="...">'+
           ' <div class="caption">'+
            '<h3>'+data.leaveDate+'</h3>'+
            '<p>'+data.content+'</p>'+
            '<p><a href="#" class="btn btn-primary" role="button">回复</a> <a href="#" name="'+data.id+'" class="btn btn-default" id="a'+lineNum+'" onclick="ignore(this)" role="button">忽略</a></p>'+
            '</div></div></div>'
            )
    }

</script>
</body>
</html>