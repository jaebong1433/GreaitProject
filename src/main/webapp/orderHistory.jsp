<%@page import="VO.InquiryHistoryVO"%>
<%@page import="VO.OrderHistoryVO"%>
<%@page import="java.util.Vector"%>
<%@ page
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	
	Vector shopVector = (Vector)request.getAttribute("shopVector");
	Vector techVector = (Vector)request.getAttribute("techVector");
	
%>

<%-- 정태영이 만든 임의의 주문 내역 페이지입니다. --%>
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
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<h1>주문 내역</h1>
		<table border="1">
		<tr>
			<td>글번호</td>
			<td>상품명</td>
			<td>이미지</td>
			<td>상품설명</td>
			<td>담당자</td>
			<td>가격</td>
			<td>수량</td>
			<td>총가격</td>
			<td>이름</td>
			<td>이메일</td>
			<td>휴대폰 번호</td>
			<td>주소</td>
			<td>결제수단</td>
			<td>결제시각</td>
		</tr>
		<%
			for(int i=0; i<shopVector.size(); i++) {
				OrderHistoryVO vo = (OrderHistoryVO)shopVector.get(i);
		%>
				<form action="order_detail.do" method="post">
					<input type="hidden" name="detail" value="<%=vo.getIdx()%>">
					<tr>
						<td><%= vo.getIdx() %></td>
						<td><%= vo.getItemname() %></td>
						<td><img height="50" src="<%= contextPath %>/images/<%= vo.getImage() %>"/></td>
						<td><%= vo.getInfo() %></td>
						<td><%= vo.getManagername() %></td>
						<td><%= vo.getPrice() %></td>
						<td><%= vo.getQuentity() %></td>
						<td><%= vo.getTotalprice() %></td>
						<td><%= vo.getName() %></td>
						<td><%= vo.getEmail() %></td>
						<td><%= vo.getPhonenumber() %></td>
						<td><%= vo.getAddress() %></td>
						<td><%= vo.getPaymentmethod() %></td>
						<td><%= vo.getPaytime() %></td>
					</tr>
				</form>
		<%
			}
		%>	
	</table><br>
	
	<h1>문의 내역</h1>
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>상품명</td>
			<td>이미지</td>
			<td>상품설명</td>
			<td>담당자</td>
			<td>최소가격</td>
			<td>이름</td>
			<td>이메일</td>
			<td>휴대폰 번호</td>
			<td>주소</td>
			<td>결제시각</td>
		</tr>
		<%
			for(int i=0; i<techVector.size(); i++) {
				InquiryHistoryVO vo = (InquiryHistoryVO)techVector.get(i);
		%>
				<form action="order_detail.do" method="post">
					<input type="hidden" name="detail" value="<%=vo.getIdx()%>">
					<tr>
						<td><%= vo.getIdx() %></td>
						<td><%= vo.getItemname() %></td>
						<td><img height="50" src="<%= contextPath %>/images/<%= vo.getImage() %>"/></td>
						<td><%= vo.getInfo() %></td>
						<td><%= vo.getManagername() %></td>
						<td><%= vo.getPrice() %></td>
						<td><%= vo.getName() %></td>
						<td><%= vo.getEmail() %></td>
						<td><%= vo.getPhonenumber() %></td>
						<td><%= vo.getAddress() %></td>
						<td><%= vo.getPaytime() %></td>
					</tr>
				</form>
		<%
			}
		%>	
	</table>
	</body>
</html>