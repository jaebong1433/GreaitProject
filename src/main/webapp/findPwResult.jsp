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
	<title>아이디 찾기 - GreaIT</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />
	
	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="<%=contextPath%>/images/Giticon.png">

	

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
		
		input{
			width: 100px;
			height: 40px;
		}
		
		
		</style>
</head>
<body>
<div style="background-color:white">
		<center>
		<br><br>
		<h1 id="fh5co-logo"><a href="<%=contextPath%>/GreaIT.jsp">
		<img src="<%=contextPath%>/images/Greaitlogo.png" width="180px" height="100px">
		</a></h1>
			<div class="logBox">
				<h2>비밀번호 찾기</h2>
				<br>
				
				<div>
					
					<h1>Master님의 비밀번호는 1234 입니다.</h1>
					
					<input type="button" value="홈으로">
					<input type="button" value="로그인">
					
					<br><br>
				</div>
			</div>
</div>			
		
		</center>
		

	

</body>
</html>