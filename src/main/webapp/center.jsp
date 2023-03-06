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
		<title>Center - GreaIT</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
		<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
		<meta name="author" content="FREEHTML5.CO" />

	 

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="<%=contextPath%>/images/Giticon.png">

	

	<link rel="stylesheet" href="<%=contextPath%>/css/style.css">

	<link rel="stylesheet" id="theme-switch" href="<%=contextPath%>/css/style.css">
	
	
	
        <!-- jQuery -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	

	
	<style>
		
		
		
	</style>
</head>
<body>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

  	<script>
    	$(document).ready(function(){
      		$('.slider').bxSlider();
    	});
  	</script>


	<center>
	<div>
	<br><br><br><br>
		<div class="slider">
	    	<div>
	    		<img src="<%=contextPath%>/images/full_image_1.jpg" width="1000px" height="500px">
	    	</div>
	    	<div>
	    		<img src="<%=contextPath%>/images/full_image_2.jpg" width="1000px" height="500px">
			</div>
	  	</div>
	</div>
	</center>        
        
</body>
</html>