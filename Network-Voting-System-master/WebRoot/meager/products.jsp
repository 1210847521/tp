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
    
    <title>My JSP 'products.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
     
     <style type="text/css">
     body{
     background: #f1f1f1;
     
     }
     .bg{
         width:950px;
          margin-top:20px;
          background: #f1f1f1;
     }
     .add{
           float: left;
           margin-top: 8px;
     
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
.xti{
      width:80px;
      font-size: 14px;
}
.xtii{
      width:40px;
      font-size: 14px;

}
.dti{
     width:160px;
 
     font-size: 14px;

}
 </style>
 <script type="text/javascript">
 $(document).ready(function(){
 
 $("#addP").click(function(){
 
 window.location.href = "add?page="+${page.page};
 
 });
 $(".pic").click(function(){
    var id=$(this).val();
   /*  window.location.href = "findOptionById?id="+id; */
 
 });
 $(".up").click(function(){
    var id=$(this).val();
    window.location.href = "updateProduct?id="+id+"&page="+${page.page};
 
 });
 
 $(".remove").click(function(){
    var id= $(this).val();
    $.ajax({
    type:"post",
    url:"delPost",
    data:{
     id:id,
    },
    dataType:"text",
    success:function(text){
     if(text==1)
     {
       alert("删除成功");
     }else{
       alert("删除失败");
     }
     
    }
    
    });
 });
 
 $("#q").click(function(){
  if(${page.page>1}){
   window.location.href = "meager/pro?page="+${page.page-1};
   }
 });
 
 $("#d").click(function(){
  if(${page.page<page.end}){
   window.location.href = "meager/pro?page="+${page.page+1};
   }
 });
 $("#sel").change(function(){
  window.location.href = "meager/pro?page="+$(this).val();
 
 });
 });
 
 </script>
   
  </head>
  
  <body>
    <div class="panel panel-primary bg">
    <div class="panel-heading">
        <h3 class="panel-title">投票管理</h3>
    </div>
    <div class="panel-body ">
        <table class="table table-bordered">
	<thead>
		<tr>
			<th>主题</th>
			<th>标题</th>
			<th>介绍</th>
			<th>类型</th>
			<th>数量</th>
			<th>状态</th>
			<th>时间</th>
			<th>选项</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="p" items="${posts}">
		<tr>
			<td class="xtii">${p.ztname}</td>
			<td class="xti">${p.title}</td>
			<td class="xtii">${p.introduce}</td>
			<td class="xtii">
				<c:if test="${p.pollType==0}">单选</c:if>
				<c:if test="${p.pollType==1}">多选</c:if>
			</td>
			<td class="xtii">${p.maxPoll}</td>
			<td class="xtii">
				<c:if test="${p.postState==0}">待审核</c:if>
				<c:if test="${p.postState==1}">审核通过</c:if>
				<c:if test="${p.postState==2}">审核不通过</c:if>
				<c:if test="${p.postState==3}">删除</c:if> 
			</td>
			<td class="xtii">${p.postDate}</td>
			<td>
			<button type="button" class="btn btn-primary pic" value="${p.id}">查 看</button>
			</td>
			<td>
			<button type="button" class="btn btn-primary up" value="${p.id}">详 情</button>
				<c:if test="${p.postState!=3}">
				<button type="button" class="btn btn-danger remove" value="${p.id}">删 除</button>
				</c:if> 
			
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
    <div class=" add">
    <button type="button" class="btn btn-primary" id="addP">新 增</button>   
    </div>
    </div>
   
</div>
  </body>
</html>
