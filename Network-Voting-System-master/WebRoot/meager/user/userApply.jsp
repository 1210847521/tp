<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userOk.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="jquery.js"></script>
    
    <style type="text/css">
    body {
	background: #f1f1f1;
	
}
  .con{
       margin-top: 20px;
  }
    .fy {
	width: 300px;
	height: 60px;
	float: left;
	margin-top: 10px;
}
.s {
	display: inline-block;
	text-align: center;
	width: 60px;
	height: 30px;
	line-height: 30px;
	background: #337ab7;
	border: solid #2e6da4 1px;
	color: #ffffff;
	border-radius: 2px;
	text-decoration: none;
}

#s:HOVER {
	background: #2e6da4;
}
#sel {
	width: 80px;
	height: 32px;
	border-style: ridge;
	border-width: 1px;
	line-height: 32px;
	border-radius: 2px;
}
    </style>

<script type="text/javascript">
$(document).ready(function(){
$("#q").click(function(){
  if(${page.page>1}){
   window.location.href = "meager/userOk?page="+${page.page-1};
   }
 });
 
 $("#d").click(function(){
  if(${page.page<page.end}){
   window.location.href = "meager/userOk?page="+${page.page+1};
   }
 });
 $("#sel").change(function(){
  window.location.href = "meager/userOk?page="+$(this).val();
 
 });

$(".edit").click(function(){
 var id=$(this).val();
 $.ajax({
 type:"post",
 url:"editFabu",
 data:{
   id:id,
   isfabu:1
 },
 dataType:"text",
 success:function(text){
 if(text==1)
 {
 	 window.location.href = "meager/userApply?page="+${page.page};
 }else{
     alert("操作失败");
 }
 
 }
 
 });
});

$(".pass").click(function(){
 var id=$(this).val();
 $.ajax({
 type:"post",
 url:"editFabu",
 data:{
   id:id,
   isfabu:0
 },
 dataType:"text",
 success:function(text){
 if(text==1)
 {
 	 window.location.href = "meager/userApply?page="+${page.page};
 }else{
     alert("操作失败");
 }
 
 }
 
 });
});

});

</script>
  </head>
  
  <body>
    <div class="con">
    <div class="panel panel-primary"style="background: #f1f1f1;">
    <div class="panel-heading">
        <h3 class="panel-title">用户管理</h3>
    </div>
    <div class="panel-body">
     <table class="table table-bordered">
	<thead>
		<tr>
			<th>名称</th>
			<th>性别</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="u" items="${users}">
		<tr>
			<td>${u.name}</td>
			<td>
			<c:if test="${u.gender==0}">女</c:if>
			<c:if test="${u.gender==1}">男</c:if>
			</td>
			<td>
			<button type="button" class="btn btn-primary edit" value="${u.id}">通过</button>
			<button type="button" class="btn btn-danger pass" value="${u.id}">拒绝</button>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div class="fy">
				<button class="s" id="q">上一页</button> <select id="sel">
				  <c:set var="page" value="${page}"></c:set>
				   <c:forEach var="i" begin="${page.page}" end="${page.end}">
					<option value="${i}">第${i}页
					</option>
					 </c:forEach>
				</select> <button  class="s" id="d">下一页</button>
			</div>
    </div>
</div>
    
    </div>
  </body>
</html>
