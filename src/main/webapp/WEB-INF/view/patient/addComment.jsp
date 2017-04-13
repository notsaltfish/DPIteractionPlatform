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
        <h1>评价 </h1>
    </div>
    <div class="container">
        <div style="background-color: #C7C7C7">
            <div class="form-horizontal" role="form">
                <div class="form-group col-sm-4">
                    <label  class="col-sm-4 control-label" style="position: relative;top: -5px">姓名:</label>
                    <div class="col-sm-8">
                        <font >${doctor.name}</font>
                    </div>
                </div>
                <div class="form-group col-sm-4">
                    <label  class="col-sm-4 control-label" style="position: relative;top: -5px">科室:</label>
                    <div class="col-sm-8 ">
                        <font>${patient.departmenttName}</font>
                    </div>
                </div>
                <div class="form-group col-sm-4">
                    <label class="col-sm-4 control-label" style="position: relative;top: -5px">性别:</label>
                    <div class="col-sm-8 ">
                        <font>${doctor.sex}</font>
                    </div>
                </div>

            </div>
            <div class="form-horizontal" role="form">
                <div class="form-group col-sm-4">
                    <label  class="col-sm-4 control-label" style="position: relative;top: -5px">介绍:</label>
                    <div class="col-sm-8">
                        <font>${doctor.introduction}</font>
                    </div>
                </div>
            </div>
        </div>

        <!-- 用药指导部分-->
        <div class="col-sm-12">

            <hr>
        </div>
        <div>
            <form action="/patient/comment" method="post">
            <div >

                <div class="form-horizontal" role="form">

                    <input type="hidden" name="pId" value="${patient.id}">
                    <div class="form-group col-sm-6">
                        <label  class="col-sm-4 control-label">优点</label>
                        <div class="col-sm-8 ">
                            <input type="text" class="form-control" name="advantage" placeholder="优点">
                        </div>
                    </div>

                </div>


                <div class="form-horizontal" role="form">
                    <div class="form-group col-sm-6">
                        <label for="description" class="col-sm-4 control-label">缺点</label>
                        <div class="col-sm-8 ">
                            <input type="text" class="form-control" name="disadvantage" placeholder="缺点">
                        </div>
                    </div>



                    <div class="form-group col-sm-6">
                        <label  class="col-sm-4 control-label">总体评价</label>
                        <div class="col-sm-8 ">
                            <textarea  class="form-control" name="content" rows="5" placeholder="总体评价"></textarea>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class=" col-sm-10 col-sm-pull-1 text-right">
                            <button id="add" type="submit" class="btn btn-info">评价</button>
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