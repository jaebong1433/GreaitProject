<%@page import="VO.OrderVO"%>
<%@ page
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	
	OrderVO vo = (OrderVO)request.getAttribute("vo");
%>

<%-- 정태영이 만든 임의의 쇼핑 디테일 페이지. --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			
		</script>
	</head>
	<body>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		
		<input type="text">
	</body>
</html>