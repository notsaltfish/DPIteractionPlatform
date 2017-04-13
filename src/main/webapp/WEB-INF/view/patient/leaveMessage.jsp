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

    <script src="/js/datepicker/WdatePicker.js"></script>

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
<div class="container" style="position: relative;">
    <div class="page-header">
        <h1>留言 </h1>
    </div>
    对${doctor.name}医生留言
    <hr>
    <div class="container">


        <!-- 用药指导部分-->
        <div class="col-sm-12">

        </div>
        <div>
            <form action="/patient/leavemessage" method="post">
            <div >
                    <input type="hidden" name="patientId" value="${user.id}"/>
                    <div class="form-group col-sm-10">
                        <label  class="col-sm-1 control-label">留言</label>
                        <div class="col-sm-9 ">
                            <textarea  class="form-control" name="content" rows="10" cols="40" placeholder="留言内容"></textarea>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10">
                            <button id="add" type="submit" class="btn btn-info">留言</button>
                        </div>
                    </div>
                </div>

            </div>
            </form>


        </div>

    </div>

</div>
</body>
</html>