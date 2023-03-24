<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String contextPath = request.getContextPath();
%>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		.bota{
			margin : auto;
			width : 80%;
			font-size: 1em;
			
		}
		
		a{
			text-decoration: none;
			color: lightgray;
		}
		
		.bbbot p{
			color : lightgray;
		}
		
	</style>

</head>
<body>
	<center>
	<div class="bbbot">
	<hr style="border: solid 2px lightgray">
		<div class="bota">
			<a href="#"><strong>영화</strong></a> |
			<a href="#"><strong>모든영화</strong></a> |
			<a href="#"><strong>사업자번호</strong></a> |
			<a href="#"><strong>지도</strong></a>
		</div><br>
		<p>
			(주)무드무비  사업자 등록번호 214-98754-9874 <br>
			통신 판매업신고 번호 : 제 2021-경남-26호 <br>
			
			경상남도 양산시 양산역 1길 2 양산역프라자 202호<br><br>
			
			대표전화 : <a href="<%=contextPath%>/map/minigame.mo">010-0000-0000</a><br>
			
			FAX : <a href="<%=contextPath%>/map/minigame2.mo">01-3546-9874</a>
		</p>
		</div>
	</center>
</body>
</html>