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
    
    <title>My JSP 'advertisement.jsp' starting page</title>
    
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

#dhh{
       width: 850px;
       height:370px;
       margin: 20px auto;
     

}
   #tp{
            height: 100%;
            width: 100%;
            
        }
        #tp li{
            overflow: hidden;
            float: left;
            position: absolute;
        }
        #tb li a{
            width: 100%;
            height: 100%;
        }
        #tb li a img{
            width: 100%;
            height: 100%;
            margin-left: -20px;
        }
        #lb i{
            display: inline-block;
            width: 12px;
            height: 12px;
            margin-right: 10px;
            background-color: white;
            position: relative;
            left:350px;
            top: -30px;
            border-radius: 100%;
            text-indent: -9999px;
        }
        #left{
            width: 40px;
            height: 50px;
            background-color: #666;
            filter: alpha(opacity=70);
            opacity:0.7;
            position: absolute;
            top:270px;
            left:115px;
            display: none;
        }
        #left a{
            display: inline-block;
            transform: rotate(180deg);
            width: 16px;
            height:40px;
            text-align: center;
            padding-top: 10px;
            padding-left: 10px;
            background: url("images/pre.png") no-repeat;
        }
         #left a:HOVER{
           cursor: pointer;
        }


        #right{
            width: 40px;
            height: 50px;
            background-color: #666;
            filter: alpha(opacity=70);
            opacity:0.7;
            position: absolute;
            top:270px;
            left:865px;
            display: none;
        }

        #right a{
            display: inline-block;
            width: 16px;
            height: 30px;
            text-align: center;
            margin: 10px;
            background: url("images/pre.png") no-repeat;
        }
          #right a:HOVER{
           cursor: pointer;
        }

    </style>

<script type="text/javascript">
$(document).ready(function(){
 var lis=$(".tpl a img");
            var is=$(".i");
            lis.hide();
            lis.eq(0).show();
            var con=0;
            var flag=false;
            var inter;
            $("#left a").click(function () {
                lis.hide();
                stop();
                $(".i").css('background-color','#ffffff');
                if(con>0)
                {
                    con=con-1;
                }else {
                    con=5;
                }
                is.eq(con).css('background-color','red');
                lis.eq(con).show();
                start();
            });

            $("#right a").click(function () {
                lis.hide();
                stop();
                $(".i").css('background-color','#ffffff');
                if(con<5)
                {
                    con=con+1;
                }else {
                    con=0;
                }
                is.eq(con).css('background-color','red');
                lis.eq(con).show();
                start();
            });

            $(".i").click(function () {
                stop();
                var index=$(this).text();
                $(".i").css('background-color','#ffffff');
                $(this).css('background-color','red');
                for(var i=0;i<lis.length;i++)
                {
                    if(i==index)
                    {
                        lis.eq(i).show();
                        con=i;
                    }else{
                        lis.eq(i).hide();
                    }
                }
                start();
            });


            $("#dhh").mousemove(function () {
                $("#left").css("display","block");
                $("#right").css("display","block");
            });

            $("#dhh").mouseleave(function () {
                $("#left").css("display","none");
                $("#right").css("display","none");
            });

            function show() {
                lis.hide();
                $(".i").css('background-color','#ffffff');
                if(con<5)
                {
                    con++;
                }else{
                    con=0;
                }
                lis.eq(con).show();
                is.eq(con).css('background-color','red');
            }
            function start() {
                if(!flag)
                {
                    flag=true;
                    inter= setInterval(show,5000);
                }
            }
            function stop() {
                clearInterval(inter);
                flag=false;

            }
            start();
            
            
         $("#gl").click(function(){
         window.location.href = "meager/sdv";
         
         });   


});

</script>

  </head>
  
  <body>
  <div style="margin-top: 20px;">
    <div class="panel panel-primary" style="background: #f1f1f1;">
    <div class="panel-heading">
        <h3 class="panel-title">广告管理</h3>
    </div>
    <div class="panel-body">
     <h3 class="panel-title">首页图片轮播</h3>
        <div id="dhh">
            <ul id="tp">
            <c:forEach var="p" items="${pic}">
                <li class="tpl">
                    <a href="${p.src}">
                        <img src="images/lp/${p.picture}" style="width: 790px;height: 370px;">
                    </a>
                </li>
             </c:forEach>
            </ul>
            <div id="left">
                <a ></a>
            </div>
            <div id="right">
                <a ></a>
            </div>
            <div id="lb">
                <i class="i" style="background-color: red" >0</i>
                <i class="i">1</i>
                <i class="i">2</i>
                <i class="i">3</i>
                <i class="i">4</i>
                <i class="i">5</i>
            </div>        
        </div>
        <button type="button" class="btn btn-primary" id="gl">管理图片轮播</button>
       
    </div>
</div>
</div>
  </body>
</html>
