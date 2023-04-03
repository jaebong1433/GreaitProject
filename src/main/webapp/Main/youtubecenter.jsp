
<%@page import="VO.YoutubeCrawlingVO"%>
<%@page import="VO.VideoCrawlingVO"%>
<%@page import="VO.BoxCrawlingVO"%>
<%@page import="VO.CrawlingVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();

ArrayList list = (ArrayList) request.getAttribute("youtubeList");
// ArrayList list2 = (ArrayList) request.getAttribute("youtubeList2");
// ArrayList list3 = (ArrayList) request.getAttribute("youtubeList3");

YoutubeCrawlingVO vo = null;

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.108.0">
<title>Center</title>

<!-- 글씨체 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Sunflower:wght@300&display=swap" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript" src="<%=contextPath%>/eq/js/main.js"></script>
	<link rel="stylesheet" href="<%=contextPath%>/eq/css/myCss.css">

</head>
<body>
	<center>
		<div class="container">
			<br>
			<img alt="영상" src="<%=contextPath%>/eq/img/banner/videobanner.jpg" width="98%">
			<hr>
				<table class="Genretb">
					<div class="genreT">
						<h2>액션</h2>
					</div>
					<tr><!-- 4.3 for문 숫자 수정  -->
					
						<%
							for(int i=0; i<5; i++){
								vo = (YoutubeCrawlingVO) list.get(i);
								
								String title = vo.getTitle();
								if(title.length() > 25) {
									title = title.substring(0, 25) + "...";
								}
						%>
						
						<td class="genrepic">
						
							<table class="genresmalltb">
							<tr><td height="140px">
							<div class="imgbor">
								<a href="<%=vo.getHref()%>" target="_blank">
									<img src="<%=vo.getImgSrc()%>" class="imgbor" width="200px" height="130px" /><br>
								</a>
							</div>
							</td></tr>
							<tr><td class="genretitle">
							<a href="<%=vo.getHref()%>" target="_blank">
								<%=title%>
							</a>
							</td></tr>
							</table>
						</td>
						<%} %>
					</tr>
				</table>
				<table class="Genretb">
				<div class="genreT">
						<h2>공포</h2>
					</div>
					<tr>
						<%
							for(int i=5; i<10; i++){
								vo = (YoutubeCrawlingVO) list.get(i);
								
								String title = vo.getTitle();
								if(title.length() > 25) {
									title = title.substring(0, 25) + "...";
								}
						%>
						
						<td class="genrepic">
							<table class="genresmalltb">
							<tr><td height="140px">
							<div class="imgbor">
								<a href="<%=vo.getHref()%>" target="_blank">
									<img src="<%=vo.getImgSrc()%>" class="imgbor" width="200px" height="130px" /><br>
								</a>
							</div>
							</td></tr>
							<tr><td class="genretitle">
							<a href="<%=vo.getHref()%>" target="_blank">
								<%=title%>
							</a>
							</td></tr>
							</table>
						</td>
						<%} %>
					</tr>
					</table>
					<table class="Genretb">
					<div class="genreT">
						<h2>판타지</h2>
					</div>
					<tr>
						<%
							for(int i=10; i<15; i++){
								vo = (YoutubeCrawlingVO) list.get(i);
								
								String title = vo.getTitle();
								if(title.length() > 25) {
									title = title.substring(0, 25) + "...";
								}
						%>
						
						<td class="genrepic">
							<table class="genresmalltb">
							<tr><td height="140px">
							<div class="imgbor">
								<a href="<%=vo.getHref()%>" target="_blank">
									<img src="<%=vo.getImgSrc()%>" class="imgbor" width="200px" height="130px" /><br>
								</a>
							</div>
							</td></tr>
							<tr><td class="genretitle">
							<a href="<%=vo.getHref()%>" target="_blank">
								<%=title%>
							</a>
							</td></tr>
							</table>
						</td>
						<%} %>
					</tr>
					</table>
					<table class="Genretb">
					<div class="genreT">
						<h2>로맨스</h2>
					</div>
					<tr>
						<%
							for(int i=15; i<20; i++){
								vo = (YoutubeCrawlingVO) list.get(i);
								
								String title = vo.getTitle();
								if(title.length() > 25) {
									title = title.substring(0, 25) + "...";
								}
						%>
						
						<td class="genrepic">
							<table class="genresmalltb">
							<tr><td height="140px">
							<div class="imgbor">
								<a href="<%=vo.getHref()%>" target="_blank">
									<img src="<%=vo.getImgSrc()%>" class="imgbor" width="200px" height="130px" /><br>
								</a>
							</div>
							</td></tr>
							<tr><td class="genretitle">
							<a href="<%=vo.getHref()%>" target="_blank">
								<%=title%>
							</a>
							</td></tr>
							</table>
						</td>
						<%} %>
					</tr>
					</table>
					<table class="Genretb">
					<div class="genreT">
						<h2>코믹</h2>
					</div>
					<tr>
						<%
							for(int i=20; i<25; i++){
								vo = (YoutubeCrawlingVO) list.get(i);
								
								String title = vo.getTitle();
								if(title.length() > 25) {
									title = title.substring(0, 25) + "...";
								}
						%>
						
						<td class="genrepic">
							<table class="genresmalltb">
							<tr><td height="140px">
							<div class="imgbor">
								<a href="<%=vo.getHref()%>" target="_blank">
									<img src="<%=vo.getImgSrc()%>" class="imgbor" width="200px" height="130px" /><br>
								</a>
							</div>
							</td></tr>
							<tr><td class="genretitle">
							<a href="<%=vo.getHref()%>" target="_blank">
								<%=title%>
							</a>
							</td></tr>
							</table>
						</td>
						<%} %>
					</tr>
					
					
				</table>
				<br>
				<br>
		</div>
		<!-- 영화 슬라이드 구역 끝-->
	</center>
</body>
</html>