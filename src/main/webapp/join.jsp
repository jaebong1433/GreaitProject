<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>회원가입 - GreaIT</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
		<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
		<meta name="author" content="FREEHTML5.CO" />

	 

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="<%=contextPath%>/images/Giticon.png">

	<!-- Animate.css -->
	<link rel="stylesheet" href="<%=contextPath%>/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="<%=contextPath%>/css/icomoon.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="<%=contextPath%>/css/magnific-popup.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap.css">

	<link rel="stylesheet" href="<%=contextPath%>/css/style.css">

	<style>
	.logBox {
    		width: 70%;
		  	margin-top: 30px;
		  	text-align:center;
		  	float: center;
		  	background-color: white;
		}
	
	
	input{
		width: 300px;
	}
		
	</style>
</head>
<body>
<form action="<%=contextPath%>/member1/joinPro.me" class="form" method="post">
<div style="background-color: white">
<center>
<br>
	<div class="logBox">
	<h1 id="fh5co-logo"><a href="<%=contextPath%>/GreaIT.jsp">
		<img src="<%=contextPath%>/images/Greaitlogo.png" width="180px" height="100px">
		</a></h1>
	<br>
	<h1>회원가입</h1>
		<div>
        <div>
            <div class="join_content">
                <!-- 아이디, 비밀번호 입력 -->
                <div class="row_group">
                    <div class="logx">
                        	이메일<br>
							<input type="text" placeholder="아이디로 가입할 이메일을 적어주세요."
							   id="emailId" name="email">
					    <p id = "emailInput"></p><br>
                    </div><br>

                    <div class="logx">
                    비밀번호<br>
							<input type="password" placeholder="가입할 비밀번호를 적어주세요."
							   id="pw" name="pw"> 
						<p id="pwInput1"></p><br>
                    </div><br>
                    
                    <div class="logx">
                        비밀번호 확인<br>
							<input type="password" placeholder="비밀번호를 다시 한번 적어주세요."
							   id="pwCheck" > 
						<p id="pwInput2"></p><br>
                    </div><br>
                        
                <!-- 이름, 생년월일 입력 -->
                <div class="row_group">

                    <!-- lang = ko_KR -->
                    <div class="join_row">
                        이름<br>
                        <input type="text" placeholder="가입할 이름을 적어주세요."
							   id="name" name="name"> 
						<p id="nameInput"></p>
					</div>
                    <!-- lang = ko_KR -->
 
                </div>

                <!-- 휴대전화 번호, 인증번호 입력 -->
                <div>
                    <br>휴대전화
                    
                    <div>
							<input type="tel" placeholder="전화번호 입력" aria-label="전화번호 입력" maxlength="16" value="010" id="phoneNum" name="phoneNum">
					    <p id="phoneInput"></p>
						
                        <br>
                    </div>
                    
                </div>
                
					<div colspan="4">
						<%-- name속성값 address1 부터 ~~ address5 까지 입력되어 있는 주소를 모두 합쳐서 DB에 address열에  INSERT 하자. --%>
						<br>주소<br>
						<p id="addressInput"></p>
						<input type="text" id="sample4_postcode" name="address1" placeholder="우편번호"><br>
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" ><br>
						
						<input type="text" id="sample4_roadAddress" name="address2" placeholder="도로명주소"><br>
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="address3"><br>
						
						<span id="guide" style="color:#999;display:none"></span>
						
						<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="address4"><br>
						<input type="text" id="sample4_extraAddress" placeholder="참고항목"  name="address5">
						
					</div>
                
                <div><br>
                    <a href="#" onclick="check(); return false;" 
					class="btn btn-common">회원가입</a><br><br>
                </div>
            </div>
        </div>
    </div>

</div>
	</div>
</center>
</form>	
<!-- jQuery -->
	<script src="<%=contextPath%>/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="<%=contextPath%>/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="<%=contextPath%>/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="<%=contextPath%>/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="<%=contextPath%>/js/jquery.flexslider-min.js"></script>
	<!-- Magnific Popup -->
	<script src="<%=contextPath%>/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=contextPath%>/js/magnific-popup-options.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="<%=contextPath%>/js/main.js"></script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>	
</script>	    
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
	
  //이메일 입력시 유효성검사 동일하게 수정 3.6 재봉
	$("#emailId").focusout(function() {
		var email = $("#emailId");
		
		var emailValue = email.val();
		
		var emailReg = /^\w{5,12}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
		
		var resultEmail = emailReg.test(emailValue);
		
		if(resultEmail == true){		
	    		
	    		$.ajax( 
	    				{
	    					type:"post", 
	    					async:true, 
	    					url:"<%=contextPath%>/member1/joinIdCheck.me", //요청할 주소
	    					data:{ emailId : emailValue },//서버페이지로 요청할 데이터 설정!
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
	
	//폰번호
	$("#phoneNum").focusout(function() {
		var p = $("#phoneNum");
  		var pValue = p.val();
  		var pReg = RegExp(/^01[0179][0-9]{7,8}$/);
  		var resultP = pReg.test(pValue);
  		if(!resultP){
  			$("#phoneInput").text("휴대폰번호 형식이 올바르지 않습니다.").css("color","red");
  		}else{
  			$("#phoneInput").text("올바르게 입력되었습니다.").css("color","blue");
  		}	
   	});
    
	//주소
	$("input[name='address1'],input[name='address2'],input[name='address3'],input[name='address4'],input[name='address5']").focusout(function() {
		if(	$("input[name='address1']").val()== "" || 
			$("input[name='address2']").val()== "" ||
			$("input[name='address3']").val()== "" ||
			$("input[name='address4']").val()== "" ||
			$("input[name='address5']").val()== "" ){
		$("#addressInput").text("주소를 모두 작성하여주세요.").css("color","red");
	}else{
		$("#addressInput").text("올바르게 입력되었습니다.").css("color","blue");
	}
	});
	
	function check(event) {
			
   	  		//이메일
			var email = $("#emailId");
    		
    		var emailValue = email.val();
    		
    		var emailReg = /^\w{5,12}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
    		
    		var resultEmail = emailReg.test(emailValue);
    		
    		if(!resultEmail){
    			$("#emailInput").text("이메일 형식이 올바르지 않습니다.").css("color","red");
    			
    			email.focus();
    			
    			return false;
    		}else{
    			$("#emailInput").text("올바르게 입력되었습니다.").css("color","blue");
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
    		
    		//폰번호
			var hp = $("#phoneNum");
    		
    		var hpValue = hp.val();
    		
    		var hpReg = RegExp(/^01[0179][0-9]{7,8}$/);
    		
    		var resultHp = hpReg.test(hpValue);
    		
    		if(!resultHp){
    			
    			$("#phoneInput").text("휴대폰번호 형식이 올바르지 않습니다.").css("color","red");
    			
    			hp.focus();
    			
    			return false;
    		}else{
    			$("#phoneInput").text("올바르게 입력되었습니다.").css("color","blue");
    		}
    		
    		//주소
    		var address1 = $("#sample4_postcode");
    		var address2 = $("#sample4_roadAddress"); 
    		var address3 = $("#sample4_jibunAddress")
    		var address4 = $("#sample4_detailAddress");
    		var address5 = $("#sample4_extraAddress");
    		var addVal1 = address1.val();
    		var addVal2 = address2.val();
    		var addVal3 = address3.val();
    		var addVal4 = address4.val();
    		var addVal5 = address5.val();
    		if(addVal1 == "" || addVal2 == "" || addVal3 == "" || addVal4 == "" || addVal5 == ""){
    			$("#addressInput").text("주소를 모두 작성하여주세요.").css("color","red");
    			address5.focus();
    			
    			return false;
    		}else{
    			$("#addressInput").text("올바르게 입력되었습니다.").css("color","blue");
    		}
	    	
			alert("회원가입이 완료 되었습니다.");
   	    	
   	    	$("form").submit();
				    	
	}	
</script>	
</body>
</html>