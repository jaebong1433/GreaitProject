<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); 
	String modCommentIdx = request.getParameter("commentIdx");
	String modContent = request.getParameter("modContent");
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="modCommentIdx" value="<%=modCommentIdx%>">

	<div id="pwCheckDiv" >
			<input type="password" id="comPwCheck" placeholder="비밀번호를 입력하여 주세요.">
			<button onclick="modPwCheck()">확인</button>
			<p id="pwCheckInput"></p>
	</div>
	
	<div id="commentModDiv" style="display:none;">
			<textarea rows="2" cols="30" id="modRsContent"><%=modContent%></textarea>
			<button onclick="modContentPro()">수정</button><br>
			<p id="contentModInput"></p>
	</div>
</body>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		function modContentPro(){
			var modRsContent = $("#modRsContent").val();
			var modCommentIdx = $("#modCommentIdx").val();
			$.ajax({
				type: "post",
				async : true,
				url : "<%= contextPath %>/comment/modContentPro.bo",
				data : {
					modRsContent : modRsContent,
					modCommentIdx : modCommentIdx	
				},
				dataType : "text",
				success : function(data) {
					if(data == "ok"){
						window.opener.location.reload();  
						alert("글 수정 완료!")
						window.close(); 
					}else if(data == "no"){
						$("#contentModInput").text("관리자에게 문의주세요.").css("color","red");
					}
				}
			});
			
		}
	
		function modPwCheck(){
			var modPw = $("#comPwCheck").val();
			var commentIdx = $("#modCommentIdx").val();
			$.ajax({
				type: "post",
				async : true,
				url : "<%= contextPath %>/comment/pwCheck.bo",
				data : {
					modPw : modPw,
					commentIdx : commentIdx	
				},
				dataType : "text",
				success : function(data) {
					if(data == "ok"){
						$("#commentModDiv").css("display","block");
						$("#pwCheckDiv").css("display","none");
					}else if(data == "no"){
						$("#comPwCheck").text("").focus();
						$("#pwCheckInput").text("비밀번호가 일치하지 않습니다.").css("color","red");
					}
				}
			});
		}
	</script>	
	
</html>