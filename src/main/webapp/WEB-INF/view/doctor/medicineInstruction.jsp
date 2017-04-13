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
<div class="container" style="position: relative;top:50px;">
   <%-- <div>
        <div class="form-horizontal" role="form">
            <div class="form-group col-sm-5">
                <label for="title" class="col-sm-4 control-label">姓名</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="pName" placeholder="姓名">
                </div>
            </div>
            <div class="form-group col-sm-5">
                <label for="description" class="col-sm-4 control-label">科室</label>
                <div class="col-sm-8 ">
                    <select class="form-control" name="departmentId">
                        <option>请选择</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10 col-sm-pull-1 text-right">
                    <button id="query" class="btn btn-info">查询</button>
                    <button id="add" class="btn btn-info">添加</button>
                </div>
            </div>
        </div>
    </div>--%>
    <div>
        <font style="font-weight: bold">
          用药历史
        </font>
        </br>
        <table id="userTable" class="table table-bordered" width="90%">
            <thead>
            <tr>


                <th>药名</th>
                <th>服用时间</th>
                <th>每次服用量</th>
                <th>每日几次</th>
                <th>起始时间</th>
                <th>服用时间长度</th>

            </tr>
            </thead>
            <tbody>

           <c:forEach items="${dataList}" var="o" varStatus="status">

               <tr <c:if test="${status.index%2==0}">class="info" </c:if>
                   <c:if test="${status.index%2==1}">class="success" </c:if>>

                <td>${o.medicineName}</td>
                <td>${o.timeTake}</td>
                <td>${o.amountTake}</td>
                <td>${o.timePerDay}</td>
                <td ><fmt:formatDate pattern="yyyy-MM-dd" value="${o.startDate}"></fmt:formatDate></td>
                <td>${o.periodTake}</td>
            </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>
       病人信息
       <hr>
       <div class="container">
           <div style="background-color: #C7C7C7">
               <div class="form-horizontal" role="form">
                   <div class="form-group col-sm-4">
                       <label  class="col-sm-4 control-label" style="position: relative;top: -5px">姓名:</label>
                       <div class="col-sm-8">
                           <font >${patient.name}</font>
                       </div>
                   </div>
                   <div class="form-group col-sm-4">
                       <label  class="col-sm-4 control-label" style="position: relative;top: -5px">病种:</label>
                       <div class="col-sm-8 ">
                            <font>${patient.icdName}</font>
                       </div>
                   </div>
                   <div class="form-group col-sm-4">
                       <label class="col-sm-4 control-label" style="position: relative;top: -5px">性别:</label>
                       <div class="col-sm-8 ">
                           <font>${patient.sex}</font>
                       </div>
                   </div>

               </div>
               <div class="form-horizontal" role="form">
                   <div class="form-group col-sm-4">
                       <label  class="col-sm-4 control-label" style="position: relative;top: -5px">年龄:</label>
                       <div class="col-sm-8">
                           <font>${patient.age}</font>
                       </div>
                   </div>
                   <div class="form-group col-sm-4">
                       <label  class="col-sm-4 control-label" style="position: relative;top: -5px">状态:</label>
                       <div class="col-sm-8 ">
                           <font>${patient.status}</font>
                       </div>
                   </div>
                   <div class="form-group col-sm-4">
                       <label  class="col-sm-4 control-label" style="position: relative;top: -5px">科室:</label>
                       <div class="col-sm-8 ">
                           <font>${patient.departmentName}</font>
                       </div>
                   </div>

               </div>
           </div>

           <!-- 用药指导部分-->
                <div class="col-sm-12">
                    用药指导
                    <hr>
                </div>
           <div>
               <div >

                   <div class="form-horizontal" role="form">
                       <input type="hidden" name="pId" value="${patient.id}">
                       <div class="form-group col-sm-6">
                           <label  class="col-sm-4 control-label">药物</label>
                           <div class="col-sm-8">
                               <div class="col-sm-8">
                               <input class="form-control" name="medicineName" placeholder="请输入药物关键词"/>
                               </div>
                               <div class="col-sm-3">
                                   <button type="button" id="mIdSelect" class="btn btn-default">确定</button>
                               </div>
                               <div class="col-sm-10" style="position: relative;top:5px">
                                   <select class="form-control" name="mId" >
                                   </select>
                               </div>
                                   </div>

                           <script>
                               $(function(){
                                 //  $("input[name='startDate']").asDatepicker();
                                   $("#mIdSelect").click(function(){
                                       $.ajax({
                                           url: "/medicine/selectbyname",
                                           type: "POST",
                                           dataType: "json",
                                           data: {medicineName:$("input[name='medicineName']").val()},
                                           success: function (data) {
                                               $('select[name="mId"]  option').remove();
                                               for (var item of data.datas) {
                                                   $('select[name="mId"]').append("<option value='"+item.id+"'>"+item.medicineName+"</option>");
                                               }


                                           },
                                           error:function(){
                                               query();
                                           }
                                       });

                                   });


                                   $("#add").click(function(){
                                       var mid = $("select[name='mId']").val();
                                       var mName= $("select[name='mId'] option:selected").text()
                                        var timeTake = $("input[name='timeTake']").val();
                                        var amountTake = $("input[name='amountTake']").val();
                                        var timePerDay = $("input[name='timePerDay']").val();
                                        var startDate = $("input[name='startDate']").val();
                                        var periodTake = $("input[name='periodTake']").val();
                                        var attention = $("textarea[name='attention']").val();
                                        var pid = $("input[name='pId']").val();
                                       $.ajax({
                                           url: "/doctor/addmedicineins",
                                           type: "POST",
                                           dataType: "json",
                                           data: {pId:pid,medicineName:mName,mId:mid,timeTake:timeTake,amountTake:amountTake,
                                                        timePerDay:timePerDay,sDate:startDate,periodTake:periodTake,attention:attention},
                                           success: function (data) {
                                                window.location.reload();
                                           },
                                           error:function(){
                                               query();
                                           }
                                       });


                                 })
                               })

                           </script>

                       </div>
                       <div class="form-group col-sm-6">
                           <label  class="col-sm-4 control-label">服用时间</label>
                           <div class="col-sm-8 ">
                               <input type="text" class="form-control" name="timeTake" placeholder="服用时间">
                           </div>
                       </div>

                   </div>


                   <div class="form-horizontal" role="form">
                       <div class="form-group col-sm-6">
                           <label for="title" class="col-sm-4 control-label">一次服用量</label>
                           <div class="col-sm-8">
                               <input type="text" class="form-control" name="amountTake" placeholder="服用量">
                           </div>
                       </div>
                       <div class="form-group col-sm-6">
                           <label for="description" class="col-sm-4 control-label">每天几次</label>
                           <div class="col-sm-8 ">
                               <input type="text" class="form-control" name="timePerDay" placeholder="每天几次">
                           </div>
                       </div>
                       <div class="form-group col-sm-6">
                           <label for="description" class="col-sm-4 control-label">起始日期</label>
                           <div class="col-sm-8 ">
                               <input type="text" onclick="WdatePicker({el:this,isShowOthers:true,dateFmt:'yyyy-MM-dd'});" class="form-control" name="startDate" placeholder="起始日期">


                           </div>
                       </div>
                       <div class="form-group col-sm-6">
                           <label for="description" class="col-sm-4 control-label">服用多久</label>
                           <div class="col-sm-8 ">
                               <input type="text" class="form-control" name="periodTake" placeholder="服用多久">
                           </div>
                       </div>

                       <div class="form-group col-sm-6">
                           <label  class="col-sm-4 control-label">注意事项</label>
                           <div class="col-sm-8 ">
                               <textarea  class="form-control" name="attention" rows="5" placeholder="注意事项"></textarea>
                           </div>
                       </div>


                       <div class="form-group">
                           <div class="col-sm-offset-2 col-sm-10 col-sm-pull-1 text-right">
                               <button id="add" class="btn btn-info">添加</button>
                           </div>
                       </div>
                   </div>

               </div>



           </div>
       </div>
    <%--<div class="row">
    	<div class="col-sm-5">
    	<ul class="pagination" style="margin-top: 25px">
           
        </ul>
    	</div>
        
        <div class="col-sm-2" >
        <label for="name">选择每页大小</label>
		<select class="form-control" name="pagenation">
			<option selected="selected" value="10" >10</option>
			<option value="20">20</option>
			<option value="50">50</option>
		</select>
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
</div>--%>
    <script id="rowTemplate" type="application/html">
        <tr>
            <td></td><td></td><td></td><td></td><td></td>
			<td></td><td></td><td></td><td></td>
        </tr>
    </script>

    <script>
        $('document').ready(function () {
          /*  //绑定科室下拉列表
            bindDepartment();
        	//页面刷新时查询

        	query(null);
        	//点击查询时查询
            $('#query').click(function() {

                query({
	        			title: $('pName').val(),
	        			description:$('#select[name="deparmentId"]').val()
	                }
                );
                
                //查询之后清空输入框
              //  $("input:text").val("");
              
            });
        	
            //改变每页大小的时候 重新查询
            $("select option").click(function(){
            	  query({
              			title: $('#pname').val(),
                      departmentId:$('select[name="departmentId"]').val(),
                  });
            });
            */
			/*$("#add").click(function(){

				location.href="/patient/toAdd";

			});*/
            


			
        });
        
        
      /* function query(queryInfo) {
            var defaultArg = {         	
       			pName: $('#pName').val(),
       			departmentId:$('select[name="departmentId"]').val(),
                page: 1,
                pageSize:  $('select[name="pagenation"]').val()
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
                        $template.children('td').eq(0).text(item.pName=='null'?"":item.pName);
                        $template.children('td').eq(1).text(item.sex=='null'?"":item.sex);
                        $template.children('td').eq(2).text(item.age=='null'?"":item.age);
                        $template.children('td').eq(3).text(item.phone=='null'?"":item.phone);
                        $template.children('td').eq(4).text(item.departmentName=='null'?"":item.departmentName);
                        $template.children('td').eq(5).text(item.icdName=='null'?"":item.icdName);
                        $template.children('td').eq(6).text(item.status=='null'?"":item.status);
                        $template.children('td').eq(7).text( item.hpDate);
                        $template.children('td').eq(8).html("<a href='/patient/toviewupdate?id="+item.id+"'>查看/修改</a>"
                               + "    <a href='#'>指导用药</a>"
                                +"   <a href='#' id="+item.id+" onclick='deleteById(this)'>删除</a>" );
                        $('#userTable').append($template);
                       
                    };
                   
                    myPagination(data);
                   
                   $("#totalPages").text(Math.ceil(data.total/$('select[name="pagenation"]').val()))
                }
              
            })
        }*/

        
        
      /*  function myPagination(data){
        	var maxPage = Math.ceil(data.total/$('select[name="pagenation"]').val());
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
        		/!* $(".pagination").append("<li><a href='#' onclick='pageClick(this)'><<</a></li>");
        		$(".pagination").append("<li><a href='#' onclick='pageClick(this)'><</a></li>"); *!/
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
        
        
        
        }*/
        
        
        

        

        
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