<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp" %>
<html>
<head>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(/images/left.gif);
}
-->
</style>
<link href="/css/css.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.min.js"></script>
</head>
<SCRIPT language=JavaScript>
function tupian(idt){
    var nametu="xiaotu"+idt;
    var tp = document.getElementById(nametu);
    tp.src="/images/ico05.gif";//图片ico04为白色的正方形
	
	for(var i=1;i<30;i++)
	{
	  
	  var nametu2="xiaotu"+i;
	  if(i!=idt*1)
	  {
	    var tp2=document.getElementById('xiaotu'+i);
		if(tp2!=undefined)
	    {tp2.src="/images/ico06.gif";}//图片ico06为蓝色的正方形
	  }
	}
}

function list(idstr){
	var name1="subtree"+idstr;
	var name2="img"+idstr;
	var objectobj=document.all(name1);
	var imgobj=document.all(name2);
	
	
	//alert(imgobj);
	
	if(objectobj.style.display=="none"){
		for(i=1;i<10;i++){
			var name3="img"+i;
			var name="subtree"+i;
			var o=document.all(name);
			if(o!=undefined){
				o.style.display="none";
				var image=document.all(name3);
				//alert(image);
				image.src="/images/ico04.gif";
			}
		}
		objectobj.style.display="";
		imgobj.src="/images/ico03.gif";
	}
	else{
		objectobj.style.display="none";
		imgobj.src="/images/ico04.gif";
	}

}

</SCRIPT>

<body>
<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01" style="margin-left:15px;>

		<table width= "100%"  border="0" cellpadding="0" cellspacing="0" >
		  <tr>
			<td width="207" height="55" background="/images/nav01.gif">
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
					<td width="25%" rowspan="2"><img src="/images/ico02.gif" width="35" height="35" /></td>
					<td width="75%" height="22" class="left-font01">您好，<span class="left-font02">${user.name }</span></td>
				  </tr>
				  <tr>
					<td height="22" class="left-font01">
						[&nbsp;<a href="/" target="_top" class="left-font01">退出</a>&nbsp;]</td>
				  </tr>
				</table>
			</td>
		  </tr>
		</table>
		

<c:if test="${role=='doctor'}">
		<!--  开始    -->
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img8" id="img8" src="/images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">
								<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('8');" >患者管理</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </TABLE>
		<table id="subtree8" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu20" src="/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="/patient/list?pType=1" target="mainFrame" class="left-font03" onClick="tupian('20');">门诊</a></td>
				</tr>
			<tr>
				<td width="9%" height="20" ><img id="xiaotu21" src="/images/ico06.gif" width="8" height="12" /></td>
				<td width="91%"><a href="/patient/list?pType=2" target="mainFrame" class="left-font03" onClick="tupian('20');">住院</a></td>
			</tr>


		</table>




		<!--  结束    -->
<%--</c:if>--%>
<%--<c:if test="${user.power==3 }">--%>
		<!--  开始    -->
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img7" id="img7" src="/images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">
								<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('7');" >患者随访</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </TABLE>
		<table id="subtree7" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu18" src="/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%">
					<a href="/randominterview/uninter" target="mainFrame" class="left-font03" onClick="tupian('18');">随访记录</a></td>
				</tr>
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu19" src="/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%">
						<a href="/randominterview/statistic" target="mainFrame" class="left-font03" onClick="tupian('19');">随访统计
							</a></td>
				</tr>

				
      </table>
		<!--  结束    -->
</c:if>
<c:if test="${role!='admin'}">
        <TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img1" id="img1" src="/images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">

								<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('1');" >评价留言</a></td>

					</tr>
				</table>
			</td>
          </tr>		  
        </TABLE>
		<table id="subtree1" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu1" src="/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%">
					  <c:if test="${role=='doctor'}">
					  <a href="/doctor/comment" target="mainFrame" class="left-font03" onClick="tupian('1');">查看我的评价</a>
					  </c:if>
					  <c:if test="${role=='patient'}">
						  <a href="/patient/tocomment" target="mainFrame" class="left-font03" onClick="tupian('1');">对我的医生进行评价</a>
					  </c:if>
				  </td>
				</tr>
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu4" src="/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%">
					  <c:if test="${role=='doctor'}">
					  <a href="/doctor/livemessage" target="mainFrame" class="left-font03" onClick="tupian('4');">查看我的留言</a>
					  </c:if>

					  <c:if test="${role=='patient'}">
						  <a href="/patient/toleavemessage" target="mainFrame" class="left-font03" onClick="tupian('4');">对我的医生留言</a>
					  </c:if>

				  </td>
				</tr>
			<tr>
					<c:if test="${role=='patient'}">
						<td width="9%" height="20" ><img id="xiaotu4" src="/images/ico06.gif" width="8" height="12" /></td>
						<td>
						<a href="/patient/checkleavemessage" target="mainFrame" class="left-font03" onClick="tupian('4');">查看留言回复</a>
						</td>
					</c:if>
			</tr>
			
				<%--<tr>
				  <td width="9%" height="20" ><img id="xiaotu5" src="/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="roomAndBed.jsp" target="mainFrame" class="left-font03" onClick="tupian('5');">床位情况</a></td>
				</tr>
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu19" src="/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%">
						<a href="buildMange.jsp" target="mainFrame" class="left-font03" onClick="tupian('19');">床位设置
					</a></td>
				</tr>--%>
				
      </table>
		<!--  结束    -->
</c:if>
<c:if test="${role=='doctor' }">
	  <!--  开始    -->
	  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="8%" height="12"><img name="img2" id="img2" src="/images/ico04.gif" width="8" height="11" /></td>
                  <td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('2');" >科室延伸</a></td>
                </tr>
            </table></td>
          </tr>
      </table>
	  
	  <table id="subtree2" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
        
		<tr>
          <td width="9%" height="20" ><img id="xiaotu7" src="/images/ico06.gif" width="8" height="12" /></td>
          <td width="91%"><a href="/doctor/diseasetracklist" target="mainFrame" class="left-font03" onClick="tupian('7');">病情跟踪</a></td>
        </tr>

		  <tr>
			  <td width="9%" height="20" ><img id="xiaotu8" src="/images/ico06.gif" width="8" height="12" /></td>
			  <td width="91%"><a href="/doctor/mediceinstructlist" target="mainFrame" class="left-font03" onClick="tupian('8');">指导用药</a></td>
		  </tr>
      </table>


	  <!--  结束    -->
</c:if>
<c:if test="${role=='admin' }">
	  <!--  开始    -->
	  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="8%" height="12"><img name="img3" id="img3" src="/images/ico04.gif" width="8" height="11" /></td>
                  <td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('3');" >医院设置</a></td>
                </tr>
            </table></td>
          </tr>
      </table>
	  
	  <table id="subtree3" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
        <tr>
          <td width="9%" height="20" ><img id="xiaotu8" src="/images/ico06.gif" width="8" height="12" /></td>
          <td width="91%"><a href="/admin/todepartmentmana" target="mainFrame" class="left-font03" onClick="tupian('8');">科室管理</a></td>
        </tr>

		  <tr>
			  <td width="9%" height="20" ><img id="xiaotu8" src="/images/ico06.gif" width="8" height="12" /></td>
			  <td width="91%"><a href="/admin/tomedicinemana" target="mainFrame" class="left-font03" onClick="tupian('8');">药品管理</a></td>
		  </tr>

		  <tr>
			  <td width="9%" height="20" ><img id="xiaotu8" src="/images/ico06.gif" width="8" height="12" /></td>
			  <td width="91%"><a href="/admin/todiseasemana" target="mainFrame" class="left-font03" onClick="tupian('8');">病种管理</a></td>
		  </tr>
      </table>
	
	  <!--  结束    -->

	  <!-- 管理系统开始 -->
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	<tr>
		<td height="29"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="8%"><img name="img5" id="img5" src="/images/ico04.gif" width="8" height="11" /></td>
				<td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('5');">人员管理</a></td>
			</tr>
		</table></td>
	</tr>
</table>

	<table id="subtree5" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
		<tr>
			<td width="9%" height="20"><img id="xiaotu13" src="/images/ico06.gif" width="8" height="12" /></td>
			<td width="91%"><a href="/admin/todoctormana" target="mainFrame" class="left-font03" onClick="tupian('13');">医生管理</a></td>
		</tr>
		<tr>
			<td height="20"><img id="xiaotu14" src="/images/ico06.gif" width="8" height="12" /></td>
			<td><a href="/admin/topatientmana" target="mainFrame" class="left-font03" onClick="tupian('14');">患者管理</a></td>
		</tr>
	</table>
	  <!-- 管理系统结束-->
</c:if>
	   <!--  个人信息开始    -->
	   <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="8%" height="12"><img name="img4" id="img4" src="/images/ico04.gif" width="8" height="11" /></td>
                  <td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('4');" >个人信息</a></td>
                </tr>
            </table></td>
          </tr>
      </table>
	  
	  <table id="subtree4" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
		  <c:if test="${role!='patient'&&role!='admin'}">
		  <tr>
          <td width="9%" height="20" ><img id="xiaotu11" src="/images/ico06.gif" width="8" height="12" /></td>
          <td width="91%"><a href="/doctor/toupdate" target="mainFrame" class="left-font03" onClick="tupian('11');">修改我的信息</a></td>
        </tr>
		  </c:if>
	  	<tr>
          <td width="9%" height="20" ><img id="xiaotu12" src="/images/ico06.gif" width="8" height="12" /></td>

			<td width="91%"><a href="/${role}/toupdatepassword" target="mainFrame" class="left-font03" onClick="tupian('12');">修改<c:if test="${role=='doctor'||role=='patient'}">密码</c:if><c:if test="${role=='admin'}">管理员信息</c:if></a></td>
        </tr>
      </table>

      <!--  个人信息结束    -->

	  </TD>
  </tr>
  
</table>
</body>
</html>
