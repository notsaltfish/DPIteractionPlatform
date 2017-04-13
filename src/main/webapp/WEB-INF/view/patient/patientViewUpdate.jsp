<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery.min.js"></script>
      <%--  <script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>--%>
    <script src="/js/bootstrap.min.js"></script>
	<link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css" rel="stylesheet">
    <script src="/js/bootstrap-paginator.min.js"></script>
    
 <!--     <link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="/netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css" rel="stylesheet">
    <script src="js/bootstrap-paginator.min.js"></script> -->
    
    <script type="text/javascript">


    </script>
    <style type="text/css">
.message{
    border-radius: 15px;
    padding:10px;
    background-color:rgb(103,103,103);
     width:200px;height:200px;
     display:block;
     position: absolute;
     top:50%;
     left:50%;
     margin-left:-100px;
     margin-top:-150px;
      opacity: 0.5;
      color:white;
      line-height: 50px;
      font-size: 30px;
      display: none;
     word-break:break-all;
     padding-top: 40px;
  }
    </style>
</head>
<body>
<div class="center-block" >
<form class="form-horizontal" style="margin-left: 100px">

    <fieldset>
      <div id="legend" class="">

          <legend class="">查看或者修改</legend>
          <button class="btn btn-default" type="button" onclick="activeUpdate()">修改</button>


      </div>
<div class="row">
    <div class="form-group col-sm-6">
        <input type="hidden" name="id" value="${o.id}"/>
          <!-- Text input-->
          <label class="control-label col-sm-4" for="input01">姓名</label>
          <div class="col-sm-8">
            <input type="text" style="height: 30px" placeholder="姓名" value="${o.name}" name="name" class="form-control">
            <p class="help-block"></p>
          </div>
        </div>

        <div class="form-group col-sm-6">

            <!-- Text input-->
            <label class="control-label col-sm-4" for="input01">电话</label>
            <div class="col-sm-8">
                <input type="text" style="height: 30px" placeholder="电话" value="${o.phone}" name="phone" class="form-control">
                <p class="help-block"></p>
            </div>
        </div>

</div>

        <div class="row">
    <div class="form-group col-sm-6">

          <!-- Text input-->
          <label class="control-label col-sm-4"  for="input02">性别</label>
          <div class="col-sm-8">

              <input name="sex" type="radio" class="input-medium" <c:if test="${o.sex=='男'}">checked</c:if> value="男" style="position: relative;top:-4px;" />&nbsp;男
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <input name="sex" type="radio" class="input-medium" value="女" <c:if test="${o.sex=='女'}">checked</c:if>  style="position: relative;top:-4px;"/>&nbsp;女

            <p class="help-block"></p>
          </div>
        </div>
        <div class="form-group col-sm-6">

            <!-- Text input-->
            <label class="control-label col-sm-4" for="input03">年龄</label>
            <div class="col-sm-8">
                <input type="text" style="height: 30px" placeholder="年龄"  value="${o.age}" name="age" class="form-control">
                <p class="help-block"></p>
            </div>
        </div>

        </div>

        <div class="row">
        <div class="form-group col-sm-6">

            <!-- Text input-->
            <label class="control-label col-sm-4" for="input04">病种</label>
            <div class="col-sm-8">
                <input type="text" style="height: 30px" placeholder="输入关键词进行搜索" id="disease_name"  class="input-medium">
                <button type="button" class="btn btn-default" id="selectDisease">搜索</button>
                <select class="input-medium" name="icdCode" >
                    <option value="${o.icdCode}" selected>${o.icdName}</option>
                </select>
        </div>
        </div>

        <script>
            $(function(){
                $('input,select,textarea').attr('disabled',true);
                $("#update-submit").hide();
                bindDepartment();

                $("#selectDisease").click(function(){

                    $.ajax({
                        url: "/disease/selectbyname",
                        type: "POST",
                        dataType: "json",
                        data: {name:$("#disease_name").val()},
                        success: function (data) {

                            bindDisease(data);
                        },
                        error:function(){
                            query();
                        }
                    });

                });

                $('select[name="icdCode"]').change(function(){
                    //alert($('select[name="icdCode"]').val())
                })



            })
//从后台查询到的病种信息 动态生成select的option
        function bindDisease(data){

            $('select[name="icdCode"] option').remove();
            for (var item of data.datas) {

                $('select[name="icdCode"]').append("<option value='"+item.icdCode+"'>"+item.name+"</option>");
            }

        }

        //通过ajax绑定科室的数据到select
        function bindDepartment(){

            $.ajax({
                url: "/department/selectbyname",
                type: "POST",
                dataType: "json",
                success: function (data) {
                //alert(data);

                    $('select[name="departmentId"] option').remove();
                    for (var item of data.datas) {
                        if(item.id=="${o.departmentId}"){

                            $('select[name="departmentId"]').append("<option value='"+item.id+"' selected>"+item.name+"</option>");
                        }else{
                            $('select[name="departmentId"]').append("<option value='"+item.id+"' >"+item.name+"</option>");

                        }
                    }


                },
                error:function(){
                    query();
                }
            });
        }

        function activeUpdate(){
            $('input,select,textarea').attr('disabled',false);
            $("#update-submit").show();
        }
        </script>

    <div class="form-group col-sm-6">

          <!-- Select Basic -->
          <label class="control-label col-sm-4">科室</label>
          <div class="col-sm-8">

            <select class="form-control" name="departmentId">
           
            </select>
          </div>

        </div>

        </div>
        <div class="row">
            <div class="form-group col-sm-6">

                <!-- Select Basic -->
                <label class="control-label col-sm-4">描述</label>
                <div class="col-sm-8">
                    <textarea cols="40"  rows="10" type="text"  placeholder="描述" name="description" class="input-xlarge"> ${o.description}</textarea>
                    <p class="help-block"></p>
                </div>


            </div>
        <div class="form-group col-sm-6">

            <!-- Select Basic -->
            <label class="control-label col-sm-4">住院类型</label>
            <div class="col-sm-8">

                <select class="form-control" name="pType">

                    <option value="住院" <c:if test="${o.pType=='住院'}">selected</c:if>>住院</option>
                    <option value="门诊"<c:if test="${o.pType=='门诊'}">selected</c:if>>门诊</option>
                </select>
            </div>

        </div>

        </div>

    <div class="control-group" id="update-submit">
          <label class="control-label">提交</label>

          <!-- Button -->
          <div class="controls">
            <button class="btn btn-success" type="submit">提交</button>
          </div>
        </div>

    </fieldset>
  </form>
   <div class="message" ></div> 
</div>
<script id="rowTemplate" type="application/html">
     <option></option>
    </script>
<script type="text/javascript">
$(function(){

	$("form").submit(function(){

		update();
		return false;
	});
	
})


 function update(){

	var name =  $("input[name='name']").val();
	var id =  $("input[name='id']").val();
	var age = $("input[name='age']").val();
	var sex =  $("input[name='sex']").val();
	var  description  = $("textarea[name='description']").val();
     var icdCode = $('select[name="icdCode"]').val();
     var departmentId=$('select[name="departmentId"').val();
     var phone = $("input[name='phone']").val();
     var pType= $("select[name='pType']").val();
     var icdName = $('select[name="icdCode"] option:selected').text();
	$.ajax({
        url: "/patient/update",
        type: "POST",
        dataType: "json",
        data: {id:id,name:name,age:age,sex:sex,icdCode:icdCode,icdName:icdName,departmentId:departmentId,description:description,phone:phone,pType:pType},
        success: function (data) {

        	messagePrompt(3);
        	
        }
	});
	
}

function messagePrompt(x){
	$(".message").show();
	　if ( x >0 )
	　　　{　x = x - 1
	　　　　 $(".message").text("修改成功，"+x+"秒后跳转");
	　　　　 setTimeout("messagePrompt("+x+")", 1000)
	　　}else{
		location.href = "/patient/list";
	　　}
}

function buildLanguage(language){
	 for (var item of language) {
     	
         var $template = $($('#rowTemplate').html()).clone();
         	$template.text(item.name);
         	$template.val(item.languageId);
          $('select[name="languageId"]').append($template);
        
     };
	
}
</script>
</body>
</html>