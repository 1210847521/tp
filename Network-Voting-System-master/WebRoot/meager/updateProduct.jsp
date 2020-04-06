<%@page import="com.ck.po.Post"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'updateProduct.jsp' starting page</title>

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

.con {
	margin-top: 20px;
}
/* .jb{
	    height: 150px;
	} */
.ti {
	width: 200px;
	margin-left: 10px;
	margin-top: 20px;
}

.te {
	float: left;
	margin-left: 10px;
}

.la {
	margin-top: 30px;
	color: #555;
	padding: 6px 12px;
	font-size: 14px;
	font-weight: 400;
	background-color: #eee;
	border: 1px solid #ccc;
	border-radius: 4px;
	text-align: center;
}

.sc {
	margin-top: 20px;
	width: 200px;
}

.se {
	margin-top: 30px;
	width: 200px;
	height: 34px;
	color: #333;
	margin-left: -6px;
	border: 1px solid #ccc;
}

.ms {
	height: 220px;
	clear: both;
}

.btt {
	margin: 20px auto;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
 <%Post p = (Post) request.getAttribute("p");
			/* Ltype lp = (Ltype) request.getAttribute("lp");
			Stype sp = (Stype) request.getAttribute("sp"); */
%>
        $("#ltype").change(function(){

	 			 var id=$(this).val();
			 $.ajax({
				 type:"post",
				 url:"ftype",
				 data:{
				       id:id,
				 },
				 dataType:"json",
				 success : function(result) {
				 $("#stype").empty();
						$.each(result, function(index, e) {
							$('#stype').append(
									"<option value="+e.id+">"
								+ e.name + "</option>");
									});
				 }
			 }); 
		});
		$("#exit").click(function(){
		  window.location.href = "meager/pro?page="+${page};
		});
});





</script>

</head>

<body>
	<div class="con">
		<div class="panel panel-primary" style=" background: #f1f1f1;">
			<div class="panel-heading">
				<h3 class="panel-title">投票详情</h3>
			</div>
			<div class="panel-body">
				<form action="updateProductM" method="post" id="fm"
					enctype="multipart/form-data">
					<input type="hidden" name="id" value="${p.id}">
					<%--  <input type="hidden" name="pid" value="${p.pic.id}"> --%>
					<input type="hidden" name="page" value="${page}">
					<div class="jb">
						<div>
							<div class="input-group ti">
								<span class="input-group-addon">主题</span> <input type="text"
									class="form-control" placeholder="Twitterhandle" name="ztname"
									value="${p.ztname}" id="title">
							</div>
							<div class="input-group ti">
								<span class="input-group-addon">标题</span> <input type="text"
									class="form-control" placeholder="Twitterhandle" name="title"
									value="${p.title}" id="title">
							</div>
							<div class="input-group ti">
								<span class="input-group-addon">介绍</span> <input type="text"
									class="form-control" placeholder="Twitterhandle"
									name="introduce" value="${p.introduce}" id="introduce">
							</div>

							<div class="input-group ti">
								<span class="input-group-addon">数量</span> <input type="text"
									class="form-control" placeholder="Twitterhandle" name="maxPoll"
									id="maxPoll" value="${p.maxPoll}">
							</div>
						</div>
					</div>
					<div class="te">
						<label class="la">类型</label> <select class="se" name="pollType"
							id="pollType">
							<option value="0">单选</option>
							<option value="1">多选</option>
						</select>
					</div>
					<div class="te">
						<label class="la">状态</label> <select class="se" name="postState"
							id="postState">
							<option value="0">待审核</option>
							<option value="1">审核通过</option>
							<option value="2">驳回</option>
							<option value="3">删除</option>
						</select>
					</div>
					<%--   <div style="clear: both;">
             <div class="te">
             <label class="la">尺码</label> 
             <select class="se" name="size" id="size">
					<option value="S">S</option>
					<option value="M">M</option>
					<option value="L">L</option>
					<option value="XL">XL</option>
					<option value="XXL">XXL</option>
			</select>
            
             <div class="te">
             <label class="la">子类</label> 
             <select class="se" name="stype" id="stype">
					<c:set var="li" value="${ltype}"></c:set>
									<c:forEach var="sp" items="${li.list}">
										<option value="${sp.id}">${sp.name}</option>
									</c:forEach>
			</select>
             </div>
            </div>
            </div>
            <div class="ms">
            <h1 style="font-size: 20px;color: blue;margin-left:10px; ">详细描述</h1>
            <textarea  rows="8" cols="120"  name="sketch" id="sketch" style="margin-left: 10px;font-size: 15px;">${p.sketch}
            </textarea>
            </div>
            <div class="tp">
            <div class="sc">
				<label for="inputfile">修改主图片</label> <input type="file"
					id="inputfile" name="myfiles">
			</div>
             <div class="sc">
				<label for="inputfile">修改详情图片</label> <input type="file"
					id="inputfile" name="pics" multiple>
			</div>
            <div class="sc">
				<label for="inputfile">修改说明图片</label> <input type="file"
					id="inputfile" name="msg">
			</div>
            </div> --%>
					<div class="btt">
						<button type="button" class="btn btn-primary" id="ok">确定</button>
						<button type="button" class="btn btn-primary" id="exit">退出</button>
					</div>
				</form>
			</div>

		</div>

	</div>
</body>
</html>
