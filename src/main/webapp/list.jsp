<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>List - GreaIT</title>
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
	
	.lista{
		background-color:white;
		border: 1px solid black;
		float: center;
		width: 100%;
		height: 100%;
	}
	
	.listbox{
		border: 1px solid yellow;
		width: 100%;
		margin: auto;
	}
	
	.imgbox{
		margin-top: 30px;
		width: 40%;
		height: 100%;
		float: left;
		
		margin: auto;
	}
	
	.pbox{
	
		margin: auto;
		align-text:left;
	}
	
	.bbox{
		margin: auto;
		float:right;
	}
	
	
	</style>
	
	
</head>
<body>
	<div class="lista">
		<center>
		
			<div class="listbox">
				<div class="imgbox">
					<img src="<%=contextPath%>/images/img_1.jpg" width="40%" height="90%">
				</div>
				<div class="pbox"><br>
					<h2>프론트 문의</h2>
					asdsw
				
				</div>	
				<div class="bbox">
						<button>문의하기</button>
				</div>	
			</div>	
				
			<div class="listbox">
				<div class="imgbox">
					<img src="<%=contextPath%>/images/img_1.jpg" width="40%" height="90%">
				</div>
				<div class="pbox"><br>
					<h2>프론트 문의</h2>
					asdsw
				
				</div>	
				<div class="bbox">
						<button>문의하기</button>
				</div>	
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