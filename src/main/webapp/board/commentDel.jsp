<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath(); 
	String delCommentIdx = request.getParameter("commentIdx");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="pwCheckDiv" >
			<input type="password" id="comPwCheck" placeholder="비밀번호를 입력하여 주세요.">
			<button onclick="delPwCheck()">삭제</button>
			<input type="hidden" id="delCommentIdx" value="<%=delCommentIdx%>">
			<p id="pwCheckInput"></p>
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
		function delPwCheck(){
			var delPw = $("#comPwCheck").val();
			var commentIdx = $("#delCommentIdx").val();
			$.ajax({
				type: "post",
				async : true,	
				url : "<%= contextPath %>/comment/delCommentPro.bo",
				data : {
					delPw : delPw,
					commentIdx : commentIdx	
				},
				dataType : "text",
				success : function(data) {
					if(data == "ok"){
						window.opener.location.reload();  
						alert("글 삭제 완료!")
						window.close(); 
					}else if(data == "no"){
						$("#comPwCheck").text("").focus();
						$("#pwCheckInput").text("비밀번호가 일치하지 않습니다.").css("color","red");
					}
				}
			});
		}
</script>
</html>