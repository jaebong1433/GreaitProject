<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>BOTTOM - GreaIT</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />
	
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

	
	</head>

	<body>
	
		
		<footer id="fh5co-footer">
			<div class="container">
			<hr style="border: solid 1px gray">
				<div class="row row-bottom-padded-md">
					<div class="col-md-3 col-sm-6 col-xs-12 animate-box">
						<div class="fh5co-footer-widget">
							<h3>About Us</h3>
							<ul class="fh5co-links">
								<li><a href="#">견적문의</a></li>
								<li><a href="#">공지사항</a></li>
								<li><a href="#">고객센터</a></li>
								<li><a href="#">쇼핑</a></li>
								<li><a href="#">Team</a></li>
							</ul>
						</div>
					</div>

						<!-- 지도 AIP구현 위치  -->
					<div class="col-md-3 col-sm-6 col-xs-12 animate-box">
						<div class="fh5co-footer-widget">
							<h3>About Us</h3>
							<ul class="fh5co-links">
								<li><a href="#">견적문의</a></li>
								<li><a href="#">공지사항</a></li>
								<li><a href="#">고객센터</a></li>
								<li><a href="#">쇼핑</a></li>
								<li><a href="#">Team</a></li>
							</ul>
						</div>
					</div>


					<div class="col-md-3 col-sm-6 col-xs-12 animate-box">
						<div class="fh5co-footer-widget">
							<h3>Contact Us</h3>
							<p>
								경상남도 양산시 양산역길6-2<br>
								양산역 프라자 2층 202호 GREAIT<br>
								010-1234-5678
							</p>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 animate-box">
						<div class="fh5co-footer-widget">
							<h3>Follow Us</h3>
							<ul class="fh5co-social">
								<li><a href="#"><i class="icon-twitter"></i></a></li>
								<li><a href="#"><i class="icon-facebook"></i></a></li>
								<li><a href="#"><i class="icon-google-plus"></i></a></li>
								<li><a href="#"><i class="icon-instagram"></i></a></li>
								<li><a href="#"><i class="icon-youtube-play"></i></a></li>
							</ul>
						</div>
					</div>

				</div>
				
			</div>
			
		</footer>
	
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
	<script>
		$(function(){
			$('#colour-variations ul').styleSwitcher({
				defaultThemeId: 'theme-switch',
				hasPreview: false,
				cookie: {
		          	expires: 30,
		          	isManagingLoad: true
		      	}
			});	
			$('.option-toggle').click(function() {
				$('#colour-variations').toggleClass('sleep');
			});
		});
	</script>
	<!-- End demo purposes only -->

	<!-- Main JS (Do not remove) -->
	<script src="<%=contextPath%>/js/main.js"></script>

	<!-- 
	INFO:
	jQuery Cookie for Demo Purposes Only. 
	The code below is to toggle the layout to boxed or wide 
	-->
	<script src="<%=contextPath%>/js/jquery.cookie.js"></script>
	<script>
		$(function(){

			if ( $.cookie('layoutCookie') != '' ) {
				$('body').addClass($.cookie('layoutCookie'));
			}

			$('a[data-layout="boxed"]').click(function(event){
				event.preventDefault();
				$.cookie('layoutCookie', 'boxed', { expires: 7, path: '/'});
				$('body').addClass($.cookie('layoutCookie')); // the value is boxed.
			});

			$('a[data-layout="wide"]').click(function(event){
				event.preventDefault();
				$('body').removeClass($.cookie('layoutCookie')); // the value is boxed.
				$.removeCookie('layoutCookie', { path: '/' }); // remove the value of our cookie 'layoutCookie'
			});
		});
	</script>
	

	</body>
</html>

