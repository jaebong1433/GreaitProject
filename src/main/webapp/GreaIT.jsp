<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>    
<%
	String contextPath = request.getContextPath();
%>  
<script src="http://code.jquery.com/jquery-latest.min.js"></script>



<%-- 센터 중앙 화면 공간은  상위 메뉴를 클릭할떄 마다 계속 변화되어 나타나야 하기 떄문에
	 request내장객체 영역으로 부터 중앙 화면 공간의 View주소를 얻어와 변수에 저장 해야 합니다.
 --%>
<c:set var="center"  value="${requestScope.center}"  />   
    
<c:out value="${center}"/>    
   
<%-- 처음으로  CarMain.jsp 메인화면을 요청 했을때... 중앙화면은 Center.jsp로 보이게 설정하자 --%>   
<c:if test="${center == null}">
	<c:set var="center" value="center.jsp"/>
</c:if>   
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GreaIT</title>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="<%=contextPath%>/images/Giticon.png">

	

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,600,400italic,700' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="<%=contextPath%>/css/animate.css">
	<!-- Flexslider -->
	<link rel="stylesheet" href="<%=contextPath%>/css/flexslider.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="<%=contextPath%>/css/icomoon.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="<%=contextPath%>/css/magnific-popup.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="<%=contextPath%>/css/bootstrap.css">

	<link rel="stylesheet" href="<%=contextPath%>/css/style.css">
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

	<!-- For demo purposes only styleswitcher ( You may delete this anytime ) -->
	<script src="<%=contextPath%>/js/jquery.style.switcher.js"></script>
	
	
	
</head>
<body>
	<center>
		<table width="100%" height="100%">
			<tr align="left">
				<td height="20%"><jsp:include page="top.jsp"/></td>	
			</tr>
			<tr>
				<td height="55%"><jsp:include page="${center}"/></td>
			</tr>
			<tr>
				<td height="25%"><jsp:include page="bottom.jsp"/> </td>
			</tr>					
		</table>
	</center>
	
</body>
</html>