<%@page import="VO.MemberVO"%>
<%@page import="java.sql.Date"%>
<%@page import="VO.CommunityVO"%>
<%@ page
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	
	MemberVO membervo = (MemberVO)request.getAttribute("membervo");
	String c_idx = (String)request.getAttribute("c_idx");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
		<script>
			
		</script>
	</head>
	<body>
		<form name="reply" action="<%=contextPath %>/com/replyPro.bo">
			제목 : <input type="text" name="title"><br>
			<c:choose>
	          <c:when test="${ (membervo.m_nickname) != null}">
	          	작성자 : <input type="text" name="writer" value="${ membervo.m_nickname }" readonly><br>
	          </c:when>
	          <c:otherwise>
		        작성자 : <input type="text" name="writer"><br>
		      </c:otherwise>
		   </c:choose>     
			내용 : <input type="text" name="content"><br>
			비밀번호 : <input type="password" name="pass">
			<input type="hidden" name="c_idx" value="<%=c_idx%>">
			<button type="submit">게시</button>
		</form>
	</body>
</html>