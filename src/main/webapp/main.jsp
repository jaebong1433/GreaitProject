<%@ page
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<%
	HttpSession session2 = request.getSession();
	String nickname = (String)session.getAttribute("nickname");
%>

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
		<%= nickname %><br>
		메인이에요 방가방가
	</body>
</html>