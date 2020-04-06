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
    
    <title>My JSP 'picture.jsp' starting page</title>
    
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
    </style>

  </head>
  
  
  
  <body>
     <div class="panel panel-primary" style="margin-top: 20px;background: #f1f1f1;">
    <div class="panel-heading">
        <h3 class="panel-title" >浏览图片</h3>
    </div>
    <div class="panel-body">
    <div>
    <a href="meager/pro?page=${page}" style="outline-style: none;font-size: 15px;color: blue;">返回</a>
    </div>
      <div>
         <p style="font-size: 15px;color: red;font-weight: bold;">展示图片</p>
         <img alt="" src="images/dress/${piture}">
      </div>
      <div>
        <p style="font-size: 15px;color: red;font-weight: bold; margin-top: 20px;">详细图片</p>
        <c:forEach var="pic" items="${megs}">
         <img alt="" src="images/dress/${pic}" style="margin-top: 5px;">
        </c:forEach>
        </div>
        <div>
        <p style="font-size: 15px;color: red;font-weight: bold; margin-top: 20px;">说明图片</p>
         <c:forEach var="bpic" items="${bmegs}">
         <img alt="" src="images/dress/${bpic}">
        </c:forEach>
        </div>
    </div>
    <div>
    <a href="meager/pro?page=${page}" style="outline-style: none;font-size: 15px;color: blue;margin-left: 20px;">返回</a>
    </div>
</div>

  </body>
</html>
