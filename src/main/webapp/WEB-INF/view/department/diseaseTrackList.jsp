<%--
  Created by IntelliJ IDEA.
  User: chenyong
  Date: 2017-04-10
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery.min.js"></script>
    <!--   <script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script> -->
    <script src="/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div>
        <div class="form-horizontal" role="form">
            <div class="form-group col-sm-5">
                <label  class="col-sm-4 control-label">姓名</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="name" placeholder="姓名">
                </div>
            </div>
            <div class="form-group col-sm-5">
                <label class="col-sm-4 control-label">科室</label>
                <div class="col-sm-8 ">
                    <select class="form-control" name="departmentId">
                        <option>请选择</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10 col-sm-pull-1 text-right">
                    <button id="query" class="btn btn-info">查询</button>

                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">搜索结果</div>
        </br>
        <table id="userTable" class="table table-bordered" width="90%">
            <thead>
            <tr>

                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>电话</th>
                <th>科室</th>
                <th>状态</th>
                <th>住院日期</th>
                <th>跟踪</th>
            </tr>
            </thead>
            <tbody>
            <%-- <c:forEach items="${dataList}" var="o" varStatus="status">
             <tr>
                 <td>${o.pName}</td>
                 <td>${o.sex}</td>
                 <td>${o.age}</td>
                 <td>${o.phone}</td>
                 <td>${o.departmentName}</td>
                 <td>${o.icdName}</td>
                 <td>${o.status}</td>
                 <td><fmt:formatDate pattern="yyyy-MM-dd" value="${o.hpDate}"></fmt:formatDate></td>
                 <td>
                     <a href="/patient/toviewupdate?id=${o.id}">查看/修改</a>
                     <a href="#">指导用药</a>
                     <a href="#" id="${o.id}" onclick="deleteById(this)">删除</a>

                 </td>
             </tr>


             </c:forEach>--%>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-sm-5">
            <ul class="pagination" style="margin-top: 25px">

            </ul>
        </div>

        <div class="controls col-sm-2">
            <label  for="name">输入页码</label>
            <div class="col-sm-12">
                <input type="text" id="inputPage"  class="form-control">
            </div>
        </div>
        <div class="col-sm-1" >
            <button id="skip" class="btn btn-info" style="margin-top: 25px">确定</button>
        </div>
        <div class="col-sm-1  text-center">
            共  <label  id="totalPages" style="margin-top: 30px"></label>页
        </div>
    </div>
    <script id="rowTemplate" type="application/html">
        <tr>
            <td></td><td></td><td></td><td></td><td></td>
			<td></td><td></td><td></td>
        </tr>
    </script>

    <script>
        $(function(){
            bindDepartment();
            query(null);
        })

        $('#query').click(function() {

            query({
                    title: $('name').val(),
                    description:$('#select[name="deparmentId"]').val()
                }
            );

            //查询之后清空输入框
            //  $("input:text").val("");

        });


        function query(queryInfo) {
            var defaultArg = {
                name: $('#name').val(),
                departmentId:$('select[name="departmentId"]').val(),
                page: 1,
                pageSize:  10,
                divisionFlag:0
            };
            if(defaultArg.departmentId=="请选择"){
                defaultArg.departmentId=null;
            };
            console.log(defaultArg.departmentId);

            queryInfo = $.extend({}, defaultArg, queryInfo);
            $.ajax({
                url: "/patient/ajaxlist",
                type: "POST",
                dataType: "json",
                data: queryInfo,
                success: function (data) {

                    $('#userTable tbody').empty();
                    for (var item of data.datas) {

                        var $template = $($('#rowTemplate').html()).clone();
                        $template.children('td').eq(0).text(item.name=='null'?"":item.name);
                        $template.children('td').eq(1).text(item.sex=='null'?"":item.sex);
                        $template.children('td').eq(2).text(item.age=='null'?"":item.age);
                        $template.children('td').eq(3).text(item.phone=='null'?"":item.phone);
                        $template.children('td').eq(4).text(item.departmentName=='null'?"":item.departmentName);
                        $template.children('td').eq(5).text(item.status=='null'?"":item.status);
                        $template.children('td').eq(6).text( item.hpDate);
                        $template.children('td').eq(7).html("<a href='/doctor/diseasetrack?patientId="+item.id+"'>跟踪</a>"
                              );
                        $('#userTable').append($template);

                    };

                    myPagination(data);

                    $("#totalPages").text(Math.ceil(data.total/10))

                }

            })
        }

        function myPagination(data){
            var maxPage = Math.ceil(data.total/10);
            $(".pagination").empty();
            var page = data.page.page;
            var start = page-2;
            if(start>1){
                $(".pagination").append("<li><a href='#' onclick='pageClick(this)'><<</a></li>");
                $(".pagination").append("<li><a href='#' onclick='pageClick(this)'><</a></li>");
                for(start;start<=page+2&&start<=maxPage;start++){
                    if(start==page){
                        $(".pagination").append("<li class='active'  ><a href='#' id='currentPage' class='active'  onclick='pageClick(this)'>"+start+"</a></li>");
                    }else{
                        $(".pagination").append("<li><a href='#' onclick='pageClick(this)'>"+start+"</a></li>");
                    }
                }
                $(".pagination").append("<li><a href='#' onclick='pageClick(this)'>></a></li>");
                $(".pagination").append("<li><a href='#' onclick='pageClick(this)'>>></a></li>");

            }else{
                start=1;
                /* $(".pagination").append("<li><a href='#' onclick='pageClick(this)'><<</a></li>");
                 $(".pagination").append("<li><a href='#' onclick='pageClick(this)'><</a></li>"); */
                for(start;start<=maxPage;start++){
                    if(start==page){
                        $(".pagination").append("<li class='active'  ><a href='#' id='currentPage' onclick='pageClick(this)'>"+start+"</a></li>");
                    }else{
                        $(".pagination").append("<li><a href='#' onclick='pageClick(this)'>"+start+"</a></li>");
                    }
                }
                $(".pagination").append("<li><a href='#' onclick='pageClick(this)'>></a></li>");
                $(".pagination").append("<li><a href='#' onclick='pageClick(this)'>>></a></li>");
            }



        }



        function pageClick(e){
            var page = $(e).text();

            if(page==">"){
                page = parseInt($("#currentPage").text())+1;
            }else if(page=="<"){
                page = parseInt($("#currentPage").text())-1;
            }else if(page==">>"){
                page = parseInt($("#totalPages").text());
            }else if(page=="<<"){
                page=1;
            }
            else{
                page = parseInt(page);
            }

            if(page<1){
                page=1;
            }else if(page>parseInt($("#totalPages").text())){
                page = parseInt($("#totalPages").text());
            }
            query({
                page:page,
                pageSize: 10
            });
        }


        function bindDepartment(){

            $.ajax({
                url: "/department/selectbyname",
                type: "POST",
                dataType: "json",
                success: function (data) {
                    //alert(data);

                    //$('select[name="departmentId"] option').remove();
                    for (var item of data.datas) {
                        $('select[name="departmentId"]').append("<option value='"+item.id+"'>"+item.name+"</option>");
                    }


                },
                error:function(){
                    query();
                }
            });
        }
    </script>

</div>
</body>
</html>
