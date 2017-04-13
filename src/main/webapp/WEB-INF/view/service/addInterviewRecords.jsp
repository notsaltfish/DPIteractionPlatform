<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery.min.js"></script>
      <%--  <script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>--%>
    <script src="/js/bootstrap.min.js"></script>
	<%--<link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css" rel="stylesheet">
--%>    <script src="/js/bootstrap-paginator.min.js"></script>
    <script src="/js/datepicker/WdatePicker.js"></script>
    
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
<form class="form-horizontal" style="margin-left: 100px" action="/randominterview/add" method="post">
<input type="hidden" name="patientId" value="${o.patientId}"/>
<input type="hidden" name="doctorId" value="${o.doctorId}"/>
    <fieldset>
      <div id="legend" class="">
        <legend class="">添加随访记录</legend>
      </div>
        <div class="row">
        <div class="form-group col-sm-6">

            <!-- Text input-->
            <label class="control-label col-sm-4" >随访日期</label>
            <div class="col-sm-8">
                <input type="text" onclick="WdatePicker({el:this,isShowOthers:true,dateFmt:'yyyy-MM-dd'});" class="form-control" name="iDate" placeholder="日期">
            </div>
        </div>

        <script>
            $(function(){

            })



        </script>
        </div>
        <div class="row">
        <div class="form-group col-sm-6">

            <!-- Select Basic -->
            <label class="control-label col-sm-4">分数</label>
            <div class="col-sm-8">

                <select class="form-control" name="score">
                    <option value="1">1分</option>
                    <option value="2">2分</option>
                    <option value="3">3分</option>
                    <option value="4">4分</option>
                    <option value="5">5分</option>
                    <option value="6">6分</option>
                    <option value="7">7分</option>
                    <option value="8">8分</option>
                    <option value="9">9分</option>
                    <option value="10">10分</option>
                </select>
            </div>

        </div>
        </div>

        <div class="row">
        <div class="form-group col-sm-6">

            <!-- Select Basic -->
            <label class="control-label col-sm-4">评价</label>
           <div class="col-sm-8">
               <textarea cols="40"  rows="5" type="text"  placeholder="描述" name="comment" class="form-control"></textarea>
                <p class="help-block"></p>
            </div>


        </div>
        </div>
        <div class="row">
        <div class="form-group col-sm-6">

            <!-- Select Basic -->
            <label class="control-label col-sm-4">建议</label>
            <div class="col-sm-8">
                <textarea cols="40"  rows="5" type="text"  placeholder="建议" name="advice" class="form-control"></textarea>
                <p class="help-block"></p>
            </div>


        </div>
        </div>
        <div class="row">
    <div class="form-group col-sm-6">
          <label class="control-label col-sm-4">提交</label>

          <!-- Button -->
          <div class="col-sm-8">
            <button class="btn btn-success" type="submit">提交</button>
          </div>
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

/*	$("form").submit(function(){

		add();
		return false;
	});
	*/
})


 function add(){

	var score =  $("select[name='score']").val();
	var s = $("input[name='age']").val();
	var sex =  $("input[name='sex']").val()
	var  description  = $("textarea[name='description']").val();
     var icdCode = $('select[name="icdCode"]').val();
     var departmentId=$('select[name="departmentId"').val();
     var phone = $("input[name='phone']").val();
     var pType= $("select[name='pType']").val();

	$.ajax({
        url: "/randominterview/add",
        type: "POST",
        dataType: "json",
        data: {name:name,age:age,sex:sex,icdCode:icdCode,departmentId:departmentId,description:description,phone:phone,pType:pType},
        success: function (data) {
            alert(data);
        	messagePrompt(3);
        	
        }
	});
	
}

function messagePrompt(x){
	$(".message").show();
	　if ( x >0 )
	　　　{　x = x - 1
	　　　　 $(".message").text("添加成功，"+x+"秒后跳转");
	　　　　 setTimeout("messagePrompt("+x+")", 1000)
	　　}else{
		location.href = "/patient/list";
	　　}
}

</script>
</body>
</html>