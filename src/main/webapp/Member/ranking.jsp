<%@page import="VO.MemberVO"%>
<%@ page
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
%>	
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="<%=contextPath%>/eq/css/myCss.css">
		<style type="text/css">
			.mpdiv{
				width : 98%;
				margin : 100px 0 0 0;
			}
			
			.mptb{
				border : 1px solid black;
				width : 60%;
				height : 300px;
				float : right;
				margin : 20px 100px 0px 0px;
			}
			
			.mptb td{
				border : 1px solid gray;
				
			}
			
			.mptb button{
				background-color: gray;
				color: white;
				margin-left: 10px;
				width: 80px;
				height: 30px;
				border-radius: 10px;
			}
			
			.profiletb{
				width : 20%;
				height : 300px;
				float : left;
				border : 3px solid gray;
				margin : 20px 0px 0px 100px;
				text-align: center;
			}
			
			
			.profimg {
			    width: 200px;
			    height: 200px; 
			    border-radius: 70%;
			    overflow: hidden;
			    margin: auto;
			}
			.profimg img{
			    width: 100%;
			    height: 100%;
			    object-fit: cover;
			}
			
			.btnbtn{
				margin : auto;
				width : 200px;
				height : 500px;
			}
			
			.btnbtn input{
				margin-top: 10px;
				width : 150px;
				height: 40px;
				background-color: gray;
				color : white;
				border-radius : 10px;
			}
			
			
		</style>
		
	</head>
	<body>
		<table border = "1">
			<tr>
				<td>랭킹</td>
				<td>레벨</td>
				<td>누적 경험치</td>
				<td>닉네임</td>
				<td>가입일</td>				
			</tr>
			<c:set var="rank" value="1"/>
			<c:forEach var="memvo" items="${ list }">
				<tr>
					<td>${ rank }</td>
					<td>${ memvo.m_level }</td>	
					<td>${ memvo.m_exp }</td>
					<td>${ memvo.m_nickname }</td>
					<td>${ memvo.m_date }</td>			
				</tr>
				<c:set var="rank" value="${ rank + 1 }"/>
			</c:forEach>
		</table>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	</body>
</html>