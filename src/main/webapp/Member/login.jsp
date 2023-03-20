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
		
		<a href="<%= contextPath%>/member1/main.me">	
   		<img src="<%=contextPath%>/eq/img/mm2.png" width="200px"><br><br>
   		</a>
   		
   		
   		<form class="form-signin" action="<%= contextPath%>/member1/loginPro.me" id="login" onsubmit="return login();" method="post">
   		
	   		<input id="m_id" class="loginp" type="text" name="m_id" placeholder="아이디"><br>
	   		<input id="m_pw" class="loginp" type="password" name="m_pw" placeholder="password"><br><br>
	   		<button type="submit" >로그인</button><br><br>
   		<br>
   		</form>	
   		<br>
   			<a href="<%=contextPath%>/member1/join1.me">회원가입</a><br><br>
   			<a href="<%=contextPath%>/member1/findID.me">아이디 찾기</a>/
   			<a href="<%=contextPath%>/member1/findPW.me">비밀번호 찾기</a><br><br>		
   		<p>간편로그인</p>
   		
   		
   		
   		<a href="#"><img onclick="kakaologin();" src="<%=contextPath%>/eq/img/kakao_icon.png" width="50px" height="50px"></a>
		
		
		
		<a href="#"><img onclick="naverlogin();" src="<%=contextPath%>/eq/img/naver_icon.png" width="50px" height="50px"></a>
		
		
		
		<a href="#"><img onclick="googlelogin();" src="<%=contextPath%>/eq/img/google_icon.png" width="50px" height="50px"></a>
		
		
		
		<a href="#"><img onclick="instagramlogin();" src="<%=contextPath%>/eq/img/insta_icon.png" width="50px" height="50px"></a>
   		
   		
   		
	</div>
</center>


<script type="text/javascript">
	
		function login() {
			var m_id = document.getElementById("m_id").val();
			var m_pw = document.getElementById("m_pw").val();
		
			
			if(m_id == "" || m_pw == ""){
				alert("아이디와 비밀번호를 모두 입력해 주세요");
				return false;
			}
			
			return true;
		}
		
		function kakaologin() {
			$("#login").submit();
		}
		
		function naverlogin() {
			$("#login").submit();
		}
		
		function googlelogin() {
			$("#login").submit();
		}	
		
		function instagramlogin() {
			$("#login").submit();
		}

	</script>
	
</body>
</html>













