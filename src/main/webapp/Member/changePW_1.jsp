<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String contextPath = request.getContextPath();
    
    %>
    <style>
    	.findtb{
    		text-align: center;
    		width: 400px;
    		font-size: 1.2em;
    	}
    	
    	.findtb input{
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
	
	
	<a href="<%= contextPath%>/member1/main.me">
	<img src="<%=contextPath%>/eq/img/mm2.png" width="200px"><br>
	</a>
	
		<h2>비밀번호 변경</h2>
		
		<form class="form-signin" action="<%=contextPath%>/member1/changePW3.me" id="findPW" method="post">
		
		<table class="findtb">
			<tr>
				<td>
					아이디
				</td>
				<td>
					<input type="text" id="m_id" name="m_id" placeholder="아이디">
				</td>
			</tr>
			<tr>
				<td>
					이메일
				</td>
				<td>
					<input type="text" id="m_email" name="m_email" placeholder="이메일">
				</td>
			</tr>
			<tr>
				<td>
					이름
				</td>
				<td>
					<input type="text" id="m_name" name="m_name" placeholder="이름">
				</td>
			</tr>
			<tr id="change">
				<td align="right" width="200px">
					변경할 비밀번호
				</td>
				<td align="left" width="200px">
					<input type="password" name="m_pw" id="m_pw" placeholder="변경할 비밀번호를 입력하세요.">
				</td>
				<td align="left" width="200px">
					<p id="pwInput1" style="color: green;">비밀번호는 4자 이상 입력해주세요.</p>
				</td>
				
			</tr>
			<tr id="change2">
				<td align="right" width="200px">
					비밀번호 확인
				</td>
				<td align="left" width="200px">
					<input type="password" name="pwCheck" id="pwCheck" placeholder="변경할 비밀번호를 다시 입력해주세요.">
				</td>
				<td align="left" width="200px">
					<p id="pwInput2" style="color: green;"></p>
				</td>
			</tr>
		</table>
		<input id="auth_btn" type="button" value="사용자 인증" onclick="check(); return false;">
		<input id="change_btn" type="submit" value="비밀번호 변경">
		<input type="button" value="취소" onClick="history.back();">
		</form>
		</a>
		</div>
	</center>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$("#change").hide();
		$("#change2").hide();
		$("#change_btn").hide();
		function check() {
			const m_id = $("#m_id").val();
			const m_name = $("#m_name").val();
			const m_email = $("#m_email").val();
			$.ajax({
				type: "post",
				async: true,
				url: "<%= contextPath %>/member1/changePW2.me",
				data: { m_name : m_name,
						m_id : m_id,
						m_email : m_email
				},
				dataType : "text",
				success : function(data) {
					$("#change").show();
					$("#change2").show();
					$("#auth_btn").hide();
					$("#change_btn").show();
				}
			})
		}
	</script>
</body>
</html>