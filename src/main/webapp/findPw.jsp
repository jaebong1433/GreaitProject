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
	<title>비밀번호 찾기 - GreaIT</title>
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
	<style>
	.logBox {
    		width: 70%;
		  	margin-top: 30px;
		  	text-align:center;
		  	align:center;
		  	float: center;
		  	background-color: white;
		  	
		}
		
		.logq{
			width:25%;
			text-align:left;
			margin: auto;
		}
		
		.logq input{
			width:100%
		}
		
		input{
			width:17%
		}
		
		</style>
</head>
<body>
<div style="background-color:white">
		<center>
		<br><br><br><br><br>
			<div class="logBox">
				<h2>비밀번호 찾기</h2>
				<br>
				
				<div>
					<div class="logq">
						이메일<br>
						<input type="text" name="email" class="btn-email" placeholder="등록한 이메일"><br>
						이름<br>
						<input type="text" name="mame" class="" placeholder="등록한 이름"><br>
						전화번호<br>
						<input type="tel" name="phoneNum" >
					</div><br>
					<input type="button" value="찾기" onClick="">
					<input type="button" value="취소" onClick="history.back();">
					<br><br>
				</div>
			</div>
</div>			
		
		</center>
		
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