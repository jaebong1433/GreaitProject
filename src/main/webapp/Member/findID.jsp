<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String contextPath = request.getContextPath();
    
    %>
    <style>
    	.findtb{
    		text-align: center;
    		width: 400px;
    		font-size: 1.2em;
    	}
    	
    	.findtb input{
    		width: 250px;
    		height: 40px;
    	}
    	
    	.joinf{
    		margin-top: 70px;
    	}
    	
    	.joinf button{
			background-color : gray;
			color : white;
			width : 15%;
			height: 40px;
			border-radius: 10px;
			margin-top: 40px;
		}
    	
    </style>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	<div class="joinf">
	<img src="<%=contextPath%>/eq/img/mm2.png" width="200px"><br>
		<h2>아이디 찾기</h2>
		<table class="findtb">
			<tr>
				<td>
					이메일
				</td>
				<td>
					<input type="text">
				</td>
			</tr>
			<tr>
				<td>
					이름
				</td>
				<td>
					<input type="text">
				</td>
			</tr>
		</table>
		<a href="<%=contextPath%>/Member/findID2.jsp">
		<button>아이디 찾기</button>
		</a>
		</div>
	</center>
</body>
</html>