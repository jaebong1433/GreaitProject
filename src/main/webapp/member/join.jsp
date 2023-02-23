<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="author" content="Jobboard">
    
    <title>회원가입 - greaitProject</title>    

      <!-- 타이틀 아이콘 -->
    <link rel="shortcut icon" href="<%=contextPath%>/assets/img/airicon.png">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/css/bootstrap.min.css" type="text/css">    
    <link rel="stylesheet" href="<%=contextPath%>/assets/css/jasny-bootstrap.min.css" type="text/css">  
    <link rel="stylesheet" href="<%=contextPath%>/assets/css/bootstrap-select.min.css" type="text/css"> 
     
    <!-- Material CSS -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/css/material-kit.css" type="text/css">
    
    <!-- 폰트 CSS -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/fonts/font-awesome.min.css" type="text/css"> 
    <link rel="stylesheet" href="<%=contextPath%>/assets/fonts/themify-icons.css"> 

    <!-- Animate CSS -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/extras/animate.css" type="text/css">
    
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/extras/owl.carousel.css" type="text/css">
    <link rel="stylesheet" href="<%=contextPath%>/assets/extras/owl.theme.css" type="text/css">
    
    <!-- Rev Slider CSS -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/extras/settings.css" type="text/css"> 
    
    <!-- Slicknav js -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/css/slicknav.css" type="text/css">
    
    <!-- Main Styles -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/css/main.css" type="text/css">
    
    <!-- Responsive CSS Styles -->
    <link rel="stylesheet" href="<%=contextPath%>/assets/css/responsive.css" type="text/css">
    

    <!-- Color CSS Styles  -->
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/assets/css/colors/moodc.css" media="screen" />
    
    <style type="text/css">
    	.logBox {
    		width: 800px;
		  	margin-top: 30px;
		  	text-align:center;
		  	border: 1px solid #04B4AE; 
		}
    </style>
    
</head>
<body>
<form action="<%=contextPath%>/member1/joinPro.me" class="form">
<center>
	<div class="logBox">
		<br>
		<div align = "center">
			<h1>회원가입</h1><br>
			<h2>이용약관</h2>
		</div>
		<div class="accordion" id="accordionExample">
			<div class="card">
				<div class="card-header" id="headingOne">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left" type="button"
							data-toggle="collapse" data-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">
							약관동의 내용1
						</button>
					</h2>
				</div>

				<div id="collapseOne" class="collapse" aria-labelledby="headingOne"
					data-parent="#accordionExample">
					<div class="card-body">Anim pariatur cliche reprehenderit,
						enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
						moon officia aute, non cupidatat skateboard dolor brunch. Food
						truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
						sunt aliqua put a bird on it squid single-origin coffee nulla
						assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer
						labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
						excepteur butcher vice lomo. Leggings occaecat craft beer
						farm-to-table, raw denim aesthetic synth nesciunt you probably
						haven't heard of them accusamus labore sustainable VHS.</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingTwo">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left collapsed"
							type="button" data-toggle="collapse" data-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">
							약관동의 내용2
						</button>
					</h2>
				</div>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionExample">
					<div class="card-body">Anim pariatur cliche reprehenderit,
						enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
						moon officia aute, non cupidatat skateboard dolor brunch. Food
						truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
						sunt aliqua put a bird on it squid single-origin coffee nulla
						assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer
						labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
						excepteur butcher vice lomo. Leggings occaecat craft beer
						farm-to-table, raw denim aesthetic synth nesciunt you probably
						haven't heard of them accusamus labore sustainable VHS.</div>
				</div>
			</div>
			
		</div>
		<div class="row justify-content-center text-center">
			<div class="col-4">
				<input type="checkbox" name="agree" id="agree"> 위의 약관의 내용에 동의합니다.
				<p id="agreeInput"></p>
			</div>
			
			
			<div class="form-group">
				<div class="row">
					<div class="col-6">
						<label>이름</label> 
						<input type="text" 
							   class="form-control"
							   placeholder="가입할 이름을 적어주세요."
							   id="name" name="name"> 
						<p id="nameInput"></p>
					</div>
					<div class="col-6">
						<label>이메일</label> 
						<input type="text"
							   class="form-control"
							   placeholder="아이디로 가입할 이메일을 적어주세요."
							   id="emailId" name="email">
					    <p id = "emailInput"></p> 
					    <label>비밀번호</label> 
						<input type="password" 
							   class="form-control"
							   placeholder="가입할 비밀번호를 적어주세요."
							   id="pw" name="pw"> 
						<p id="pwInput1"></p>
						<label>비밀번호 확인</label> 
						<input type="password" 
							   class="form-control"
							   placeholder="비밀번호를 다시 한번 적어주세요."
							   id="pwCheck" > 
						<p id="pwInput2"></p>
					</div>
											
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col-6">
						<label>휴대폰번호</label> 
						<input type="text"
							   class="form-control"
							   placeholder="휴대폰 번호를 적어주세요."
							   id="phoneNum" name="phoneNum">
					    <p id="phoneInput"></p> 
					</div>
					
							
				</div>
			</div>					
			<div class="form-group">
				<div class="row">
					<div class="col-6">
						<%-- name속성값 address1 부터 ~~ address5 까지 입력되어 있는 주소를 모두 합쳐서 DB에 address열에  INSERT 하자. --%>
						<label>주소</label>
						<p id="addressInput"></p> 
						<input type="text" id="sample4_postcode" class="form-control" placeholder="우편번호" name="address1">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="form-control"><br>
						
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="form-control" name="address2">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소" class="form-control" name="address3">
						
						<span id="guide" style="color:#999;display:none"></span>
						
						<input type="text" id="sample4_detailAddress" placeholder="상세주소" class="form-control" name="address4">
						<input type="text" id="sample4_extraAddress" placeholder="참고항목" class="form-control" name="address5">
						
					</div>
				
				</div>
			</div>
			
			<a href="#" onclick="check(); return false;" 
				class="btn btn-common">회원가입</a><br><br>
			
		</div>
		
	</div>
</center>	
</form>

	  <!-- Main JS  -->
    <script type="text/javascript" src="<%=contextPath%>/assets/js/jquery-min.js"></script>      
    <script type="text/javascript" src="<%=contextPath%>/assets/js/bootstrap.min.js"></script>    
    <script type="text/javascript" src="<%=contextPath%>/assets/js/material.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/material-kit.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/jquery.parallax.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/jquery.slicknav.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/main.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/jquery.counterup.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/waypoints.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/jasny-bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/form-validator.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/contact-form-script.js"></script>    
    <script type="text/javascript" src="<%=contextPath%>/assets/js/jquery.themepunch.revolution.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/assets/js/jquery.themepunch.tools.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
		
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
                document.getElementById("sample4_postcode").value = data.zonecode;
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
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
	//약관동의 체크박스 클릭시
	$("#agree").click(function(){
	    if( !($("#agree").is(":checked")) ){ 
  	    		$("#agreeInput").text("약관에 동의해 주세요!").css("color","red");
  	    		
    	}else{
    	$("#agreeInput").text("약관동의 완료!").css("color","blue");
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
	
	//이메일 입력시 
	$("#emailId").focusout(function() {
		var email = $("#emailId");
		
		var emailValue = email.val();
		
		var emailReg = /^\w{3,12}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
		
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

			//약관동의  
	    	var checkbox = $("#agree");
	    	if( !(checkbox.is(":checked")) ){ 
	    		$("#agreeInput").text("약관에 동의해 주세요!").css("color","red");
	    		
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
    		
    		//선호하는 여행지  
	    	var checkbox1 = $("#eu,#asia,#usa,#etc");
	    	if( !(checkbox1.is(":checked")) ){ //== 같은 true값을 반환 한다. if(!$("#agree").prop("checked"))
	    		$("#checkInput").text("선호하는 여행지를 체크해 주세요.").css("color","red");
	    		
	    		return false;

	    	}
	    	
			alert("회원가입이 완료 되었습니다.");
   	    	
   	    	$("form").submit();
				    	
	}	
</script>
    
    
</body>

</html>