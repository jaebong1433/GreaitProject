<%@page import="java.sql.Date"%>
<%@page import="VO.MemberVO"%>
<%@page import="DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%  
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	
	String email = (String)session.getAttribute("email");
	MemberDAO dao = new MemberDAO();
	MemberVO vo = dao.findMember(email);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
	<style type="text/css">
		.cls1{
			font-size: 40;
			text-align: center;
		}
	</style>
</head>

<body>
	<h1 style="text-align:center">회원정보</h1>
	<table align="center">
		<tr>
			<td width="200"><p align="right">이메일</p></td>
			<td width="200"><p align="right"><%=vo.getEmail() %></p></td>
		</tr>
		<tr>
			<td width="200"><p align="right">비밀번호</p></td>
			<td width="200"><p align="right"><%=vo.getPw() %></p></td>
		</tr>
		<tr>
			<td width="200"><p align="right">이름</p></td>
			<td width="200"><p align="right"><%=vo.getName() %></p></td>
		</tr>
		<tr>
			<td width="200"><p align="right">휴대폰번호</p></td>
			<td width="200"><p align="right"><%=vo.getPhoneNum() %></p></td>
		</tr>
		<tr>
			<td width="200"><p align="right">주소1</p></td>
			<td width="200"><p align="right"><%=vo.getAddress1()%></p></td>
		</tr>
		<tr>
			<td width="200"><p align="right">주소2</p></td>
			<td width="200"><p align="right"><%=vo.getAddress2()%></p></td>
		</tr>
		<tr>
			<td width="200"><p align="right">주소3</p></td>
			<td width="200"><p align="right"><%=vo.getAddress3() %></p></td>
		</tr>
		<tr>
			<td width="200"><p align="right">주소4</p></td>
			<td width="200"><p align="right"><%=vo.getAddress4() %></p></td>
		</tr>
		<tr>
			<td width="200"><p align="right">주소5</p></td>
			<td width="200"><p align="right"><%=vo.getAddress5() %></p></td>
		</tr>
		<tr>
			<td width="200"><p align="right">가입일</p></td>
			<td width="200"><p align="right"><%=vo.getM_date() %></p></td>
		</tr>
		<tr align="center">
			<td colspan="5" width="400">
			<input type="button" value="뒤로가기" onclick="<%=contextPath%>/webapp/GreaIT.jsp">
			<td><a href="<%=contextPath%>/member1/mypageUpdate.me">회원정보 수정하기</a></td>
			<td><a href="<%=contextPath%>/member1/delete.do">회원탈퇴</a></td>
			</td>
		</tr>
	</table>
</body>
</html>