<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="author" content="Jobboard">
    
    <title>로그인 - AirPlaneMood</title>    

      <!-- 타이틀 아이콘 -->
    <link rel="shortcut icon" href="<%=contextPath%>/assets/img/airicon.png">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/css/bootstrap.min.css" type="text/css">    
    <link rel="stylesheet" href="<%=contextPath%>/assets/css/jasny-bootstrap.min.css" type="text/css">  
    <link rel="stylesheet" href="<%=contextPath%>/assets/css/bootstrap-select.min.css" type="text/css"> 
     
    <!-- Material CSS -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/css/material-kit.css" type="text/css">
    
    <!-- 폰트 CSS -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/fonts/font-awesome.min.css" type="text/css"> 
    <link rel="stylesheet" href="<%=contextPath%>/assets/fonts/themify-icons.css"> 

    <!-- Animate CSS -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/extras/animate.css" type="text/css">
    
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/extras/owl.carousel.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath%>/assets/extras/owl.theme.css" type="text/css">
    
    <!-- Rev Slider CSS -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/extras/settings.css" type="text/css"> 
    
    <!-- Slicknav js -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/css/slicknav.css" type="text/css">
    
    <!-- Main Styles -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/css/main.css" type="text/css">
    
    <!-- Responsive CSS Styles -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/css/responsive.css" type="text/css">
    

    <!-- Color CSS Styles  -->
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/assets/css/colors/moodc.css" media="screen" />
    
    <style type="text/css">
    	.logBox {
    		width: 400px;
		  	margin-top: 30px;
		  	text-align:center;
		  	border: 1px solid #04B4AE; 
		}
    </style>
    
</head>
<body>
<center>
	<div class="logBox">
		<br>
		<div align = "center">
			<h1>로그인</h1><br>
			<input type = "text" value="아이디"><br>
			<input type = "password" value="PASSWORD"><br>
			<a>아이디 찾기</a> / <a>비밀번호 찾기</a><br>
			<a href="#" class="btn btn-common">로그인</a><br><br>
			<a href="#"><img src="<%=contextPath%>/assets/img/login/kakao_icon.png" width="50px" height="50px"></a>
			<a href="#"><img src="<%=contextPath%>/assets/img/login/naver_icon.png" width="50px" height="50px"></a>
			<a href="#"><img src="<%=contextPath%>/assets/img/login/google_icon.png" width="50px" height="50px"></a>
			<a href="#"><img src="<%=contextPath%>/assets/img/login/insta_icon.png" width="50px" height="50px"></a>
			<br><br><br>
		</div>
		
	</div>
</center>	


	  <!-- Main JS  -->
    <script type="text/javascript" src="<%=contextPath%>/assets/js/jquery-min.js"></script>      
    <script type="text/javascript" src="<%=contextPath%>/assets/js/bootstrap.min.js"></script>    
    <script type="text/javascript" src="<%=contextPath%>/assets/js/material.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/material-kit.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/jquery.parallax.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/jquery.slicknav.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/main.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/jquery.counterup.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/waypoints.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/jasny-bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/form-validator.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/contact-form-script.js"></script>    
    <script type="text/javascript" src="<%=contextPath%>/assets/js/jquery.themepunch.revolution.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/jquery.themepunch.tools.min.js"></script>
    
</body>
</html>