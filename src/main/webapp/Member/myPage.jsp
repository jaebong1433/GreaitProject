<%@page import="VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String contextPath = request.getContextPath();
	
	String m_nickname = (String)session.getAttribute("m_nickname");
	MemberVO vo = (MemberVO)request.getAttribute("vo");
	

	%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>


<form action="<%=contextPath%>/member1/mypageUpdate.me" class="form" method="post">


			<h1>마이페이지</h1>
			<hr><br>
			
				<tr class="tra">
					<td><span style = " font-size:1.5em;">
						닉네임
					</span>
					</td>
					<td><%=vo.getM_nickname()%></td>
					<input type="hidden" name="m_nickname" value="<%=vo.getM_nickname()%>">
					
					
					<td><span style = " font-size:1.5em;">
						ID
					</span>
					</td>
					<td><%=vo.getM_id() %></td>
					
				
					<td><span style = " font-size:1.5em;">
						이름
					</span>
					</td>
					<td><%=vo.getM_name()%></td>
					
					
					<td><span style = " font-size:1.5em;">
						이메일
					</span>
					</td>
					<td><%=vo.getM_email()%></td>
				</tr>
				
				
				<tr>		
					<td><span style = " font-size:1.5em;">
						가입일자
					</span></td>
					<td><%=vo.getM_date() %></td>
				</tr>
				
		
			<div class="diva">
			<input type="button" value="회원수정" onClick="check(); return false;">
			</div>
		




</form>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    	function check(){
    		$("form").submit();
    	}
    </script>





</body>
</html>