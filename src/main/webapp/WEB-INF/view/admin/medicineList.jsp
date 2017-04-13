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
        <h1>   药品信息管理 </h1>
    </div>
    <div class="form-horizontal" role="form">
        <div class="form-group col-sm-12">
            <label for="title" class=" col-sm-offset-5 col-sm-1 control-label">名称</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="name" placeholder="名称">
            </div>
            <button id="query" class="btn btn-info">查询</button>
            <button id="add" class="btn btn-info">添加</button>
        </div>

    </div>
    <div>
        <table id="userTable" class="table table-bordered" width="90%">
            <thead>
            <tr>

                <th>部门ID</th>
                <th>药品名称</th>
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


    <!-- 模态框（Modal） -->
    <div class="modal fade"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:300px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        修改科室
                    </h4>
                </div>
                <div class="modal-body">
                    <div id="idDiv">
                    <p>
                        <label  class="control-label">id</label>
                        <input type="text" name="id" readonly class="form-control"/>
                    </p>
                    </div>
                    <p>
                        <label  class="control-label">药品名称</label>
                    <input type="text" name="medicineName" class="form-control"/>
                    </p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="modalSub" onclick="updateD()" class="btn btn-primary">
                        提交
                    </button>
                </div>


                <script>

                    $("#add").click(function(){
                        $("#idDiv").hide();
                        $("#myModalLabel").text("添加科室");
                        $("#modalSub").attr("onclick","add()");
                        $('#myModal').modal('show');
                        var name = $("input[name='medicineName']").val("")
                    });

                    function add(){
                        var name = $("input[name='medicineName']").val();
                        $('#myModal').modal('hide')
                        $.ajax({
                            url: "/admin/add",
                            type: "POST",
                            dataType: "json",
                            data: {type:"medicine",name:name},
                            success: function (data) {
                                query();
                            },
                            error:function(){
                                query();
                            }
                        });

                    }
                    function updateD(){
                        $("#idDiv").show();
                        $("#modalSub").attr("onclick","updateD()");
                    var name = $("input[name='medicineName']").val();
                    var id = $("input[name='id']").val()
                        $('#myModal').modal('hide')

                        $.ajax({
                            url: "/admin/update",
                            type: "POST",
                            dataType: "json",
                            data: {type:"medicine",id:id,name:name},
                            success: function (data) {
                                query();
                            },
                            error:function(){
                                query();
                            }
                        });


                    }

                    function modify(obj){
                       var id = $(obj).parent("td").parent("tr").find("td:eq(0)").text();
                        var name = $(obj).parent("td").parent("tr").find("td:eq(1)").text();

                        $("input[name='id']").val(id);
                        $("input[name='medicineName']").val(name);
                    }



                </script>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div class="modal fade"  id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:300px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="deleteModalLabel">
                        提示
                    </h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="deleteId"  />
                    确认删除么？

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button"  onclick="deleteById()" class="btn btn-primary">
                       确认
                    </button>
                </div>


                <script>
                    function deleteAction(obj){
                        var id = $(obj).parent("td").parent("tr").find("td:eq(0)").text();
                        $("input[name='deleteId']").val(id);
                    }

                    function deleteById(){
                            var id =   $("input[name='deleteId']").val();
                        $('#deleteModal').modal('hide')
                        $.ajax({
                            url: "/admin/delete",
                            type: "POST",
                            dataType: "json",
                            data: {type:"medicine",id:id},
                            success: function (data) {
            
                            },
                            error:function(){
                                query();
                            }
                        });

                        query();
                    }

                </script>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
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
            <td></td><td></td>
            <td>
            <button  onclick="modify(this)" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
                修改
        </button>
            <button  onclick="deleteAction(this)" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal">
                删除
        </button>
        </td>

        </tr>
    </script>

    <script>
        $('document').ready(function () {
            //绑定科室下拉列表

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
        	
            //改变每页大小的时候 重新查询
            $("select option").click(function(){
            	  query({
              			title: $('#name').val(),
                      departmentId:$('select[name="departmentId"]').val(),
                  });
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
                type:"medicine"
            };
            if(defaultArg.departmentId=="请选择"){
                defaultArg.departmentId=null;
            };
            console.log(defaultArg.departmentId);

           queryInfo = $.extend({}, defaultArg, queryInfo);
            $.ajax({
                url: "/admin/ajaxlist",
                type: "POST",
                dataType: "json",
                data: queryInfo,
                success: function (data) {

                    $('#userTable tbody').empty();
                    for (var item of data.datas) {
                    	
                        var $template = $($('#rowTemplate').html()).clone();
                        $template.children('td').eq(0).text(item.id);
                        $template.children('td').eq(1).text(item.medicineName=='null'?"":item.medicineName);

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



        
        
        
        

        
        function update(e){
        	var id = $(e).attr("id");
        	location.href = "update.html?id="+id;
        	
        }



    </script>
</div>
</body>
</html>