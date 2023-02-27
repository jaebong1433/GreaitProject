<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
%>



<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Login - GreaIT</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />
	
	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="<%=contextPath%>/images/Giticon.png">

	

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,600,400italic,700' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Flexslider -->
	<link rel="stylesheet" href="css/flexslider.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<link rel="stylesheet" href="css/style.css">

	<style type="text/css">
    	.logBox {
    		width: 400px;
		  	margin-top: 30px;
		  	text-align:center;
		  	float: center;
		  	background-color: white;
		}
		
		
		
		.logbtn {
	    height: 60px;
	    width: 60px;
	    float: right;
	    border: none;
	    font-size: 20px;
	   
	}
	
	.loginput{
		float : left;
	}
	
	.loga{
		height: 60px;
		width: 250px;
	}
    </style>


</head>
<body>
<div style="background-color: white">
<center>

		<br><br>
		<br><br>
	<div class="logBox">
		<div align = "center">
		<br><br>
			<h1>로그인</h1><br>
			
			<form class="form-signin" action="<%=contextPath%>/member1/loginPro.me" id="login">
			
			
			<div class="loga">
			<div class="loginput">
			<input type = "text" value="email" width="200px"><br>
			<input type = "password" value="Password" width="200px">
			</div>
			<a href="#" class="logbtn"><img src="<%=contextPath%>/images/log/go1.png" width="70px" height="70px"></a>
			</div>
			<br><br><br>
			<a href="<%=contextPath%>/findId.jsp">아이디 찾기</a> / <a href="<%=contextPath%>/findPw.jsp"">비밀번호 찾기</a><br>
			<br>
			<p>간편로그인</p>
			<a href="#"><img src="<%=contextPath%>/images/log/kakako-icon.png" width="50px" height="50px"></a>
			<a href="#"><img src="<%=contextPath%>/images/log/naver-icon.png" width="50px" height="50px"></a>
			<a href="#"><img src="<%=contextPath%>/images/log/google-icon.png" width="50px" height="50px"></a>
			<a href="#"><img src="<%=contextPath%>/images/log/Instagram-icon.png" width="50px" height="50px"></a>
			<br><br>
		</div>
		
		</form>
		
	</div>
	</center>
	</div>


<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>

</body>
</html>