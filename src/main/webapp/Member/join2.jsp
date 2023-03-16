<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String contextPath = request.getContextPath();
    
    %>
    <style>
    	.Jointb{
    		text-align: center;
    	}
    	
    	.Jointb input{
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
    	
    	.ottdiv{
    		margin: 50px 0 50px 0;
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
	<div class="ottdiv">
			<img src="<%=contextPath%>/eq/img/1232.png" width="600px">
			</div>
	<h2>정보 입력</h2>
		<table class="Jointb">
			<tr>
			<td width="100px">
				닉네임
			</td><td width="300px">	
				<input type="text">
			</td>
			</tr>
			<tr></tr>
			<tr>
			<td>
				ID
				</td><td>
				<input type="text">
			</td>
			</tr>
			<tr></tr>
			<tr>
			<td>
				PW
				</td><td>
				<input type="password">
			</td>
			</tr>
			<tr></tr>
			<tr>
			<td>
				PW 확인
				</td><td>
				<input type="password">
			</td>
			</tr>
			<tr>
			<td>
				이름
				</td><td>
				<input type="text">
			</td>
			</tr>
			<tr>
			<td>
				이메일
				</td><td>
				<input type="text">
			</td>
			</tr>
			
		</table>
		<a href="<%=contextPath%>/Member/join3.jsp">
		<button>회원가입 하기</button>
		</a>
		</div>
	</center>

















  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
	
    
  //닉네임 입력시 유효성검사 
	$("#nickname").focusout(function() {
		var nickname = $("#nickname");
		
	   	var nicknameValue = nickname.val();
	   								 
	   	var nicknameReg = RegExp(/^[가-힣a-zA-Z0-9]{2,20}$/);
	   	
	   	var resultNickname = nicknameReg.test(nicknameValue);
	
		if(resultNickname == true){
			
			$.ajax(
					{
					type:"post", 
    				async:true, 
    				url:"<%=contextPath%>/member1/joinNicknameCheck.me",
    				data:{ m_nickname : nicknameValue },//서버페이지로 요청할 데이터설정
    				dataType:"text",
    				success : function(data) {
						console.log(data);
						
						if (data == 'usable') {//닉네임이 DB에 없으면?(중복아님)
							
							$("#nicknameInput").text("사용할수 있는 닉네임 입니다.").css("color","blue");
							
						}else {//닉네임이 DB에 있으면? (입력한 닉네임이  DB에 저장되어 있다는 의미)
							
							$("#nicknameInput").text("사용할수 없는 닉네임 입니다.").css("color","red");
							
						}	
					},//success 닫기
					
					error:function(){
						alert("통신에러가 발생했습니다.");
					}
					
				}// json  {  } 닫기		
				
			);// $.ajax메소드 호출 부분 끝부분
			
		}else{
			$("#nicknameInput").text("닉네임 형식이 올바르지 않습니다!").css("color","red");
		}

	});
			
		
    //아이디  입력시 유효성검사 
	$("#id").focusout(function() {
		var id = $("#id");
		
		var idValue = id.val();
		
		var idReg = /^[a-z0-9]{4,12}$/;
		
		var resultId = idReg.test(idValue);
		
		if(resultId == true){		
	    		
	    		$.ajax( 
	    				{
	    					type:"post", 
	    					async:true, 
	    					url:"<%=contextPath%>/member1/joinIdCheck.me", //요청할 주소
	    					data:{ m_id : idValue },//서버페이지로 요청할 데이터 설정!
	    					dataType:"text", 
	    					success : function(data){
	    						console.log(data);
	    						
	    						if(data == 'usable'){ //아이디가 DB에 없으면?(중복아님)
	    							
	    							$("#idInput").text("사용할수 있는 id입니다.").css("color","blue");
	    									
	    						}else{//아이디가 DB에 있으면? (입력한 아이디가  DB에 저장되어 있다는 의미)
	    							
	    							$("#idInput").text("사용할수 없는 id입니다.").css("color","red");

	    						}
	    					},//success 닫기

	    					error:function(){
	    						alert("통신에러가 발생했습니다.");
	    					}
	    					
	    					
	    				}// json  {  } 닫기
	    	
	    			  ); // $.ajax메소드 호출 부분 끝부분  
		 			  
	    		
    		}else{
    			$("#idInput").text("아이디 형식이 올바르지 않습니다!").css("color","red");
    		}

	});
    
    
    
	//비밀번호 입력시 
	$("#pw").focusout(function(){
		if($("#pw").val().length < 4 ){
   			$("#pwInput1").text("한글,특수문자 없이 4글자 이상으로 작성해 주세요!").css("color","red");
   		}else{
   			$("#pwInput1").text("올바르게 입력되었습니다.").css("color","blue");
   		}
	});
	
	//비밀번호 확인입력시 
	$("#pwCheck").focusout(function(){
		if($("#pwCheck").val().length < 4 ){
   			$("#pwInput2").text("한글,특수문자 없이 4글자 이상으로 작성해 주세요!").css("color","red");
   		}else{
   			$("#pwInput2").text("올바르게 입력되었습니다.").css("color","blue");
   		}
		
		//입력한 비밓번호와 입력한 비밀번호 확인의 데이터가 같은지 비교
		var pwd1 = $("#pw")
		var pwd2 = $("#pwCheck");
		
		var pwdValue1 = pwd1.val();
		var pwdValue2 = pwd2.val();
		
		if( pwd1.val() !==  pwd2.val()){
			$("#pwInput2").text("비밀번호가 일치하지 않습니다.").css("color","red");
			
			 pwd2.select();
			 return false;
		}
	});
    
    
	
	//이름
	$("#name").focusout(function(){
		var name = $("#name");
	   	var nameValue = name.val();
	   	var nameReg = RegExp(/^[가-힣a-zA-Z]{2,20}$/);
	   	var resultName = nameReg.test(nameValue);
	
		if(!resultName){
			$("#nameInput").text("이름을 2자 이상 한글 또는 영어를 사용하여 작성해주세요.").css("color","red");
			
		}else{
			$("#nameInput").text("올바르게 입력되었습니다.").css("color","blue");
		}
	});
	
	
	
	
  //이메일 입력시 유효성검사 동일하게 
	$("#email").focusout(function() {
		var email = $("#email");
		
		var emailValue = email.val();
		
		var emailReg = /^\w{3,12}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
		
		var resultEmail = emailReg.test(emailValue);
		
		if(resultEmail == true){		
	    		
	    		$.ajax( 
	    				{
	    					type:"post", 
	    					async:true, 
	    					url:"<%=contextPath%>/member1/joinEmailCheck.me", //요청할 주소
	    					data:{ m_email : emailValue },//서버페이지로 요청할 데이터 설정!
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
    

	
	
	function check(event) {

		//닉네임
		var nickname = $("#nickname");
		
		var nicknameValue = nickname.val();
		
		var nicknameReg = RegExp(/^[가-힣a-zA-Z]{2,20}$/);
		
		var resultNickname = nicknameReg.test(nicknameValue);
		
		if(!resultNickname){
			$("#nicknameInput").text("닉네임 형식이 올바르지 않습니다.").css("color","red");
			
			nickname.focus();
			
			return false;
		}else{
			$("#nicknameInput").text("올바르게 입력되었습니다.").css("color","blue");
		}
		
   		
   		//아이디
		var id = $("#id");
		
		var idValue = id.val();
		
		var idReg = /^[a-z0-9]{4,12}$/;
		
		var resultId = idReg.test(idlValue);
		
		if(!resultId){
			$("#idInput").text("아이디 형식이 올바르지 않습니다.").css("color","red");
			
			id.focus();
			
			return false;
		}else{
			$("#idInput").text("올바르게 입력되었습니다.").css("color","blue");
		}
		
		

    	//비밀번호
    	var pass1 = $("#pw");
	    	var passValue1 = pass1.val();
	    	
	    	var passReg1 = RegExp(/^[A-Za-z0-9_\-]{4,20}$/);
	    	var resultPass1 = passReg1.test(passValue1);

		if(!resultPass1){
			$("#pwInput1").text("한글,특수문자 없이 4글자 이상으로 작성해 주세요!").css("color","red");
			pass1.focus();
			
			return false;
		}else{
			$("#pwInput1").text("올바르게 입력되었습니다.").css("color","blue");
		}
    	
		
		
		//비밀번호 확인
		var pass2 = $("#pwCheck");
	    	var passValue2 = pass2.val();
	    	
	    	var passReg2 = RegExp(/^[A-Za-z0-9_\-]{4,20}$/);
	    	var resultPass2 = passReg2.test(passValue2);

		if(!resultPass2){
			$("#pwInput2").text("한글,특수문자 없이 4글자 이상으로 작성해 주세요!").css("color","red");
			pass2.focus();
			
			return false;
		}else{
			$("#pwInput2").text("올바르게 입력되었습니다.").css("color","blue");
		}
		
		//입력한 비밀번호와 입력한 비밀번호 확인의 데이터가 같은지 비교
		if(pass1.val() !== pass2.val()){
			$("#pwInput2").text("비밀번호가 일치하지 않습니다.").css("color","red");
			
			pass2.select();
			
			return false;
		}
		
		
		//이름입력시
		var name = $("#name");
   		if(name.val().length == 0 || name.val() == ""){
			$("#nameInput").text("이름을 작성하여주세요.").css("color","red");
			
			name.focus();
			
			return false;
		}else{
			$("#nameInput").text("이름입력완료!").css("color","blue");
		}
		
		
   	  		//이메일
			var email = $("#email");
    		
    		var emailValue = email.val();
    		
    		var emailReg = /^\w{3,12}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
    		
    		var resultEmail = emailReg.test(emailValue);
    		
    		if(!resultEmail){
    			$("#emailInput").text("이메일 형식이 올바르지 않습니다.").css("color","red");
    			
    			email.focus();
    			
    			return false;
    		}else{
    			$("#emailInput").text("올바르게 입력되었습니다.").css("color","blue");
    		}
   	    	
			alert("회원가입이 완료 되었습니다.");
   	    	
   	    	$("form").submit();
				    	
	}	
</script>	
</body>
</html>