<%@page import="VO.VideoCrawlingVO"%>
<%@page import="VO.BoxCrawlingVO"%>
<%@page import="VO.CrawlingVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	
	
%>    
   
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.108.0">
    <title>Center</title>
	<!-- 제이쿼리 사용을 위한 제이쿼리 라이이브러리 연동 -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   
	<script type="text/javascript" src="<%=contextPath%>/eq/js/main.js"></script>

	<style type="text/css">
		.centertb1{
			width: 98%;
			height: 350px;
			text-align: center;
			margin: auto;
		}
		
		
		
		.centertb2{
			width: 98%;
			text-align: center;
			height: 400px;
			margin: auto;
		}
		
		.centertb3{
			width: 98%;
			text-align: center;
			margin-top: 20px;
			height : 400px;
		}
		
		
		
		a{
			text-decoration: none;
			color : black;
		}
		
		hr{
			width: 90%;
			border: 1.5px gray solid;
			
		}
		
		.fonttb{
			font-size: 0.8em;
			text-align: left;
		}
		
		
	
	</style>
  
</head>
<body>
<center>
<!-- 영화 슬라이드 구역 -->
	<div>
	<br>
	<h2>예고편</h2>
	<hr>
	<div>
		<table class="centertb1">
			<tr>
				
						<%
						
						ArrayList list = (ArrayList)request.getAttribute("szmList");
						ArrayList list1 = (ArrayList)request.getAttribute("sldkList");
						ArrayList list2 = (ArrayList)request.getAttribute("dobList");
						ArrayList list3 = (ArrayList)request.getAttribute("abtList");
						ArrayList list4 = (ArrayList)request.getAttribute("obmList");
						ArrayList list5 = (ArrayList)request.getAttribute("gzList");
						ArrayList list6 = (ArrayList)request.getAttribute("tgList");
						ArrayList list7 = (ArrayList)request.getAttribute("htList");
						ArrayList list8 = (ArrayList)request.getAttribute("hsList");
						ArrayList list9 = (ArrayList)request.getAttribute("bzList");
						ArrayList list10 = (ArrayList)request.getAttribute("spList");
						ArrayList list11 = (ArrayList)request.getAttribute("mnList");
						ArrayList list12 = (ArrayList)request.getAttribute("mgdsList");
						ArrayList list13 = (ArrayList)request.getAttribute("skhList");
						ArrayList list14 = (ArrayList)request.getAttribute("kkList");
						
						 VideoCrawlingVO vo = (VideoCrawlingVO)list.get(0);
						 VideoCrawlingVO vo1 = (VideoCrawlingVO)list1.get(0);
						 VideoCrawlingVO vo2 = (VideoCrawlingVO)list2.get(0);
						 VideoCrawlingVO vo3 = (VideoCrawlingVO)list3.get(0);
						 VideoCrawlingVO vo4 = (VideoCrawlingVO)list4.get(0);
						 VideoCrawlingVO vo5 = (VideoCrawlingVO)list5.get(0);
						 VideoCrawlingVO vo6 = (VideoCrawlingVO)list6.get(0);
						 VideoCrawlingVO vo7 = (VideoCrawlingVO)list7.get(0);
						 VideoCrawlingVO vo8 = (VideoCrawlingVO)list8.get(0);
						 VideoCrawlingVO vo9 = (VideoCrawlingVO)list9.get(0);
						 VideoCrawlingVO vo10 = (VideoCrawlingVO)list10.get(0);
						 VideoCrawlingVO vo11 = (VideoCrawlingVO)list11.get(0);
						 VideoCrawlingVO vo12 = (VideoCrawlingVO)list12.get(0);
						 VideoCrawlingVO vo13 = (VideoCrawlingVO)list13.get(0);
						 VideoCrawlingVO vo14 = (VideoCrawlingVO)list14.get(0);
						 
						%>	 
									<!-- 스즈메의 문단속 -->
							 		<div>
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/430418376">
							 		<img src="<%=vo.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/430418376">
											<strong><%=vo.getTitle()%></strong><br>
										</a>
										</tr>
									<div>
							 		<!-- 슬램덩크 -->
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/434380598">
							 		<img src="<%=vo1.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/434380598">
											<strong><%=vo1.getTitle()%></strong><br>
										</a>
										</tr>
										<div>
							 		
							 		<!-- 대외비 -->
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/435809337">
							 		<img src="<%=vo2.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/435809337">
											<strong><%=vo2.getTitle()%></strong><br>
										</a>
										</tr>
										<!-- 아바타 -->
							 		<div>
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/434302255">
							 		<img src="<%=vo3.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/434302255">
											<strong><%=vo3.getTitle()%></strong><br>
										</a>
										</tr>
									<div>	
										<!-- 올빼미 -->
							 		<div>
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/433421583">
							 		<img src="<%=vo4.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/433421583">
											<strong><%=vo4.getTitle()%></strong><br>
										</a>
										</tr>
									<div>
										<!-- 공조 -->
							 		<div>
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/431467085">
							 		<img src="<%=vo5.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/431467085">
											<strong><%=vo5.getTitle()%></strong><br>
										</a>
										</tr>
									<div>
									<!-- 탑건:매버릭 -->
							 		<div>
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/428478645">
							 		<img src="<%=vo6.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/428478645">
											<strong><%=vo6.getTitle()%></strong><br>
										</a>
										</tr>
									<div>
									<!-- 헌트 -->
							 		<div>
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/430689486">
							 		<img src="<%=vo7.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/430689486">
											<strong><%=vo7.getTitle()%></strong><br>
										</a>
										</tr>
									<div>
									<!-- 한산 -->
							 		<div>
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/429211101">
							 		<img src="<%=vo8.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/429211101">
											<strong><%=vo8.getTitle()%></strong><br>
										</a>
										</tr>
									<div>
									<!-- 범죄도시2 -->
							 		<div>
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/428162006">
							 		<img src="<%=vo9.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/428162006">
											<strong><%=vo9.getTitle()%></strong><br>
										</a>
										</tr>
									<div>
									<!-- 스파이더맨:노 웨이 홈 -->
							 		<div>
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/421826092">
							 		<img src="<%=vo10.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/421826092">
											<strong><%=vo10.getTitle()%></strong><br>
										</a>
										</tr>
									<div>
									<!-- 마녀2 -->
							 		<div>
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/429037053">
							 		<img src="<%=vo11.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/429037053">
											<strong><%=vo11.getTitle()%></strong><br>
										</a>
										</tr>
									<div>
									<!-- 모가디슈 -->
							 		<div>
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/421147074">
							 		<img src="<%=vo12.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/421147074">
											<strong><%=vo12.getTitle()%></strong><br>
										</a>
										</tr>
									<div>
									<!-- 싱크홀 -->
							 		<div>
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/420887220">
							 		<img src="<%=vo13.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/420887220">
											<strong><%=vo13.getTitle()%></strong><br>
										</a>
										</tr>
									<div>
									<!-- 귀멸의 칼날 -->
							 		<div>
							 		<a href="https://tv.kakao.com/channel/462787/cliplink/415681475">
							 		<img src="<%=vo14.getImgSrc()%>" alt="" width="140px" /><br>
									</a>
									</div>
									
										<tr>
										<a href="https://tv.kakao.com/channel/462787/cliplink/415681475">
											<strong><%=vo14.getTitle()%></strong><br>
										</a>
										</tr>
									<div>								
				</tr>
				
			</table>
			<br><br>
		</div>
		</div>
		<!-- 영화 슬라이드 구역 끝-->
	</center>
</body>
</html>