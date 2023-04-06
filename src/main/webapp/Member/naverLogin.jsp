<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String token = (String)request.getAttribute("token");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	const token = '<%= token %>';
	const jo = JSON.parse(token);
	
	const access_token = jo.access_token;
	const refresh_token = jo.refresh_token;
	const token_type = jo.token_type;
	const expires_in = jo.expires_in;
	
	console.log(access_token, refresh_token, token_type, expires_in);
	
	function login() {
		$.ajax({
			type: "get",
			async: true,
			url: "http://localhost:8090/greaitProject/member1/naverLoginPro.me?token="+access_token,
			data: {},
			dataType: "text",
			success: function(data) {
				const info = JSON.parse(data);
				const uniqueID = info.response.id;
				const name = info.response.name;
				const email = info.response.email;
				$.ajax({
					type: "get",
					async: true,
					url: "http://localhost:8090/greaitProject/member1/naverLoginProReal.me",
					data: { uniqueID : uniqueID,
							name : name,
							email : email
							},
					dataType: "text",
					success: function(data) {
						if(data == "1") {
							location.href="http://localhost:8090/greaitProject/Crawling/maincenter.me";
						} else {
							return;
						}
						
					}
				})
			}
		})
	}
</script>
</head>
<body>
	<%= token %><br><br><br><br>
	<button onclick="javascript:login()">ㄱㄱ</button>
</body>
</html>