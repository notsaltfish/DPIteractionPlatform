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
<div class="container">


    <div class="page-header">
        <h2>  未随访名单</h2>
    </div>
    <div class="form-horizontal" role="form">
        <div class="form-group col-sm-12">


            <label for="title" class="  col-sm-1 control-label">名称</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="name" placeholder="名称">
            </div>
            <label for="description" class="col-sm-1 control-label">科室</label>
            <div class="col-sm-4">
                <select class="form-control" name="departmentId">
                    <option>请选择</option>
                </select>
            </div>

            <button id="query" class="btn btn-info">查询</button>
        </div>

    </div>


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
        $('document').ready(function () {
            //绑定科室下拉列表
            bindDepartment();
        	//页面刷新时查询

        	query(null);
        	//点击查询时查询
            $('#query').click(function() {

                query({
	        			title: $('name').val(),
	        			description:$('#select[name="deparmentId"]').val()
	                }
                );
                
                //查询之后清空输入框
              //  $("input:text").val("");
              
            });
        	

            
			$("#skip").click(function(){
				var page = $("#inputPage").val();
				 var maxPage = $("#totalPages").text();
				 if(page>parseInt(maxPage)||page<=0||isNaN(page)){
					 alert("页码不正确");
					 $("#inputPage").val("");
					 return ;
				 }
				query({
					page:page
				});
			});
			
        });
        
        
       function query(queryInfo) {
            var defaultArg = {         	
       			name: $('#name').val(),
       			departmentId:$('select[name="departmentId"]').val(),
                page: 1,
                pageSize:  10,
                status:"出院"
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
                        $template.children('td').eq(0).text(item.name==null?"":item.name);
                        $template.children('td').eq(1).text(item.sex==null?"":item.sex);
                        $template.children('td').eq(2).text(item.age==null?"":item.age);
                        $template.children('td').eq(3).text(item.phone==null?"":item.phone);
                        $template.children('td').eq(4).text(item.departmentName==null?"":item.departmentName);
                        $template.children('td').eq(5).text(item.icdName==null?"":item.icdName);
                        $template.children('td').eq(6).text(item.status=="出院"?"未访问":item.status);
                        $template.children('td').eq(7).html("<a href='/randominterview/toadd?patientId="+item.id+"&doctorId="+item.doctorId+"'>随访记录</a>" );
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
            	for(start;start<=page+2&&start<=maxPage;start++){
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
        
        
        
        
        
        
        
        
        
        
        function deleteById(e){
        	var del = confirm("确认删除么")
        	if(!del){
        		return;
        	}
        	$.ajax({
                url: "/patient/delete",
                type: "POST",
                dataType: "json",
                data: {id:$(e).attr("id")},
                success: function (data) {
                    location.href="/patient/list";
                },
                error:function(){
                	query();
                }
        	});
       
        	query();
        }
        
        function update(e){
        	var id = $(e).attr("id");
        	location.href = "update.html?id="+id;
        	
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