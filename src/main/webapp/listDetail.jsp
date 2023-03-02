<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ListDetail - GreaIT</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />
	
	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="<%=contextPath%>/images/Giticon.png">
	
	
	
	
	<style>
		
		.ld{
			height: 1500px;
			width: 1100px;
			text-align: center;
		}
		
		.lda{
			height: 300px;
			width: 40%;
			margin-left: 50px;
			float: left;
		}
		
		.ldb{
			height: 300px;
			width: 50%;
			margin-right: 25px;
			float: right;
		}
		
		.ldba{
			text-align: left;
			height: 200px;
			width: 100%;
		}
		
		.ldbb{
			width:50%;
			height: 100px;
			float: right;
			margin-right: 30px;
			text-align: right;
		}
		
		.ldc{
			height: 450px;
			width: 90%;
			border: 1px solid pink;
			margin-top: 400px;
			margin-left: 50px;
			text-align: left;
		}
		
		button{
			width: 100%;
			height: 50%;
		}
		
		hr{
			border: solid 2px gray;
			width: 90%;
		}
		
		
	</style>
	
	
</head>
<body>
	<center>
	
		<div class="ld">
		
		<br><br><br><br>
		<h1>주문하기</h1>
		<hr><br>
		<div>
			<div class="lda">
			
				<img src="<%=contextPath%>/images/a.jpg" width="100%" height="100%">
			</div>
			<div class="ldb">
				<div class="ldba">
					<h1>프론트엔드 개발</h1>
					<p>담당자 : 홍길동</p>
					<h3>개발 소개</h3>
					<p>내용내용내용내용내용내용내용</p>
				</div>
				<div class="ldbb">
					<h1>300,000</h1>
					<button>주문하기</button>
				</div>
				
			</div>
			
		</div>
			<div class="ldc">
			<hr style="width:100%">
				<p>
					대충 내용 적는곳
				</p>
			</div>
			<hr>
			<div>
				<p>
					대충 리뷰
				</p>
				
			</div>
			
		</div>
	</center>
	
</body>
</html>