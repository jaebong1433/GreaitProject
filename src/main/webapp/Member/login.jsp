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
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />
	
	<link rel="stylesheet" href="<%=contextPath%>/css/style.css">
	
	<link rel="stylesheet" id="theme-switch" href="<%=contextPath%>/css/style.css">
	<link href="<%=contextPath %>/eq/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=contextPath %>/eq/css/sidebars.css" rel="stylesheet">
	
	
	<style>
		
		.logf{
			text-align : center;
			width : 400px;
			margin-top : 150px;
		}
		
		.logf button{
			background-color : gray;
			color : white;
			width : 50%;
			height: 40px;
			border-radius: 10px;
		}
		
		a{
			color : gray;
			text-decoration: none;
		}
		
		
	</style>
	

    
 
</head>
<center>
<body align="center">
	<div class="logf">
		<a href="<%=contextPath%>/index.jsp">
			<img src="<%=contextPath%>/eq/img/mm2.png" width="200px">
   		</a><br><br><br>
   		<input class="loginp" type="text" value="아이디"><br>
   		<input class="loginp" type="password" value="password"><br><br>
   		<button>로그인</button><br>
   		<a href="#"><strong>회원가입하기</strong></a><br><br>
   		<a href="#">아이디 찾기</a> / <a href="#">비밀번호 찾기</a><br><br>
   		
   		<br><br>
   		
   		<p>간편로그인</p>
   		<a href="#"><img src="<%=contextPath%>/eq/img/kakao_icon.png" width="50px" height="50px"></a>
		<a href="#"><img src="<%=contextPath%>/eq/img/naver_icon.png" width="50px" height="50px"></a>
		<a href="#"><img src="<%=contextPath%>/eq/img/google_icon.png" width="50px" height="50px"></a>
		<a href="#"><img src="<%=contextPath%>/eq/img/insta_icon.png" width="50px" height="50px"></a>
   		
   		
	</div>
</center>	
</body>
</html>













