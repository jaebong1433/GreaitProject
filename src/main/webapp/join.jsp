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
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<link rel="stylesheet" href="css/style.css">

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
<div style="background-color: white">
<center>
<br><br>
		<br><br>
	<div class="logBox">
	<br>
	<h1>회원가입</h1>
		<div>
        <div>
            <div class="join_content">
                <!-- 아이디, 비밀번호 입력 -->
                <div class="row_group">
                    <div class="logx">
                        	이메일<br>
							<input type="text"><br>
                    </div><br>

                    <div class="logx">
                    비밀번호<br>
							<input type="password"><br>
                    </div><br>
                    
                    <div class="logx">
                        비밀번호 확인<br>
							<input type="password"><br>
                    </div><br>
                        
                <!-- 이름, 생년월일 입력 -->
                <div class="row_group">

                    <!-- lang = ko_KR -->
                    <div class="join_row">
                        이름<br>
                        <input type="text">
					</div><br>
                    <!-- lang = ko_KR -->

                    <div>
                    생년월일<br>
                        <div>
                            <div>
								<span>
									<input type="text">
								</span>
                            </div>
                            <div>
								<span>
									<select aria-label="월">
										<option value="">월</option>
										  	 			<option value="01">
                                                            1
                                                        </option>
										  	 			<option value="02">
                                                            2
                                                        </option>
										  	 			<option value="03">
                                                            3
                                                        </option>
										  	 			<option value="04">
                                                            4
                                                        </option>
										  	 			<option value="05">
                                                            5
                                                        </option>
										  	 			<option value="06">
                                                            6
                                                        </option>
										  	 			<option value="07">
                                                            7
                                                        </option>
										  	 			<option value="08">
                                                            8
                                                        </option>
										  	 			<option value="09">
                                                            9
                                                        </option>
										  	 			<option value="10">
                                                             10
                                                        </option>
										  	 			<option value="11">
                                                            11
                                                        </option>
										  	 			<option value="12">
                                                            12
                                                        </option>
									</select>
								</span>
                            </div>
                            <div class=" bir_dd">
								<span class="ps_box">
									<input type="text"  placeholder="일" aria-label="일"><br>
								</span>
                            </div>
                        </div>
                    </div>

                    
                    
                </div>

                <!-- 휴대전화 번호, 인증번호 입력 -->
                <div>
                    <br>휴대전화
                    
                    <div>
							<input type="tel" placeholder="전화번호 입력" aria-label="전화번호 입력" maxlength="16" value="010">
						
                        <br>
                    </div>
                    
                </div>

                
                <div><br>
                    <button type="button" >가입하기</button>
                </div>
            </div>
        </div>
    </div>

</div>
	</div>
</center>	
<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="js/main.js"></script>

	
</body>
</html>