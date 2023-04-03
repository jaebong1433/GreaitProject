<%@page import="VO.VideoCrawlingVO"%>
<%@page import="VO.BoxCrawlingVO"%>
<%@page import="VO.CrawlingVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();

ArrayList list = (ArrayList) request.getAttribute("videoList");

VideoCrawlingVO vo = null;

String kakao = "https://tv.kakao.com";
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
<!-- 제이쿼리 사용을 위한 제이쿼리 라이이브러리 연동 -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript" src="<%=contextPath%>/eq/js/main.js"></script>
	<link rel="stylesheet" href="<%=contextPath%>/eq/css/myCss.css">

<style type="text/css">
	
	.test{
		text-align: center;
		width : 90%;
	}
	
	.videotab{
		width : 20%;
		height : 250px;
	}
	
	.videoimg{
		height : 170px;
		width : 100%;
		margin : auto;
	}
	
	.videotext{
		height : 80px;
		width : 100%;
	}
	
	.videotext a{
		text-decoration: none;
		color : black;
	}
	
	.realimg{
		width : 230px;
		margin : 20px 0 0 0;
	}
	
	a{
		text-decoration: none;
	}
	
</style>

</head>
<body>
	<center>

		<div>
			<br>
			<img alt="예고편" src="<%=contextPath%>/eq/img/banner/trailerbanner.jpg" width="98%">
			<hr>
				<table class="test">
					<tr>
						<%
							for(int i=0; i<4; i++){
								vo = (VideoCrawlingVO) list.get(i);
						%>
						
						<!-- 스즈메의 문단속 -->
						<td class="videotab">
						<div class="videoimg">
							<a href="<%=kakao %><%=vo.getSrc()%>" target="_blank">
								<img src="<%=vo.getImgSrc()%>" class="realimg"/><br>
							</a>
						</div>
						<div class="videotext">
						<a href="<%=kakao %><%=vo.getSrc()%>" target="_blank">
							<strong><%=vo.getTitle()%></strong><br>
						</a>
						<p><%=vo.getPlayCnt() %></p>
						</div>
						</td>
						<%} %>
					</tr>
					<tr>
						<%
							for(int i=4; i<8; i++){
								vo = (VideoCrawlingVO) list.get(i);
						%>
						
						<!-- 스즈메의 문단속 -->
						<td class="videotab">
						<div class="videoimg">
							<a href="<%=kakao %><%=vo.getSrc()%>" target="_blank">
								<img src="<%=vo.getImgSrc()%>" class="realimg"/><br>
							</a>
						</div>
						<div class="videotext">
						<a href="<%=kakao %><%=vo.getSrc()%>" target="_blank">
							<strong><%=vo.getTitle()%></strong><br>
						</a>
						<p><%=vo.getPlayCnt() %></p>
						</div>
						</td>
						<%} %>
					</tr>
					<tr>
						<%
							for(int i=8; i<12; i++){
								vo = (VideoCrawlingVO) list.get(i);
						%>
						
						<!-- 스즈메의 문단속 -->
						<td class="videotab">
						<div class="videoimg">
							<a href="<%=kakao %><%=vo.getSrc()%>" target="_blank">
								<img src="<%=vo.getImgSrc()%>" class="realimg"/><br>
							</a>
						</div>
						<div class="videotext">
						<a href="<%=kakao %><%=vo.getSrc()%>" target="_blank">
							<strong><%=vo.getTitle()%></strong><br>
						</a>
						<p><%=vo.getPlayCnt() %></p>
						</div>
						</td>
						<%} %>
					</tr>
					<tr>
						<%
							for(int i=12; i<16; i++){
								vo = (VideoCrawlingVO) list.get(i);
						%>
						
						<!-- 스즈메의 문단속 -->
						<td class="videotab">
						<div class="videoimg">
							<a href="<%=kakao %><%=vo.getSrc()%>" target="_blank">
								<img src="<%=vo.getImgSrc()%>" class="realimg"/><br>
							</a>
						</div>
						<div class="videotext">
						<a href="<%=kakao %><%=vo.getSrc()%>" target="_blank">
							<strong><%=vo.getTitle()%></strong><br>
						</a>
						<p><%=vo.getPlayCnt() %></p>
						</div>
						</td>
						<%} %>
					</tr>
					<tr>
						<%
							for(int i=16; i<20; i++){
								vo = (VideoCrawlingVO) list.get(i);
						%>
						
						<!-- 스즈메의 문단속 -->
						<td class="videotab">
						<div class="videoimg">
							<a href="<%=kakao %><%=vo.getSrc()%>" target="_blank">
								<img src="<%=vo.getImgSrc()%>" class="realimg"/><br>
							</a>
						</div>
						<div class="videotext">
						<a href="<%=kakao %><%=vo.getSrc()%>" target="_blank">
							<strong><%=vo.getTitle()%></strong><br>
						</a>
						<p><%=vo.getPlayCnt() %></p>
						</div>
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