<%@page import="VO.CommunityVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String contextPath = request.getContextPath();
	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 연습중</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		<style type="text/css">
			.comut{
				width : 90%;
				
			}
			
			.comut a{
				text-decoration: none;
			}
			
			.comut td{
				
				border-bottom: 1px solid gray;
			}
			
			
		</style>
		
	</head>
<body>	
	<center>
		<div>
			<table class="comut">
				<tr>
					<td width="60%"><a href="#">
						글 제목 입니다~~~~~~~~~~~~
					</a></td>
					<td width="20%">작성자</td>
					<td width="20%">작성일</td>
				</tr>
				<tr>
					<td width="60%"><a href="#">
						글 제목 입니다~~~~~~~~~~~~
					</a></td>
					<td width="20%">작성자</td>
					<td width="20%">작성일</td>
				</tr>
				<tr>
					<td width="60%"><a href="#">
						글 제목 입니다~~~~~~~~~~~~
					</a></td>
					<td width="20%">작성자</td>
					<td width="20%">작성일</td>
				</tr>
				<tr>
					<td width="60%"><a href="#">
						글 제목 입니다~~~~~~~~~~~~
					</a></td>
					<td width="20%">작성자</td>
					<td width="20%">작성일</td>
				</tr>
				<tr>
					<td width="60%"><a href="#">
						글 제목 입니다~~~~~~~~~~~~
					</a></td>
					<td width="20%">작성자</td>
					<td width="20%">작성일</td>
				</tr>
			</table>
		</div>
		
	</center>


</body>
</html>