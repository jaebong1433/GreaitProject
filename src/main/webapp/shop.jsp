<%@page import="VO.OrderVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	
	Vector vector = (Vector)request.getAttribute("vector");
%>
<%-- 정태영이 만든 임의의 쇼핑 리스트 페이지. --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑 리스트가 뜨는 화면입니다.</title>
</head>
<body>
	<br><br><br><br><br><br><br><br><br><br>
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>상품명</td>
			<td>이미지명</td>
			<td>상품설명</td>
			<td>담당자</td>
			<td>가격</td>
			<td>결제수단</td>
			<td>이동</td>
		</tr>
		<%
			for(int i=0; i<vector.size(); i++) {
				OrderVO vo = (OrderVO)vector.get(i);
		%>
				<form action="order_detail.do" method="post">
					<tr>
						<td><%= vo.getIdx() %></td>
						<td><%= vo.getItemname()%></td>
						<td><%= vo.getImage() %></td>
						<td><%= vo.getInfo() %></td>
						<td><%= vo.getManagername() %></td>
						<td><%= vo.getPrice() %></td>
						<td><%= vo.getPaymentmethod() %></td>
						<td>
							<input type="hidden" name="detail" value="<%=vo.getIdx()%>">
							<input type="submit" value="이동">
						</td>
					</tr>
				</form>
		<%
			}
		%>	
	</table>
</body>
</html>