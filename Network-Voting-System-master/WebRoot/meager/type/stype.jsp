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
    
    <title>My JSP 'stype.jsp' starting page</title>
    
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
	body{
	   background: #f1f1f1;
	}
	.con{
	   margin-top: 20px;
	}
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
	
	$("#exit").click(function(){
	 window.location.href = "meager/type";
	
	});
	
	$(".up").click(function(){

	var id=$(this).val();
	var name=$(this).parent().parent().find("input").val();
	$.ajax({
	  type:"post",
	  url:"upstype",
	  data:{
	  id:id,
	  name:name,
	  },
	  dataType:"text",
	  success:function(text){
	    if(text==1)
	    {
	        window.location.href = "stype?id="+${lp.id};
	    }else{
	        alert("修改失败");
	    }
	    
	  
	  }
	});
	
	});
	
	$("#add").click(function(){
	var name=$(this).parent().parent().find("input").val();
	$.ajax({
	  type:"post",
	  url:"addstype",
	  data:{
	  pid:${lp.id},
	  name:name,
	  },
	  dataType:"text",
	  success:function(text){
	    if(text==1)
	    {
	        window.location.href = "stype?id="+${lp.id};
	    }else{
	        alert("添加失败");
	    }
	    
	  
	  }
	});
	
	});
	
	});
	
	</script>
  </head>
  
  <body>
    <div class="con">
    <div class="panel panel-primary" style="background: #f1f1f1;">
    <div class="panel-heading">
        <h3 class="panel-title">${lp.name}</h3>
    </div>
    <div class="panel-body" style="width: 600px;margin-left: auto;margin-right: auto;">
     <table class="table table-bordered">
	<thead>
		<tr>
			<th>子类</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="sp" items="${lp.list}">
		<tr>
			<td style="width: 100px;font-size: 16px;font-weight: 700;">${sp.name}</td>
			<td style="width: 300px;">
			<div class="col-lg-6" style="width: 300px;">
				<div class="input-group">
					<input type="text" class="form-control" >
					<span class="input-group-btn">
						<button class="btn btn-primary up" type="button" value="${sp.id}">
						修改	
						</button>
					</span>
				</div><!-- /input-group -->
			</div>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
    </div>
    <div class="col-lg-6" style="width: 300px;margin-left: 200px;margin-bottom: 20px;">
				<div class="input-group">
					<input type="text" class="form-control" >
					<span class="input-group-btn">
						<button class="btn btn-primary " type="button" id="add">
						增加
						</button>
						<button class="btn btn-primary" type="button" style="margin-left: 30px;" id="exit">退出</button>
					</span>
				</div><!-- /input-group -->
				
			</div>
			
</div>
    </div>
  </body>
</html>
