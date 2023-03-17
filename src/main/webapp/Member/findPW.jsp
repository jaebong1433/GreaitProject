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
		<h2>비밀번호 찾기</h2>
		
		<form class="form-signin" action="<%=contextPath%>/member1/findPwResult.me" id="findPW" method="post">
		
		<table class="findtb">
			<tr>
				<td>
					아이디
				</td>
				<td>
					<input type="text" name="m_id" placeholder="아이디">
				</td>
			</tr>
			<tr>
				<td>
					이메일
				</td>
				<td>
					<input type="text" name="m_email" placeholder="이메일">
				</td>
			</tr>
			<tr>
				<td>
					이름
				</td>
				<td>
					<input type="text" name="m_name" placeholder="이름">
				</td>
			</tr>
		</table>
		<input type="button" value="비밀번호 찾기" onclick="submit();">
		<input type="button" value="취소" onClick="history.back();">
		</form>
		</a>
		</div>
	</center>
</body>
</html>