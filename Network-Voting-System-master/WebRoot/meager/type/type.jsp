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
    
    <title>My JSP 'type.jsp' starting page</title>
    
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
    li{
       list-style: none;
       width: 80px;
       float: left;
       font-size: 14px;
       font-weight: 700;
    
    }
    </style>
    <script type="text/javascript">
    $(document).ready(function(){  
    $(".up").click(function(){   
    var id=$(this).val();
    var name=$(this).parent().parent().find("input").val();
    var name=$(this).parent().parent().find("input").val();
    $.ajax({
    type:"post",
    url:"uptype",
    data:{
       id:id,
       name:name,
    },
    dataType:"text",
    success:function(text){
    if(text==1)
    {
    	window.location.href = "meager/type";
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
    url:"addtype",
    data:{
       name:name,
    },
    dataType:"text",
    success:function(text){
    if(text==1)
    {
    	window.location.href = "meager/type";
    }else{
       alert("添加失败");
    }
    }
    
    }); 
    
    });
    $(".gl").click(function(){
      window.location.href = "stype?id="+$(this).val();
    });
    
     $(".del").click(function(){
      window.location.href = "delZT?id="+$(this).val();
    });
    
});
    
    </script>
	

  </head>
  
  <body>
  <div class="con">
    <div class="panel panel-primary" style="background: #f1f1f1">
    <div class="panel-heading">
        <h3 class="panel-title">商品分类信息</h3>
    </div>
    <div class="panel-body">
       <table class="table table-bordered ">
	<thead>
		<tr>
			<th>名称</th>
			<th>介绍</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="tp" items="${type}">
		<tr>
			<td style="width: 100px;color: #d9534f;font-size:16px;font-weight: bold;">${tp.name}</td>
			<td style="width: 500px;"> ${tp.note}</td>
			<td>
				<div class="col-lg-6" style="width: 200px;">
				<div class="input-group">
					<span class="input-group-btn">
						<button class="btn btn-primary up" type="button" value="${tp.id}">
						修改	
						</button>
						<button class="btn btn-danger del" type="button" value="${tp.id}">
						删除
						</button>
					</span>
				</div>
			</div>
			
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
 </div>
 <div class="col-lg-6" style="width:300px;margin-bottom: 20px;">
				<div class="input-group">
					<input type="text" class="form-control">
					<span class="input-group-btn">
						<button class="btn btn-primary" type="button" id="add">
						新增
						</button>
					</span>
				</div><!-- /input-group -->
			</div>
</div>
</div>
  </body>
</html>
