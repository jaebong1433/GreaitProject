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
		.list{
			width: 90%;
			border: 1px solid gray;
			text-align: left;
		}
		
		.listimg{
			width: 20%;
			border: 1px solid blue;
			float: left;
		}
		
		.listtext{
			width: 78%;
			border: 1px solid red;
			float: right;
		}
	</style>
</head>
<body>
<center>
	<div class="list">
		<div class="listimg">
		<img src="<%=contextPath%>/eq/img/photo1.jpg" width="250px" height="200px">
		</div>
		<div class="listtext">
		<table>
			<tr>
				<td>
					컨저링
				</td>
			</tr>
			<tr>
				<td>
					컨저링
				</td>
			</tr>
			<tr>
				<td>
					컨저링
				</td>
			</tr>
		</table>
		</div>
	</div>
	
</center>	
</body>
</html>