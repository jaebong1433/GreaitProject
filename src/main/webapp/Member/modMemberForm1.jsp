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
<style type="text/css">
			.mpdiv{
				width : 98%;
				margin : 100px 0 0 0;
			}
			
			.mpdiv input{
				margin : 5px 0 0 20px;
				height : 20px;
				width : 150px;
			}
			
			.mptb{
				border : 1px solid black;
				width : 60%;
				height : 400px;
				float : right;
				margin : 20px 100px 0px 0px;
			}
			
			.mptb td{
				border : 1px solid gray;
				height : 19%;
			}
			
			.mptb button{
				background-color: gray;
				color: white;
				margin-left: 10px;
				width: 80px;
				height: 30px;
				border-radius: 10px;
			}
			
			.profiletb{
				width : 20%;
				height : 400px;
				float : left;
				border : 3px solid gray;
				margin : 20px 0px 0px 100px;
				text-align: center;
			}
			
			
			.profimg {
			    width: 200px;
			    height: 200px; 
			    border-radius: 70%;
			    overflow: hidden;
			    margin: auto;
			}
			.profimg img{
			    width: 100%;
			    height: 100%;
			    object-fit: cover;
			}
			
			.btnbtn{
				margin : auto;
				width : 500px;
				height : 500px;
			}
			
			.btnbtn input{
				margin-top: 10px;
				width : 150px;
				height: 40px;
				background-color: gray;
				color : white;
				border-radius : 10px;
			}
			
			
		</style>

</head>
<body>
<center>
		<div class="mpdiv">
			<h1>회원 정보 수정</h1>
			<hr>
			<table class="mptb">
			<tr>
				<td width="10%">이름</td>
				<td width="40%">
				<input type="text" id="m_name" name="m_name"
					value="<%=vo.getM_name()%>" readonly>
				<p id="nameInput"></p>
				</td>
				
			<tr>
				<td>ID</td>
				<td>
					<input type="text" id="m_id" name="m_id"
						value="<%=vo.getM_id()%>" >
					<p id="idInput"></p>
					<button type="button" onclick="updateID(); return false;">수정하기</button>
				</td>
			</tr>	
				
			<tr>
				<td>닉네임</td>
				<td>
					<input type="text" id="m_nickname" name="m_nickname"
						value="<%=vo.getM_nickname()%>">
					<p id="nicknameInput"></p>
					<button type="button" onclick="updateNickname(); return false;">수정하기</button>
				</td>
			</tr>
		 
		 	<tr>	
				<td>Email</td>
				<td>
					<input type="text" id="m_email" name="m_email"
						value="<%=vo.getM_email()%>">
					<p id="emailInput"></p>
					<button type="button" onclick="updateEmail(); return false;">수정하기</button>
				</td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="passWord" id="m_pw" name="m_pw"
						placeholder="비밀번호를 입력하세요.">
					<p id="pwInput1"></p>
					<button type="button" onclick="updatePWD(); return false;">수정하기</button>
				</td>
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
							<b><%=vo.getM_nickname()%></b>님
						</td>
					</tr>
				</table>
			
		 
		

		<div class="btnbtn">
			<a href="#" onclick="check(); return false;">
				<input type="button" value="수정완료">
			</a>
		</div>
	</div>
</center>

  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>	    
    <script type="text/javascript">
    function updateID() {
    	var m_id = $("#m_id");
     	var m_idValue = m_id.val();
    	var m_idReg = RegExp(/^[a-z0-9]{4,12}$/);
 	  	var resultM_id = m_idReg.test(m_idValue);
    	
 	  	if(resultM_id == true) {
 	  		$.ajax(
                 {
                 type:"post", 
                  async:true, 
                   url:"<%=contextPath%>/member1/joinNicknameCheck.me",
                  data:{ m_nickname : m_nicknameValue },//서버페이지로 요청할 데이터설정
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
              
           );
 	  	}
    }
    
    function updateNickname() {
    	var m_nickname = $("#m_nickname");
     	var m_nicknameValue = m_nickname.val();
    	var m_nicknameReg = RegExp(/^[가-힣a-zA-Z0-9]{2,20}$/);
 	  	var resultM_nickname = m_nicknameReg.test(m_nicknameValue);
    	
 	  	if(resultM_nickname == true) {
 	  		alert("닉네임 변경 가능");
 	  	}
    }
    
    function updateEmail() {
    	alert("이메일");
    }
    
    function updatePWD() {
    	alert("비밀번호");
    }
    
 
//  //닉네임 입력시 유효성검사
//     $("#m_nickname").focusout(function(){
    	
//     	var m_nickname = $("#m_nickname");
        
//         var m_nicknameValue = m_nickname.val();
                              
//         var m_nicknameReg = RegExp(/^[가-힣a-zA-Z0-9]{2,20}$/);
        
//         var resultM_nickname = m_nicknameReg.test(m_nicknameValue);
  
//         if(resultM_nickname == true){
            
//             $.ajax(
//                   {
//                   type:"post", 
//                    async:true, 
<%--                    url:"<%=contextPath%>/member1/joinNicknameCheck.me", --%>
//                    data:{ m_nickname : m_nicknameValue },//서버페이지로 요청할 데이터설정
//                    dataType:"text",
//                    success : function(data) {
//                      console.log(data);
                     
//                      if (data == 'usable') {//닉네임이 DB에 없으면?(중복아님)
                        
//                         $("#nicknameInput").text("사용할수 있는 닉네임 입니다.").css("color","blue");
                        
//                      }else {//닉네임이 DB에 있으면? (입력한 닉네임이  DB에 저장되어 있다는 의미)
                        
//                         $("#nicknameInput").text("사용할수 없는 닉네임 입니다.").css("color","red");
                        
//                      }   
//                   },//success 닫기
                  
//                   error:function(){
//                      alert("통신에러가 발생했습니다.");
//                   }
                  
//                }// json  {  } 닫기      
               
//             );// $.ajax메소드 호출 부분 끝부분
            
//          }else{
//             $("#nicknameInput").text("닉네임 형식이 올바르지 않습니다!").css("color","red");
//          }

//       });
    	
   
    	
    	
    	
    	
    
    
 
 
 
 
//     $("#button2").click(function(){
        
//     	$("#m_email").prop("readonly", false).focus();
   
//     });
	
    
//     $("#m_email").focusout(function() {
//         var m_email = $("#m_email");
        
//         var m_emailValue = m_email.val();
        
//         var m_emailReg = /^\w{3,12}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
        
//         var resultM_email = m_emailReg.test(m_emailValue);
        
//         if(resultM_email == true){      
               
//                $.ajax( 
//                      {
//                         type:"post", 
//                         async:true, 
<%--                         url:"<%=contextPath%>/member1/joinEmailCheck.me", //요청할 주소 --%>
//                         data:{ m_email : m_emailValue },//서버페이지로 요청할 데이터 설정!
//                         dataType:"text", 
//                         success : function(data){
//                            console.log(data);
                           
//                            if(data == 'usable'){ //아이디가 DB에 없으면?(중복아님)
                              
//                               $("#emailInput").text("사용할수 있는 email입니다.").css("color","blue");
                                    
//                            }else{//아이디가 DB에 있으면? (입력한 아이디가  DB에 저장되어 있다는 의미)
                              
//                               $("#emailInput").text("사용할수 없는 email입니다.").css("color","red");

//                            }
//                         },//success 닫기

                        
//                         error:function(){
//                            alert("통신에러가 발생했습니다.");
//                         }
                        
                        
//                      }// json  {  } 닫기
            
//                     ); // $.ajax메소드 호출 부분 끝부분  
               
//             }else{
//                $("#emailInput").text("이메일 형식이 올바르지 않습니다!").css("color","red");
//             }

//      });
    
    
    
    
    
    
    
//     $("#button3").click(function(){
        
//     	$("#m_pw").prop("readonly", false).focus();
   
//     });
    
//     $("#m_pw").focusout(function(){
// 		if($("#m_pw").val().length < 4 ){
   		
// 			$("#pwInput1").text("한글,특수문자 없이 4글자 이상으로 작성해 주세요!").css("color","red");
   		
// 		}else{
   			
// 			$("#pwInput1").text("올바르게 입력되었습니다.").css("color","blue");
   		
// 		}
	
//     });
    
    
    
//     function check(event) {

//         //닉네임
//         var m_nickname = $("#m_nickname");
        
//         var m_nicknameValue = m_nickname.val();
        
//         var m_nicknameReg = RegExp(/^[가-힣a-zA-Z0-9]{2,20}$/);
        
//         var resultM_nickname = m_nicknameReg.test(m_nicknameValue);
        
//         if(!resultM_nickname){
//            $("#nicknameInput").text("닉네임 형식이 올바르지 않습니다.").css("color","red");
//            m_nickname.focus();
           
//            return false;
//         }else{
//            $("#nicknameInput").text("올바르게 입력되었습니다.").css("color","blue");
//         }


//         //이메일
//         var m_email = $("#m_email");
         
//          var m_emailValue = m_email.val();
         
//          var m_emailReg = /^\w{3,12}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
         
//          var resultM_email = m_emailReg.test(m_emailValue);
         
//          if(!resultM_email){
//             $("#emailInput").text("이메일 형식이 올바르지 않습니다.").css("color","red");
            
//             m_email.focus();
            
//             return false;
//          }else{
//             $("#emailInput").text("올바르게 입력되었습니다.").css("color","blue");
//          }
            
		
// 		//비밀번호
//     	var pass1 = $("#m_pw");
// 	    	var passValue1 = pass1.val();
	    	
// 	    	var passReg1 = RegExp(/^[A-Za-z0-9_\-]{4,20}$/);
// 	    	var resultPass1 = passReg1.test(passValue1);

// 		if(!resultPass1){
// 			$("#pwInput1").text("한글,특수문자 없이 4글자 이상으로 작성해 주세요!").css("color","red");
// 			pass1.focus();
			
// 			return false;
// 		}else{
// 			$("#pwInput1").text("올바르게 입력되었습니다.").css("color","blue");
// 		}
		
		
// 			return false;
// 		} else{
// 			$("#phoneInput").text("올바르게 입력되었습니다.").css("color","blue");
// 		}
		
		
		

		
// 		$("form").submit();
			    	
// 		}	
        
        
        
        
        
        
</script>	



</body>
</html>