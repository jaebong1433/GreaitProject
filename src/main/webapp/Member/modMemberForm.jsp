<%@page import="VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String contextPath = request.getContextPath();
    
    String loginNick = (String)session.getAttribute("m_nickname");
    
    %>
    <style>
    	.findtb{
    		text-align: center;
    		width: 400px;
    		font-size: 1.2em;
    		margin-top : 100px;
    	}
    	
    	.findtb input{
    		width: 250px;
    		height: 40px;
    	}
    	
    	.joinf{
    		margin-top: 70px;
    		height: 800px;
    	}
    	
    	
    	.findbt{
    		background-color : gray;
			color : white;
			width : 15%;
			height: 40px;
			border-radius: 10px;
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
	
	<a href="<%= contextPath%>/member1/main.me">
	<img src="<%=contextPath%>/eq/img/mm2.png" width="200px"><br>
	</a>
	
		<h2>회원정보 수정</h2>
		<form class="form-signin" action="<%=contextPath%>/member1/mypageUpdate1.me" id="modMemberForm" method="post">
		<table class="findtb">
			<tr>
				<td>
					비밀번호
				</td>
				<td>
					<input type="password" name="m_pw"  placeholder="비밀번호">
					<input type="hidden" name="m_nickname" value="<%=loginNick%>"> 
				</td>
			</tr>
		</table>
		<br><br>
		<input class="findbt" type="button" value="회원정보 수정" onclick="submit();">
		<input class="findbt" type="button" value="취소" onClick="history.back();">
		</form>
		</div>
	</center>
</body>
</html>