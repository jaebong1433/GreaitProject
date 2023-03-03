<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>


<!DOCTYPE html>
	<html class="no-js">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>TOP - GreaIT</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
		<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
		<meta name="author" content="FREEHTML5.CO" />

	 

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="<%=contextPath%>/images/Giticon.png">

	<!-- Animate.css -->
	<link rel="stylesheet" href="<%=contextPath%>/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="<%=contextPath%>/css/icomoon.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="<%=contextPath%>/css/magnific-popup.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap.css">

	<link rel="stylesheet" href="<%=contextPath%>/css/style.css">

	<link rel="stylesheet" id="theme-switch" href="<%=contextPath%>/css/style.css">
	
	</head>
	<body>
	
	<!-- Loader -->
	<div class="fh5co-loader"></div>
	
	<div id="fh5co-page">
		<section id="fh5co-header" style="background-color : gray">
			<div class="container">
				<nav role="navigation">
					<ul class="pull-left left-menu">
						<li><a href="#">견적문의</a></li>
						<!-- 공지사항 페이지 -->
						<li><a href="<%=contextPath%>/boardList.jsp">공지사항</a></li>
						<li><a href="#">고객센터</a></li>
						<li><a href="#">쇼핑</a></li>
					</ul>
					<h1 id="fh5co-logo"><a href="#"><img src="<%=contextPath%>/images/Greaitlogo.png" width="150px" height="85px"></a></h1>
					<!-- 로그인 로그아웃  마이페이지버튼만생성 구현  2월 28일-->
					<%
					
					String email = (String)session.getAttribute("email");
					if(email == null){
					
					%>
					<ul class="pull-right right-menu">
						<li><a href="<%=contextPath%>/login.jsp">로그인</a></li>
						<li class="fh5co-cta-btn"><a href="<%=contextPath%>/join.jsp">회원가입</a></li>
					</ul>
					
					<%
					
					}else{
					
					%>
					
					<ul class="pull-right right-menu" >
						<li style="color:white;"><%=email%> </li>
						<li class="fh5co-cta-btn"><a href="<%=contextPath%>/member1/logout.me">logout</a></li>
					</ul>
					
					<!-- 추가 3.3 재봉 -->
					<form action="<%=contextPath%>/member1/mypage.me" class="form" method="post">
					<ul class="pull-right right-menu" >
						<input type="hidden" name="email" value="<%=email%>">
						<li class="fh5co-cta-btn"><a href="#" onclick="check(); return false;" 
						class="btn btn-common">마이페이지</a></li>
					</ul>
					</form>
					
					
					<%
					}
					%>
					
					<!-- 수정끝 로그인 로그아웃 마이페이지버튼만생성 구현  2월 28일-->
				
				</nav>
				<br><br><br>
			</div>
			
		</section>
		<!-- #fh5co-header -->

		
	</div>
	
	
	<!-- jQuery -->
	<script src="<%=contextPath%>/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="<%=contextPath%>/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="<%=contextPath%>/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="<%=contextPath%>/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="<%=contextPath%>/js/jquery.flexslider-min.js"></script>
	<!-- Magnific Popup -->
	<script src="<%=contextPath%>/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=contextPath%>/js/magnific-popup-options.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="<%=contextPath%>/js/main.js"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    	function check(){
    		$("form").submit();
    	}
    </script>
	
	</body>
</html>

