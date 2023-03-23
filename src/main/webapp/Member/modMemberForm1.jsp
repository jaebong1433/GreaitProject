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
		<button type="button" id="nickbtn">수정하기</button>
		
		
		<br>이메일<br> <input type="text" id="m_email" name="m_email"
			value="<%=vo.getM_email()%>" readonly>
		<p id="emailInput"></p>
		<button type="button" id="button2">수정하기</button>
		
		
		<br> 비밀번호<br> <input type="passWord" id="m_pw" name="m_pw"
			placeholder="비밀번호를 입력하세요." readonly>
		<p id="pwInput1"></p>
		<button type="button" id="button3">수정하기</button>
		

		<div>
			<br> <a href="#" onclick="check(); return false;"
				class="btn btn-common">수정완료</a><br>
				<input type="button" value="회원탈퇴" onClick="location.href='<%=contextPath%>/member1/delete.me'">
			<br>
		</div>

	</form>	


  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>	    
    <script type="text/javascript">
    
    $("#nickbtn").click(function(){
    	$("#m_nickname").attr('readonly', false).focus();
    });
    
    
    
  <%--   
  //닉네임 입력시 유효성검사 
	$("#m_nickname").focusout(function() {
		var m_nickname = $("#m_nickname");
		
	   	var m_nicknameValue = m_nickname.val();
	   								 
	   	var m_nicknameReg = RegExp(/^[가-힣a-zA-Z0-9]{2,20}$/);
	   	
	   	var resultM_nickname = m_nicknameReg.test(m_nicknameValue);
	
		if(resultM_nickname == true){
			
			$.ajax(
					{
					type:"post", 
    				async:true, 
    				url:"<%=contextPath%>
					/member1/joinNicknameCheck.me",
														data : {
															m_nickname : m_nicknameValue
														},//서버페이지로 요청할 데이터설정
														dataType : "text",
														success : function(data) {
															console.log(data);

															if (data == 'usable') {//닉네임이 DB에 없으면?(중복아님)

																$(
																		"#nicknameInput")
																		.text(
																				"사용할수 있는 닉네임 입니다.")
																		.css(
																				"color",
																				"blue");

															} else {//닉네임이 DB에 있으면? (입력한 닉네임이  DB에 저장되어 있다는 의미)

																$(
																		"#nicknameInput")
																		.text(
																				"사용할수 없는 닉네임 입니다.")
																		.css(
																				"color",
																				"red");

															}
														},//success 닫기

														error : function() {
															alert("통신에러가 발생했습니다.");
														}

													}// json  {  } 닫기		

													);// $.ajax메소드 호출 부분 끝부분

										} else {
											$("#nicknameInput").text(
													"닉네임 형식이 올바르지 않습니다!").css(
													"color", "red");
										}

									});

					//비밀번호 입력시 
					$("#m_pw").focusout(
							function() {
								if ($("#m_pw").val().length < 4) {
									$("#pwInput1").text(
											"한글,특수문자 없이 4글자 이상으로 작성해 주세요!")
											.css("color", "red");
								} else {
									$("#pwInput1").text("올바르게 입력되었습니다.").css(
											"color", "blue");
								}
							});

					//이메일 입력시 유효성검사 동일하게 
					$("#m_email")
							.focusout(
									function() {
										var m_email = $("#m_email");

										var m_emailValue = m_email.val();

										var m_emailReg = /^\w{3,12}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;

										var resultM_email = m_emailReg
												.test(m_emailValue);

										if (resultM_email == true) {

											$
													.ajax({
														type : "post",
														async : true,
														url : "
				<%=contextPath%>/member1/joinEmailCheck.me", //요청할 주소
	    					data:{ m_email : m_emailValue },//서버페이지로 요청할 데이터 설정!
	    					dataType:"text", 
	    					success : function(data){
	    						console.log(data);
	    						
	    						if(data == 'usable'){ //아이디가 DB에 없으면?(중복아님)
	    							
	    							$("#emailInput").text("사용할수 있는 email입니다.").css("color","blue");
	    									
	    						}else{//아이디가 DB에 있으면? (입력한 아이디가  DB에 저장되어 있다는 의미)
	    							
	    							$("#emailInput").text("사용할수 없는 email입니다.").css("color","red");

	    						}
	    					},//success 닫기

	    					
	    					error:function(){
	    						alert("통신에러가 발생했습니다.");
	    					}
	    					
	    					
	    				}// json  {  } 닫기
	    	
	    			  ); // $.ajax메소드 호출 부분 끝부분  
	    		
    		}else{
    			$("#emailInput").text("이메일 형식이 올바르지 않습니다!").css("color","red");
    		}

	});
     --%>

</script>	









</body>
</html>