<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'add.jsp' starting page</title>

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
.con {
	width: 850px;
	height: 700px;
	margin-top: 20px;
}

.te {
	height: 20px;
	float: left;
	margin-top: 30px;
	margin-left: 35px;
}
#ms{
     width:740px;
     height: 225px;
     margin-left:35px;
     margin-top:30px;
    clear: both;

}
.la {
	color: #555;
	padding: 6px 12px;
	font-size: 14px;
	font-weight: 400;
	background-color: #eee;
	border: 1px solid #ccc;
	border-radius: 4px;
	text-align: center;
}

.se {
	width: 299px;
	height: 34px;
	color: #333;
	margin-left: -6px;
	border: 1px solid #ccc;
}

.sc {
	margin-top: 20px;
	width: 200px;
	float: left;
}

.center {
	width: 800px;
	height: 550px;
	margin: 0px auto;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
$("#fls").change(function(){
 var id=$(this).val();
 $.ajax({
 type:"post",
 url:"ftype",
 data:{
       id:id,
 },
 dataType:"json",
 success : function(result) {
 $("#zl").empty();
		$.each(result, function(index, e) {
			$('#zl').append(
					"<option value="+e.id+">"
				+ e.name + "</option>");
					});

 }
 });

});

$("#sure").click(function(){
  
  var name=$("#name").val();
  var price=$("#price").val();
  var size=$("#size").val();
  var colour=$("#colour").val();
  var sid=$("#zl").val();
  var sketch=$("#ms").val();
  var count=$("#count").val();
  var p={
     name:name,
     price:price,
     size:size,
     colour:colour,
     sid:sid,
     sketch:sketch,
     count:count,
  };
   var json=JSON.stringify(p); 
  
  $.ajax({
    type:"post",
    url:"mesg",
    data:{
      json:json,
    },
    dataType:"json",
    success:function(json){
    if(json.flag==0)
    {
       alert("上传失败");
    }else{
          var id=json.id;
          $("#tid").val(id);
          alert($("#tid").val());
    }
   
    }
  
  });

});
$("#pic").click(function(){
var id=$("#tid").val();
if(id!="")
{
	 $("#form").submit();
}else{
  alert("请按确定键上传文本信息");
}
 

});

$("#exit").click(function(){
window.location.href = "meager/pro?page="+${page};
});
});

</script>



</head>

<body>
	<div class="con" >
		<div class="panel panel-primary con" style="background: #f1f1f1f1">
			<div class="panel-heading">
				<h3 class="panel-title">添加商品</h3>
			</div>
			<div class="panel-body">
				<div class="form-group ">
					<div class="center">
						<div>
							<div class="te">
								<div class="input-group" style="width: 350px;">
									<span class="input-group-addon">简介</span> <input type="text"
										class="form-control" placeholder="20字以内" name="name" id="name">
								</div>
							</div>

							<div class="te">
								<div class="input-group" style="width: 350px;">
									<span class="input-group-addon" >价格</span> <input type="text"
										class="form-control" placeholder="请输入商品价格" name="price" id="price">
								</div>
							</div>
							
							<div class="te">
								<label class="la">尺码</label> <select class="se" name="size" id="size">
									<option value="S">S</option>
									<option value="M">M</option>
									<option value="L">L</option>
									<option value="XL">XL</option>
									<option value="XXL">XXL</option>
								</select>
							</div>
						</div>
						<div>
							<div class="te">
								<div class="input-group" style="width:350px;">
									<span class="input-group-addon">颜色</span> <input type="text"
										class="form-control" placeholder="请输入颜色" name="colour" id="colour">
								</div>
							</div>
							<div class="te">
								<label class="la">父类</label> <select id="fls" name="ltypeid"
									class="se">
									<s:forEach var="lp" items="${list}">
										<option value="${lp.id}">${lp.name}</option>
									</s:forEach>
								</select>
							</div>
							<div class="te">
								<label class="la">子类</label> <select class="se" id="zl"
									name="sid" >
									<s:set var="li" value="${type}"></s:set>
									<s:forEach var="sp" items="${li.list}">
										<option value="${sp.id}">${sp.name}</option>
									</s:forEach>
								</select>
							</div>
							<div class="te">
								<div class="input-group" style="width: 350px;">
									<span class="input-group-addon" >数量</span> <input type="text"
										class="form-control" placeholder="请输入商品的数量" name="count" id="count">
								</div>
							</div>
						</div>
						<div >
							<textarea  placeholder="详细描述" id="ms"
								name="sketch"></textarea>
						</div>
						<div style="margin-top: 20px;margin-left: 35px;">
							<button type="button" class="btn btn-primary" id="sure">确定</button>
						</div>
						</div>
					
						<div class="form-group">
							<div class="form-group" style="margin-left:80px;margin-top: -50px;">
								<form action="pic" method="post" id="form"
									enctype="multipart/form-data">
									<input type="hidden" name="id" id="tid">
									<div class="form-group">
										<div class="sc">
											<label for="inputfile">上传主图片</label> <input type="file"
												id="inputfile" name="myfiles">
										</div>
										<div class="sc">
											<label for="inputfile">上传详情图片</label> <input type="file"
												id="pictures" name="pictures" multiple>
										</div>
										<div class="sc">
											<label for="inputfile">上传说明图片</label> <input type="file"
												id="msg" name="msg" >
										</div>
									</div>
								</form>
							</div>
						</div>
						<div style="margin-top:50px;">
							<button type="button" class="btn btn-primary" id="pic">上传图片</button>
						</div>
						<button type="button" class="btn btn-primary" id="exit" 
							style="margin-top: 20px;width: 80px;">退出</button>	
           </div>
				
				</div>
			</div>
		</div>
</body>
</html>
