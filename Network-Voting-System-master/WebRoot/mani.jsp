<%@page import="com.ck.po.User"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'women.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link type="text/css" rel="stylesheet" href="css/resest.css">

<style type="text/css">
.so {
	width: 1190px;
	height: 10px;
	margin-left: auto;
	margin-right: auto;
}

#log {
	position: absolute;
	top: 70px;
	display: block;
	overflow: hidden;
	left: 80px;
	width: 190px;
	height: 170px;
	border: dotted #999999 1px;
	background: white no-repeat;
}

#su {
	height: 140px;
	width: 194px;
}

.s {
	position: absolute;
	top: 85px;
	left: 390px;
	height: 142px;
	width: 900px;
}

#st {
	position: relative;
	left: 60px;
	top: 30px;
	width: 550px;
	height: 32px;
	border: solid #f10215 1px;
	outline: none;
}

#sb {
	position: relative;
	left: 55px;
	top: 31px;
	width: 50px;
	height: 32px;
	color: white;
	font-size: 15px;
	font-weight: 400;
	background-color: #f10215;
	border: solid #f10215 1px;
}

#gw {
	position: relative;
	left: 730px;
	width: 160px;
	top: -2px;
	height: 30px;
	border: ridge #999 1px;
	background-color: white;
}

#gwc {
	overflow: hidden;
	margin-left: 30px;
	margin-right: 5px;
	float: left;
	display: block;
	width: 32px;
	height: 32px;
	background-image: url("images/car1.png");
}

#gw a {
	text-align: center;
	color: #f10215;
	line-height: 30px;
}

#gws {
	overflow: hidden;
	float: none;
	border-radius: 50%;
	display: inline-block;
	width: 14px;
	height: 14px;
	background: red;
	text-align: center;
	color: white;
}

#xb {
	width: 550px;
	height: 20px;
	float: none;
	margin: 5px 80px;
}

#xb ul li {
	float: left;
	margin-right: 10px;
}

.xl {
	color: #999;
	text-align: center;
}

.xl:hover {
	color: brown;
}

#th {
	width: 100%;
	height: 50px;
	margin-left: 25px;
}

#th ul li {
	display: block;
	float: left;
	margin: 14px;
}

#th a {
	position: relative;
	top: -10px;
	display: inline-block;
}

.tbq {
	display: inline-block;
	font-size: 16px;
	text-align: center;
	color: #555;
	font-weight: 700;
}

.tbq:hover {
	font-weight: bold;
	color: red;
}

.spacer1 {
	float: left;
	overflow: hidden;
	margin-top: 10px;
	width: 2px;
	height: 10px;
	background-color: #ccc;
}
</style>

<style type="text/css">
.conClass {
	width: 1190px;
	height: 30px;
	margin-left: 80px;
}

.headBar {
	width: 100%;
	height: auto;
	background-color: #f1f1f1;
}

.gg {
	width: 1190px;
	height: 70px;
	background: url("images/meg.png") no-repeat;
	margin-left: 80px;
}

.hh {
	width: 100%;
	height: 70px;
	background-color: red;
}

.fl {
	width: 257px;
	height: 100%;
	float: left;
}

.fl li {
	margin-left: 200px;
	line-height: 30px;
}

.fl span {
	color: #999;
	font-size: 14px;
}

.fr {
	width: 415px;
	height: 100%;
	float: right;
	margin-right: 8px;
	z-index: 20;
	line-height: 30px;
}

.fr a {
	color: #999;
}

.fr span {
	color: #999;
}

.fr a:hover {
	color: red;
	font-weight: bold;
}

.fr li {
	float: left;
	margin-right: 10px;
}

.ndl {
	width: 145px;
	height: 30px;
}

.nd {
	display: inline-block;
	width: 65px;
}

.hf1 {
	width: 52px;
}

.hf1 a {
	display: inline-block;
	width: 50px;
	height: 30px;
}

.nz {
	width: 55px;
}

.spacer {
	overflow: hidden;
	margin: 11px 5px 0;
	width: 1px;
	height: 10px;
	background-color: #ccc;
}

.dzz {
	overflow: hidden;
	float: left;
	display: block;
	width: 14px;
	height: 16px;
	margin-top: 7px;
	margin-right: 5px;
	background-image: url("images/fil.png");
}

.ij {
	overflow: hidden;
	float: right;
	display: block;
	width: 14px;
	height: 16px;
	margin-left: 2px;
	margin-top: 7px;
	background-image: url("images/down.png");
}

.ewm {
	overflow: hidden;
	width: 58px;
	height: 58px;
	border: solid #999999 1px;
	text-align: center;
}

.ewm img {
	width: 48px;
	height: 48px;
	padding: 5px;
}
</style>
<style type="text/css">
#dh {
	width: 1190px;
	height: 460px;
	margin-left: 135px;
}

#wb {
	width: 100%;
	height: 115px;
	background-color: #dedede;
	margin: 46px 0px auto;
}

#dhd {
	float: left;
	width: 192px;
	height: 370px;
	margin-top: 60px;
	background-color: red;
}

.dhl {
	padding-top: 13px;
	padding-left: 10px;
	clear: both;
}

.dhl span {
	color: white;
	padding: 2px 1px;
}

.dha {
	color: white;
	font-size: 15px;
	margin-left: 10px;
	display: inline-block;
	line-height: 30px;
	text-decoration: none;
	-webkit-text-size-adjust: none
}

.dha:hover {
	color: gray;
	font-weight: bold;
}

#dhz {
	margin: 0px 10px;
	float: left;
	width: 790px;
	height: 460px;
}

#dhs {
	float: left;
	width: 182px;
	height: 510px;
}

#dhh {
	width: 800px;
	height: 380px;
	margin-top: 60px;
	margin-left: 60px;
}

#dhh1 {
	width: 820px;
	height: 200px;
}

.dhd {
	width: 400px;
	float: left;
	height: 140px;
	margin-top: 10px;
	background-color: red;
}

#tx {
	width: 45px;
	height: 45px;
	float: left;
}

#tx a img {
	width: 100%;
	height: 100%;
	border-radius: 25px;
}

#dl {
	margin: 5px 10px;
	float: left;
}

.ddl {
	margin: 10px 5px;
	width: 100%;
	height: 50px;
}

.dp {
	color: #999;
	font-size: 14px;
}

.dp a {
	color: black;
	padding-right: 5px;
}

.dp a:hover {
	color: #f10215;
}

#dhy {
	width: 100%;
	height: 26px;
	margin-left: 5px;
}

#dhy a {
	overflow: hidden;
	background-color: #ffffff;
	border: solid #f10215 1px;
	width: 70px;
	height: 20px;
	height: 20px;
	float: left;
	display: inline-block;
	text-align: center;
	color: #f10215;
	margin-left: 5px;
	padding-top: 5px;
}

#dhy a:hover {
	background-color: #f10215;
	color: #ffffff;
	font-weight: bold;
}

#cx {
	margin-top: 20px;
	float: none;
	height: 30px;
	padding-top: 10px;
	width: 100%;
	border-top: solid #999 1px;
	border-bottom: solid #999 1px;
}

#cx span {
	margin: 10px 15px;
	tab-size: 14px;
}

#cx span:hover {
	color: #f10215;
	cursor: pointer;
}

#dz li {
	height: 30px;
	margin: 15px;
	font-size: 14px;
	color: #f10215;
}

.dzt {
	overflow: hidden;
	display: block;
	float: left;
	width: 32px;
	height: 32px;
	background-image: url("images/zg.png");
}

#dz li p {
	float: left;
	width: 100px;
	height: 30px;
}
</style>
<style type="text/css">
#dhg {
	width: 1190px;
	height: 10px;
	position: absolute;
	top: 750px;
	display: block;
	background-color: #f6f6f6;
}

#qq {
	clear: both;
	width: 1190px;
	height: 650px;
	margin-top: 10px;
}

.qqtile {
	width: 200px;
	height: 60px;
}

.qqtile em {
	color: #434343;
	font-size: 28px;
	display: inline-block;
	height: 28px;
	line-height: 28px;
	clear: both;
	position: relative;
	top: 10px;
	bottom: 0;
	font-style: normal;
}

.zss1 {
	width: 473px;
	height: 460px;
	border: 1px solid #e5e5e5;
	float: left;
}

.zs21 {
	width: 473px;
	height: 227px;
	border-bottom: 1px solid #e5e5e5;
	border-right: 1px solid #e5e5e5;
}

.zs1a img {
	width: 473px;
	height: 460px;
}

.zs2a img {
	width: 473px;
	height: 226px;
}

.zs22a img {
	width: 236px;
	height: 232px;
}

.zs3a img {
	width: 240px;
	height: 460px;
}

.zsd {
	display: block;
	width: 100%;
	height: 4px;
	background-color: red;
	position: relative;
	top: -4px;
}

.zsdh {
	display: none;
}

.zs1a img {
	width: 473px;
	height: 460px;
}

.zss2 {
	width: 474px;
	height: 460px;
	float: left;
	border-bottom: 1px solid #e5e5e5;
	border-top: 1px solid #e5e5e5;
}

.zs2 {
	width: 236px;
	height: 232px;
	border-right: 1px solid #e5e5e5;
	float: left;
}

.zss3 {
	width: 240px;
	height: 460px;
	border-right: 1px solid #e5e5e5;
	border-bottom: 1px solid #e5e5e5;
	border-top: 1px solid #e5e5e5;
	float: left;
}

#dbs {
	background-color: #dedede;
	width: 1190px;
	height: 42px;
	margin-left: 130px;
	padding-top: 10px;
}

#dbs ul {
	overflow: hidden;
	height: 42px;
}

.dbm {
	float: left;
	width: 297px;
	height: 42px;
}

#dbs1 h5 {
	background-image: url("images/index.png");
}

#dbs2 h5 {
	background: url("images/index.png") 0 -43px;
	width: 36px;
	height: 42px;
	left: 418px;
}

#dbs3 h5 {
	background: url("images/index.png") 0 -86px;
	width: 36px;
	height: 42px;
	left: 714px;
}

#dbs4 h5 {
	background: url("images/index.png") 0 -129px;
	width: 36px;
	height: 42px;
	left: 1012px;
}

.dbm h5 {
	overflow: hidden;
	position: absolute;
	height: 42px;
	width: 36px;
	text-indent: -9999px;
	left: 120px;
	top: 1350px;
}

.dbm p {
	overflow: hidden;
	height: 42px;
	width: 100%;
	padding-left: 30px;
	line-height: 42px;
	font-size: 18px;
	font-weight: 700;
	text-overflow: ellipsis;
	white-space: nowrap;
	color: #444;
}

#lj li {
	float: left;
	margin: 0px 3px;
}

#lj li a {
	color: #666;
}

#lj li a:hover {
	color: #f10215;
}

.lj1 li {
	float: left;
	margin: 5px 3px;
}

.lj1 li a {
	color: #999999;
}

.lj1 li a:hover {
	color: #f10215;
}

.sp {
	overflow: hidden;
	margin: 5px 5px;
	padding-top: 3px;
	width: 1px;
	height: 10px;
	background-color: #999;
}

#du1 {
	width: auto;
	height: 10px;
	text-align: center;
	padding-top: 20px;
	margin-left: 290px;
}

#du2 {
	width: auto;
	height: 10px;
	text-align: center;
	padding-top: 20px;
	margin-left: 250px;
}

#du3 {
	width: auto;
	height: 10px;
	text-align: center;
	padding-top: 20px;
	margin-left: 420px;
}

#du4 {
	width: auto;
	height: 10px;
	text-align: center;
	padding-top: 20px;
	margin-left: 560px;
}

#du5 {
	width: 1190px;
	height: 35px;
	text-align: center;
	margin-top: 30px;
	margin-left: 80px;
	overflow: hidden;
	position: absolute;
}

.wbq {
	color: #999;
	overflow: hidden;
	display: inline-block;
	margin: 0 10px;
	width: 103px;
	height: 32px;
	background-image: url("images/ico_footer.png");
}

#dhw {
	margin-left: 225px;
}

#dhr {
	height: 10px;
	width: 1190px;
	margin-left: 80px;
	margin-top: 10px;
	border-top: solid #666 1px;
}
</style>
<style type="text/css">
#tp {
	height: 100%;
	width: 100%;
}

#tp li {
	overflow: hidden;
	float: left;
	position: absolute;
}

#tb li a {
	width: 100%;
	height: 100%;
}

#tb li a img {
	width: 100%;
	height: 100%;
}

#lb i {
	display: inline-block;
	width: 12px;
	height: 12px;
	margin-right: 10px;
	background-color: white;
	position: relative;
	left: 300px;
	top: -30px;
	border-radius: 100%;
	text-indent: -9999px;
}

#left {
	width: 40px;
	height: 50px;
	background-color: #666;
	filter: alpha(opacity = 70);
	opacity: 0.7;
	position: absolute;
	top: 330px;
	display: none;
}

#left a {
	display: inline-block;
	transform: rotate(180deg);
	width: 16px;
	height: 30px;
	text-align: center;
	padding-top: 10px;
	padding-left: 10px;
	background: url("images/pre.png") no-repeat;
}

#right {
	width: 40px;
	height: 50px;
	background-color: #666;
	filter: alpha(opacity = 70);
	opacity: 0.7;
	position: absolute;
	top: 330px;
	left: 1238px;
	display: none;
}

#right a {
	display: inline-block;
	width: 16px;
	height: 30px;
	text-align: center;
	margin: 10px;
	background: url("images/pre.png") no-repeat;
}
</style>
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var lis = $(".tpl a img");
		var is = $(".i");
		lis.hide();
		lis.eq(0).show();
		var con = 0;
		var flag = false;
		var inter;
		$("#left a").click(function() {
			lis.hide();
			stop();
			$(".i").css('background-color', '#ffffff');
			if (con > 0) {
				con = con - 1;
			} else {
				con = 5;
			}
			is.eq(con).css('background-color', 'red');
			lis.eq(con).show();
			start();
		});

		$("#right a").click(function() {
			lis.hide();
			stop();
			$(".i").css('background-color', '#ffffff');
			if (con < 5) {
				con = con + 1;
			} else {
				con = 0;
			}
			is.eq(con).css('background-color', 'red');
			lis.eq(con).show();
			start();
		});

		$(".i").click(function() {
			stop();
			var index = $(this).text();
			$(".i").css('background-color', '#ffffff');
			$(this).css('background-color', 'red');
			for (var i = 0; i < lis.length; i++) {
				if (i == index) {
					lis.eq(i).show();
					con = i;
				} else {
					lis.eq(i).hide();
				}
			}
			start();
		});


		$("#dhh").mousemove(function() {
			$("#left").css("display", "block");
			$("#right").css("display", "block");
		});

		$("#dhh").mouseleave(function() {
			$("#left").css("display", "none");
			$("#right").css("display", "none");
		});

		function show() {
			lis.hide();
			$(".i").css('background-color', '#ffffff');
			if (con < 5) {
				con++;
			} else {
				con = 0;
			}
			lis.eq(con).show();
			is.eq(con).css('background-color', 'red');
		}
		function start() {
			if (!flag) {
				flag = true;
				inter = setInterval(show, 5000);
			}
		}
		function stop() {
			clearInterval(inter);
			flag = false;

		}

		start();

		$(".zs1a").mouseenter(function() {
			$(".zs1a span").removeClass("zsdh");
			$(".zs1a span").addClass("zsd");

		});
		$(".zs1a").mouseleave(function() {
			$(".zs1a span").removeClass("zsd");
			$(".zs1a span").addClass("zsdh");
		});

		$(".zs2a").mouseenter(function() {
			$(".zs2a span").removeClass("zsdh");
			$(".zs2a span").addClass("zsd");

		});
		$(".zs2a").mouseleave(function() {
			$(".zs2a span").removeClass("zsd");
			$(".zs2a span").addClass("zsdh");
		});
		$(".zs22a").mouseenter(function() {
			$(this).children("span").removeClass("zsdh");
			$(this).children("span").addClass("zsd");

		});
		$(".zs22a").mouseleave(function() {
			$(this).children("span").removeClass("zsd");
			$(this).children("span").addClass("zsdh");
		});
		$(".zs3a").mouseenter(function() {
			$(".zs3a span").removeClass("zsdh");
			$(".zs3a span").addClass("zsd");

		});
		$(".zs3a").mouseleave(function() {
			$(".zs3a span").removeClass("zsd");
			$(".zs3a span").addClass("zsdh");
		});
		$("#sb").click(function() {

			var text = $("#st").val();
			if (text != "") {
				window.location.href = "serch?serchFile=" + text + "";
			}

		});


	});
</script>

</head>

<body>
	<div class="headBar">

		<div class="hh">
			<div class="gg"></div>
		</div>

		<div class="conClass">
			<ul class="fr">
				<li class="ndl">
					<c:if test="${user.isfabu==1 && user.isfabu!=null}">
							<a href="new_post.jsp" class="nd" style="font-size: 14px;">我要发布</a>
					</c:if>
					<c:if test="${user.isfabu!=1 || user.isfabu==null}">
							<a href="/shop/Login" class="nd">申请发布</a>
					</c:if> <a href="my_info.jsp" class="nz">欢迎 ${user.nickName}</a></li>
				<li class="spacer"></li>
				<li class="hf1"><a href="my_info.jsp">我的信息</a></li>
				<c:if test="${user.isfabu!=null && user.isfabu==1 }">
					<li class="spacer"></li>
					<li class="hf1"><a href="post.jsp" class="nd" >我的发布</a></li>
					<li class="spacer"></li>
					<li class="hf1"><a href="/shop/Login" class="nd">回收站</a></li>
				</c:if>
				<li class="spacer"></li>
			</ul>
		</div>
	</div>
<div class="so">
 
  <div class="s">
        <div>
            <input type="text" id="st" name="serchFile">
            <input type="button" id="sb" value="搜索">
        </div>
       
   </div> 
</div>
	<div id="dh">
		<div id="dhd">
			<ul class="dhu">
				<%-- <c:forEach var="ltype" items="${type}">
           <li class="dhl">
           <span class="slt" style="font-size: 14px;"> ${ltype.name} </span>  --%>
				<c:forEach var="zhuti" items="${zhuti}">
					<ul>
						<li style="float: left;"><a href="show?id=${zhuti.id}"
							class="dha">${zhuti.name}</a></li>
					 </ul> 
				</c:forEach>
				<%--  <ul>         
           </ul>  
           </li>
           
           </c:forEach> --%>
			</ul>
		</div>
		<div id="dhz">
			<div id="dhh">
				<ul id="tp">

					<c:forEach var="pic" items="${pics}">
						<li class="tpl">
						  <a>
						  <img src="images/lp/${pic.picture}"
								style="width: 880px;height: 370px;">
						</a>
						</li>
					</c:forEach>
				</ul>
				<div id="left">
					<a href="#"></a>
				</div>
				<div id="right">
					<a href="#"></a>
				</div>
				<div id="lb">
					<i class="i" style="background-color: red">0</i> <i class="i">1</i>
					<i class="i">2</i> <i class="i">3</i> <i class="i">4</i> <i
						class="i">5</i>
				</div>
			</div>

		</div>
	</div>
	<div id="wb">
		<div id="dhr"></div>
		<div id="dhw">
			<ul id="lj">
				<li><a href="#">关于我们</a></li>
				<li class="sp"></li>
				<li><a href="#">联系我们</a></li>
				<li class="sp"></li>
				<li><a href="#">联系客服</a></li>
				<li class="sp"></li>
				<li><a href="">商家入驻</a></li>
				<li class="sp"></li>
				<li><a href="#">营销中心</a></li>
				<li class="sp"></li>
				<li><a href="#">手机营销中心</a></li>
				<li class="sp"></li>
				<li><a href="#">手机京东</a></li>
				<li class="sp"></li>
				<li><a href="#">友情链接</a></li>
				<li class="sp"></li>
				<li><a href="#">销售联盟</a></li>
				<li class="sp"></li>
				<li><a href="#">京东社区</a></li>
				<li class="sp"></li>
				<li><a href="#">风险监测</a></li>
				<li class="sp"></li>
				<li><a href="#">京东公益</a></li>
				<li class="sp"></li>
				<li><a href="#">English Site</a></li>
				<li class="sp"></li>
				<li><a href="#">Contact Us</a></li>
			</ul>
		</div>
		<div id="du3">
			<ul class="lj1">
				<li><a href="#">Copyright © 2004 - 2016 京东JD.com 版权所有</a></li>
				<li class="sp"></li>
				<li><a href="#">消费者维权热线：4006067733 经营证照</a></li>
			</ul>
		</div>
		<div id="du5">
			<p id="dup">
				<a href="#" class="wbq" style="background-position: 0 -151px;"></a>
				<a href="#" class="wbq" style="background-position: -104px -151px;"></a>
				<a href="#" class="wbq" style="background-position: 0 -184px;"></a>
				<a href="#" class="wbq" style="background-position: -104px -184px;"></a>
				<a href="#" class="wbq" style="background-position: 0 -217px;"></a>
				<a href="#" class="wbq" style="background-position: -104px -217px;"></a>
			</p>
		</div>
	</div>
</body>
</html>
