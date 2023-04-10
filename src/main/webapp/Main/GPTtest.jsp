<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath(); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.runner {
  position: relative;
  width: 200px;
  height: 200px;
}

.runner img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  animation: run 1s steps(8) infinite;
}

@keyframes run {
  from { background-position: 0px; }
  to { background-position: -1600px; }
}
</style>
</head>
<body>
<div class="runner">
  <img src="<%=contextPath %>/eq/img/runner.jpg" alt="Runner">
</div>
</body>
</html>