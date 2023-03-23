<%@page import="VO.MemberVO"%>
<%@ page
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	
	String m_nickname = (String)session.getAttribute("m_nickname");
	MemberVO vo = (MemberVO)request.getAttribute("vo");
	
%>	

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
		
		<style type="text/css">
			.mpdiv{
				width : 98%;
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
			
			.profiletb{
				width : 20%;
				height : 300px;
				float : left;
				border : 1px solid red;
				margin : 20px 0px 0px 100px;
				text-align: center;
			}
			
			
			.profimg {
			    width: 200px;
			    height: 200px; 
			    border-radius: 70%;
			    overflow: hidden;
			    margin-left: 15%;
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
			}
			
			
		</style>
		
	</head>
	<body>
	
	<form action="<%=contextPath%>/member1/mypageUpdate.me" class="form" method="post">
	
		<center>
			<div class="mpdiv">
				<h1>회원 수정</h1>
				<hr>
				<table class="mptb">
					<tr>
						<td width="10%">닉네임</td>
						<td width="40%">123</td>
						<input type="hidden" name="m_nickname" value="123">
					
					</tr>
					<tr>	
						<td>이름</td>
						<td>123</td>
					</tr>
					<tr>
						<td>ID</td>
						<td>123</td>
					</tr>
					<tr>	
						<td>Email</td>
						<td>123</td>
					</tr>
					<tr>
						<td>가입일자</td>
						<td>123</td>
					</tr>
				</table>
				
				<table class="profiletb">
					<tr>
						<td class="proftt">
						<div class="profimg">
							<img src="<%=contextPath%>/eq/img/pps.png">
						</div>
						</td>
					</tr>
					<tr>
						<td height="19%">
							123님
						</td>
					</tr>
				</table>
				<div class="btnbtn">
					<input type="button" value="회원수정" onClick="check(); return false;">
				</div>
				
			</div>
		</center>
		
	</form>	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    	function check(){
    		$("form").submit();
    	}
    </script>
		
	</body>
</html>