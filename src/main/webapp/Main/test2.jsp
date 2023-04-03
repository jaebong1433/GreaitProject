<%@page import="VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	String nowPage = request.getParameter("nowPage");
	String nowBlock = request.getParameter("nowBlock");
	String loginNick = (String)session.getAttribute("m_nickname");
	String noticeCheck;
%>
<c:set var="loginNick" value="${ m_nickname }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="/MVCBoard/style.css"/>
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');
	
	.font1 {
		font-family: 'Black Han Sans', sans-serif;
	}
	
	.font3{
		font-family: 'Do Hyeon', sans-serif;
	}
	.font2{
		font-family: 'Sunflower', sans-serif;
	
	}
	
	.mainboard{
		width: 90%;
		height: 600px;
	}
	
	.board1{
		float: left;
		width : 49%;
		border-right : 1px solid black;
		
	}
	
	.board2{
		float: right;
		width : 49%;
		border-left : 1px solid black;
	}
	
	h2{
		text-align: left;
		margin-left: 10%;
		font-family: 'Do Hyeon', sans-serif;
	}
</style>

</head>
<body>
<center>
	<div class="mainboard">
		<div class="board1">
		<h2>개념 글</h2>
			<table width="90%">
				<tr bgcolor="pink">
					<td width="70%" align="left">제목</td>
					<td width="20%">작성자</td>
					<td width="10%">추천</td>
				</tr>
				<tr>
					<td align="left">제목</td>
					<td>작성자</td>
					<td>추천</td>
				</tr>
			</table>
		</div>
		<div class="board2">
		<h2>자유게시판</h2>
			<table width="90%">
				<tr bgcolor="pink" height="16%">
					<td width="70%" align="left">제목</td>
					<td width="20%">작성자</td>
					<td width="10%">추천</td>
				</tr>
				<tr>
					<td align="left">제목</td>
					<td>작성자</td>
					<td>추천</td>
				</tr>
			</table>
		</div>
	</div>
</center>
</body>
</html>