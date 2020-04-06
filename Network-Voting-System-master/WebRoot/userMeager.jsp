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
<meta charset="utf-8">
<title>My JSP 'userMeager.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.js"></script>
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

<style type="text/css">
body {
	background: #f1f1f1;
}

.cc {
	background: url("images/home-hero.jpg") 0px -100px no-repeat;
	height: 700px;
}

#dl {
	width: 300px;
}

#hh {
	width: 600px;
	height: 500px;
	/*  background:red; */
	position: absolute;
	left: 600px;
}

#fm {
	font-size: 14px;
	color: #337ab7;
	position: absolute;
	left: 200px;
	top: 200px;
}
</style>

<script type="text/javascript">
			function login() {
			var name = $("#name").val();
			var pwd = $("#pwd").val();
			var certCode = $("#certCode").val();
			if (name.length == 0) {
				alert("用户名不能为空");
				return;
			}
			if (pwd.length == 0) {
				alert("密码不能为空");
				return;
			}
			$.ajax({
				url : "<%=basePath%>user/login",
				type : "post",
				// data表示发送的数据
				data : JSON.stringify({
					name : name,
					pwd : pwd,
					certCode : certCode
				}),
				// 定义发送请求的数据格式为JSON字符串
				contentType : "application/json;charset=UTF-8",
				//定义回调响应的数据格式为JSON字符串,该属性可以省略
				dataType : "json",
				//成功响应的结果
				success : function(data) {
					console.info(data);
					if (data.success) {
						window.location.href = "<%=basePath%>";
					} else {
						alert(data.msg);

					}
				}
			});
		}
		;
		function changeimg() {
			var myimg = document.getElementById("code");
			now = new Date();
			myimg.src = "<%=path %>/makeCertPic.jsp?code=" + now.getTime();
		}
</script>


</head>

<body>
	<div class="con">
		<div class="panel panel-primary cc">
			<div class="panel-heading">
				<h3 class="panel-title"
					style="font-size: 20px;margin: 0px auto;width: 200px;">投票系统</h3>
			</div>
			<div class="panel-body" id="hh">
				<form method="post" class="form-horizontal" id="fm">
					<div class="form-group" style="width: 300px;">
						<input type="text" class="form-control" id="name"
							placeholder="请输入账户名" name="name">
					</div>
					<div class="form-group" style="width: 300px;">
						<input type="password" class="form-control" id="pwd"
							placeholder="请输入密码" name="pwd">
					</div>
					<div class="form-group" style="width: 300px;">
						<input type="text" class="form-control" id="certCode"
							placeholder="请输入验证码" name="certCode">
					</div>
					<div class="form-group" style="width: 300px;">
							<a href="javascript:changeimg()" style="margin-top:10px"><img id="code" src="<%=path %>/makeCertPic.jsp"> </a>
							<a href="#" style="float:right;margin-top:6px">忘记密码</a>
					</div>
					<div class="form-group" style="width: 300px;">
						<button type="button" class="btn btn-danger" id="dl"
							onClick="login()">登录</button>
					</div>
					<div class="form-group" style="width: 300px;">
						<button type="button" class="btn btn-primary" id="dl"
							onClick="login()">注测</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
