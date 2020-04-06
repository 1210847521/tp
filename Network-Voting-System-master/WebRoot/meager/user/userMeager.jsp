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
    
    <title>My JSP 'userMeager.jsp' starting page</title>
    
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
	.cc{
	     background: url("images/home-hero.jpg") 0px -100px  no-repeat;
	     height: 700px;
	
	}
	#dl{
	     width: 300px;
	    
	}
	#hh{
	      width: 600px;
	      height: 500px;
	     /*  background:red; */
	      position: absolute;
	      left:600px;
	      
	}
	#fm{
	     font-size: 14px;
	     color: #337ab7;
	     position: absolute;
	     left:200px;
	     top:200px;	
	}
	</style>
	
	<script type="text/javascript">
	$(document).ready(function(){
	
	$("#dl").click(function(){
	var flag=true;
	var name=$("#name").val();
	var password=$("#password").val();
	
	if(name==""){alert("请输入账号");flag=false;}
	if(password==""){alert("请输入密码");flag=false;}
	if(flag){
	$("#fm").submit();
	}
	});
	});	
	</script>
	
	
  </head>
  
  <body>
    <div class="con">
    <div class="panel panel-primary cc">
    <div class="panel-heading" >
        <h3 class="panel-title" style="font-size: 20px;margin: 0px auto;width: 200px;">后台管理系统</h3>
    </div>
    <div class="panel-body" id="hh">
      <form  action="userSign" method="post"  class="form-horizontal" role="form" id="fm" >
  <div class="form-group" style="width: 300px;">
      <input type="text" class="form-control" id="name" placeholder="请输入账户名" name="name">
  </div>
  <div class="form-group" style="width: 300px;">
   
      <input type="password" class="form-control" id="password" placeholder="请输入密码" name="password">
   
   </div>
  <div class="form-group" style="width: 300px;">
    <button type="button" class="btn btn-danger" id="dl">登录</button> 
  </div>
</form>    
 </div>
</div>   
    </div>
  </body>
</html>
