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
		<title>회원정보수정 - GreaIT</title>
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
	
	button{
		width: 200px;
	}
		
	</style>
</head>
<body>
<form action="<%=contextPath%>/member1/joinPro.me" class="form">
<div style="background-color: white">
<center>
<br>
	<div class="logBox">
	
	<br>
	<h1>회원정보수정</h1>
		<div>
        <div>
            <div class="join_content">
                <!-- 아이디, 비밀번호 입력 -->
                <div class="row_group">
                    <div class="logx">
                        	이메일<br>
							<input type="text" placeholder="아이디로 가입할 이메일을 적어주세요."
							   id="emailId" name="email">
					    <p id = "emailInput"></p>
                    </div>

                    <div class="logx">
                    비밀번호<br>
							<input type="password" placeholder="가입할 비밀번호를 적어주세요."
							   id="pw" name="pw"> 
						<p id="pwInput1"></p>
                    </div>
                    
                    <div class="logx">
                        비밀번호 확인<br>
							<input type="password" placeholder="비밀번호를 다시 한번 적어주세요."
							   id="pwCheck" > 
						<p id="pwInput2"></p>
                    </div>
                        
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
                    휴대전화
                    
                    <div>
							<input type="tel" placeholder="전화번호 입력" aria-label="전화번호 입력" maxlength="16" value="010" id="phoneNum" name="phoneNum">
					    <p id="phoneInput"></p>
						
                    </div>
                    
                </div>
                
					<div colspan="4">
						<%-- name속성값 address1 부터 ~~ address5 까지 입력되어 있는 주소를 모두 합쳐서 DB에 address열에  INSERT 하자. --%>
						주소
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
                    <button>회원수정</button>
                    <button>회원탈퇴</button>
                </div>
            </div>
        </div>
    </div>

</div>
	</div>
</center>
</body>
</html>>