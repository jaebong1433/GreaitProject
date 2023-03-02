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
		<title>마이페이지 - GreaIT</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
		<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
		<meta name="author" content="FREEHTML5.CO" />


	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="<%=contextPath%>/images/Giticon.png">
	<style type="text/css">
		
		.rema{
			width: 1100px;
			height: 400px;
		}
		
		hr{
			border: solid 2px gray;
			width: 90%;
		}
		
		table{
			border: solid 1px black;
			width : 90%;
			height: 60%;
			text-align: center;
		}
		tr{
			
		}
		
		button{
			width : 15%;
			height: 10%;
		}
		
	</style>
	
</head>
<body>

<div style="background-color: white">
<center>
	<br><br>
		<div class="rema">
			<h1>마이페이지</h1>
			<hr><br>
			<table>
				<tr>
					<td><span style = " font-size:1.5em;">
						이름
					</span></td>
					<td>홍길동</td>
					<td><span style = " font-size:1.5em;">
						전화번호
					</span></td>
					<td>010-1234-5678</td>
				</tr>
				
				<tr>
					<td><span style = " font-size:1.5em;">
						이메일
					</span></td>
					<td>dwpa@naver.com</td>
					<td><span style = " font-size:1.5em;">
						주소
					</span></td>
					<td>부산</td>
				</tr>
				<tr>
					<td><span style = " font-size:1.5em;">
						가입일자
					</span></td>
					<td>2023/03/01</td>
				</tr>
			</table>
			<button>회원 수정</button>
			<button>회원 탈퇴</button>
		</div>
	
</center>
</body>
</html>