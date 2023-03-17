<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String contextPath = request.getContextPath();
    
    String m_pw = (String)request.getAttribute("m_pw"); 
    
    
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
		<h3>비밀번호는 <%=m_pw %>입니다.</h3>
		<input type="button" value="홈으로" onclick="hone();" >		
		<input type="button" value="로그인" onclick="login();">
		</a>
		</div>
	</center>
	<script>
	function login(){
		location.href="<%=contextPath%>/Member/login.jsp";
	}
  
	function hone() {
		location.href="<%=contextPath%>/main.jsp";
	}
	</script>
</body>
</html>