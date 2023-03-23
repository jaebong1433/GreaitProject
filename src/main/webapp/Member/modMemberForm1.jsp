<%@page import="VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%  
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	
	MemberVO vo = (MemberVO)request.getAttribute("vo");
	
	%>
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>



</head>
<body>
	<form action="<%=contextPath%>/member1/update.me" class="form">


		<br> 이름<br> <input type="text" id="m_name" name="m_name"
			value="<%=vo.getM_name()%>" readonly>
		<p id="nameInput"></p>


		
		<br> 아이디<br> <input type="text" id="m_id" name="m_id"
			value="<%=vo.getM_id()%>" readonly>
		<p id="idInput"></p>



		닉네임<br> <input type="text" id="m_nickname" name="m_nickname"
			value="<%=vo.getM_nickname()%>" readonly>
		<p id="nicknameInput"></p>
		<button type="button" id="button1"> 수정</button>
		
		
		<br>이메일<br> <input type="text" id="m_email" name="m_email"
			value="<%=vo.getM_email()%>" readonly>
		<p id="emailInput"></p>
		<button type="button" id="button2">수정</button>
		
		
		<br> 비밀번호<br> <input type="passWord" id="m_pw" name="m_pw"
			placeholder="비밀번호를 입력하세요." readonly>
		<p id="pwInput1"></p>
		<button type="button" id="button3">수정</button>
		

		<div>
			<br> <a href="#" onclick="check(); return false;"
				class="btn btn-common">수정완료</a><br>
				<input type="button" value="회원탈퇴" onClick="location.href='<%=contextPath%>/member1/delete.me'">
			<br>
		</div>

	</form>	


  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>	    
    <script type="text/javascript">
    
    
 // readonly 해제하기
    $("#button1").click(function(){
     
    	$("#m_nickname").prop("readonly", false).focus();
   
    });
	
    
    $("#button2").click(function(){
        
    	$("#m_email").prop("readonly", false).focus();
   
    });
	
    
    $("#button3").click(function(){
        
    	$("#m_pw").prop("readonly", false).focus();
   
    });
	
    
    // 회원정보 수정 유효성 검사
    
    
    
    
    
    
    
    
    
    
    
    

</script>	









</body>
</html>