<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
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

<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="jquery.js"></script>

<style type="text/css">
*{
   padding: 0;
   margin: 0;
}
body{
    background: #F1F1F1;
}
.w{
width: 1210px;
margin-left: auto;
margin-right: auto;
margin-top: 60px;
}
.dhw{
       width: 220px;
         
}
.dh{
     width: 200px;
     height: 200px;
     position: absolute;
     top:100px;
     left:80px;    
}
.bq{
     width: 100%;
     height: 40px;
     background: #5bc0de;
     border-radius:2px;
     font-size: 16px;
     color:#fff;
     text-align: center;    
     line-height: 40px;
     outline: 0;
}
.bq:HOVER{
   cursor: pointer;
}
.bqq:HOVER{
   cursor: pointer;
}
.bqq{
     width: 100%;
     height: 40px;
     border-radius:2px;
     color:#fff;
     text-align: center; 
     background:#d9534f;
     border-radius:2px; 
     line-height: 40px;   
     outline: 0;
}
.zs{
      width: 1000px;
      top:80px;
      left:290px;
      position:absolute;
      float:left;
      
}
.header{
     width: 1130px;
     height: 70px;
     position: absolute;
     top:10px;
     left:80px;
}
.header h1{
  width: 220px;
  height: 60px;
  line-height: 60px;
  margin-left:600px;
  font-size: 30px;
  color: #337ab7;
}

</style>

<script type="text/javascript">
$(document).ready(function(){

$(".bq").click(function(){

  var i=$(this).parent().val();
  
  if(i==1)
  {
    $("#show").attr("src","meager/pro");
  }else if(i==2)
  {
    $("#show").attr("src","meager/type");
  }else if(i==3)
  {
    $("#show").attr("src","meager/adv");
  }else if(i==4)
  {
    $("#show").attr("src","meager/userOk");
  }else if(i==5)
  {
    $("#show").attr("src","meager/userApply");
  }
  
 
   $(".bqq").addClass("bq");
   $(".bqq").removeClass("bqq");
  $(this).removeClass(); 
  $(this).addClass("bqq");
  
  
 // 
  

});

});


</script>

</head>

<body>
<div class="w">
<div class="header">
  <h1>投票后台管理</h1>
  </div>
    <div class="dhw">
    <div class="dh">
	 <ul class="nav nav-pills nav-stacked">
	  <li value="1"><div class="bq" >投 票 管 理</div></li>
	  <li value="2"><div class="bq" >主 题 管 理</div></li>
	  <li value="3"><div class="bq" >广 告 管 理</div></li>
	  <li value="4"><div class="bq" >管 理 用 户</div></li>
	  <li value="5"><div class="bq" >申 请 发 布</div></li>
	</ul>
    </div>
    <div class="zs">
     <iframe width="100%" height="1080px;" frameborder="0" id="show" name="show" src="meager/pro"  align="left" ></iframe>
    </div>
    </div>
    
 </div>

</body>
</html>
