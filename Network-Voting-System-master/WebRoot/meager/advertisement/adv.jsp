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
    
    <title>My JSP 'adv.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
     <link rel="stylesheet" href="css/bootstrap.min.css" >
       <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="jquery.js"></script> 
    <style type="text/css">
     body {
	background: #f1f1f1;
}
    </style>

<script type="text/javascript">
$(document).ready(function(){
$(".up").click(function(){
var id=$(this).val();
var picture=$(this).data("pic");
$("#id").val(id);
$("#picture").val(picture);
});

$(".xg").click(function(){
  var id=$(this).val();
  var name=$(this).parent().parent().find("input").val();
  if(name!="")
  {
   $.ajax({
    type:"post",
    url:"upPlcSrc",
    data:{
    id:id,
    src:name,  
    },
    dataType:"text",
    success:function(text){
    
      if(text==1)
      {
         window.location.href = "meager/sdv";
      }else{
      
      alert("修改失败");
      }
    
    }
   
   });
  
  }else{
  
   alert("请输入修改的链接值");
  }

});
$("#exit").click(function(){
 window.location.href = "meager/adv";

});
});

</script>

  </head>
  
  <body>
    <div style="margin-top: 20px;width: 900px;">
    <div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">管理轮播</h3>
    </div>
    <div class="panel-body">
        <table class="table table-bordered">
	<thead>
		<tr>
			<th>图片</th>
			<th>图片链接</th>
			<th>更换图片</th>
			<th>修改链接</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="p" items="${pic}">
		<tr>
			<td style="width:300px;">
		     <div class="col-sm-6 col-md-3" style="width: 200px;">
            <a href="${p.src}" class="thumbnail">
            <img src="images/lp/${p.picture}"
                 alt="通用的占位符缩略图">
            </a>
           </div>
			</td>
			<td>${p.src}</td>
			<td>
			<button type="button" class="btn btn-primary up" data-toggle="modal" data-target="#myModal" value="${p.id}" data-pic="${p.picture}">更换图片</button>
			</td>
			<td style="200px;">
			  <div class="input-group">
                    <input type="text" class="form-control">
                    <span class="input-group-btn">
                        <button class="btn btn-primary xg" type="button" value="${p.id}">确定</button>
                    </span>
                </div><!-- /input-group -->
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
    </div>
     <button class="btn btn-primary " type="button" value="${p.id}" 
     style="margin-bottom: 20px;margin-left: 20px;" id="exit">退出</button>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
style="margin-top: 20px;"
>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					更换图片
				</h4>
			</div>
			<div class="modal-body">
		<form action="upPlc" method="post" role="form" enctype="multipart/form-data">
		<input type="hidden" name="id" id="id">
		<input type="hidden" name="picture" id="picture">
	   <div class="form-group">
		<label for="inputfile">请选择上传的图片</label>
		<input type="file" id="inputfile" name="myfiles">
	</div>
	<button type="submit" class="btn btn-primary">提交</button>
</form>
	
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
    </div>
  </body>
</html>
