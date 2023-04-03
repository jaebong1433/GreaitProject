<%@page import="VO.ClipCrawlingVO"%>
<%@page import="VO.YoutubeCrawlingVO"%>
<%@page import="VO.CrawlingVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String contextPath = request.getContextPath();
	ArrayList boardList = (ArrayList)request.getAttribute("list");
	int boardCount = (Integer)request.getAttribute("count");
	ArrayList list2 = (ArrayList)request.getAttribute("ClipList");//3.30 재봉 추가
	ClipCrawlingVO vo2 = null;
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
	<link rel="stylesheet" href="<%=contextPath%>/eq/css/myCss.css">
 	<link rel="stylesheet" href="<%=contextPath%>/eq/js/jquery.bxslider.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

	<script type="text/javascript" src="<%=contextPath%>/eq/js/main.js"></script>


	<script type="text/javascript">
	$(function(){
		
		  var mySlider=$("#best_bg ul").bxSlider({
										       mode:"horizontal", //수평(horizontal) 방향으로 이동 시키기
										        speed:500, //이동속도(500:0.5초)
										        pager:false, //페이징 표시를 제어(flase:숨김, true:노출)
										        moveSlides:5, //이동슬라이드 수 설정
										        slideWidth:220,//슬라이드폭
										        minSlides:5,//최소 노출 슬라이드 수 
										        maxSlides:5,//최대 노출 슬라이드 수
										        slideMargin:20,//슬라이드 간의 간격 입니다.
										        controls:false// 이전 ,다음 버튼을 숨김(true:노출, false:숨김)
	  										});
		  
		  
		  //< 이전 버튼을 클릭 할때마다 
		  $(".prev_btn").on("click",function(){
			  //goToPrevSlide()를 이용하여 슬라이드를 한단계 이전으로 이동 되게 하기 
			  mySlider.goToPrevSlide();
			  //<a>링크 차단
			  return false;
		  });
	
		  //> 다음 버튼을 클릭 할때마다
		  $(".next_btn").on("click",function(){
			  //goToNextSlide()를 이용하여 슬라이드를 한단계 다음으로 이동 되게 하기
			  mySlider.goToNextSlide();
			  return false;
			});
		  //-----------------------------------------------------------
	});
</script>
	<!-- 글씨체 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Sunflower:wght@300&display=swap" rel="stylesheet">

	
	<style>
		h4 {
			font-family: 'Black Han Sans', sans-serif;
		}
		
		.board1{
			float: left;
			width : 49%;
			border-right : 1px solid black;
			height : 250px;
			margin-bottom: 50px;
		}
		
		.board2{
			float: right;
			width : 49%;
			border-left : 1px solid black;
			height : 250px;
			margin-bottom: 80px;
		}
	
		h2{
			text-align: left;
			margin-left: 10%;
			font-family: 'Do Hyeon', sans-serif;
		}
	</style>
  
</head>
<body>
<center>
<!-- 영화 슬라이드 구역 -->
	<div>
	<br>
	<img alt="박스오피스" src="<%=contextPath%>/eq/img/banner/boxofficebanner.jpg" width="98%">
	<hr>
	<div>
		<table class="centertb1">
			<tr>
				<td width="30px">
				<p class="prev_btn">
						<a href="#"> 
							<img src="<%=contextPath %>/eq/img/leftgo.png" alt="이전으로 이동" width="30px"/>
						</a>
					</p>
				</td>
				<td>	
				<div id="best_bg">
					<ul>
						<!-- 3.16 재봉 수정 -->
						<%
						
						ArrayList list = (ArrayList)request.getAttribute("mainList");
						
						 CrawlingVO vo = null;
						 String age;
						 String imgSrc; 
						 String title; 
						 String dScore; 
						 String dNum; 
						 String dDate;
						 for (int i = 0; i < 10; i++) {
						
							 vo= (CrawlingVO)list.get(i);
							 age = vo.getAge();
							 imgSrc = vo.getImgSrc();
							 title = vo.getTitle();
							 dScore = vo.getdScore();
							 dNum = vo.getdNum();
							 dDate = vo.getdDate();
						%>	 
							  <li>
								<a href="#">
								<div class="hover">
									<img src="<%=imgSrc%>" alt="" width="280px" />
								</div>	
									<span>
									<div class="fonttb">
									<table>
										<tr><h4>
											<%=title %></h4>
										</tr>
										<tr>	
											<%=age%><br>
										</tr>
										<tr>
										<td>
										<img src="<%=contextPath%>/eq/img/SP.png">
										</td>
										<td><b><%=dScore%></b><br>
										</td>
										</tr>
										<tr>	
											예매율:<%=dNum%><br>
										</tr>
										<tr>
											개봉일:<%=dDate%>
										</tr>
									</table>
									</div>
									</span>
								</a>
							</li>
						<%	 
						 }
						
						%>
					</ul>
					</td>
					<td width="30px">
					<p class="next_btn">
						<a href="#"> 
							<img src="<%=contextPath %>/eq/img/rightgo.png" alt="다음으로 이동" width="30px"/>
						</a>
					</p>
					</td>
					
				</div>
				</tr>
			</table>
			
		</div>
		</div>
		<!-- 영화 슬라이드 구역 끝-->
		<!-- 게시판 시작 -->
		<div class="centertb2">
			<img alt="게시판" src="<%=contextPath%>/eq/img/banner/boardbanner.jpg" width="98%">
			<!-- 0322 정태영 : 게시판 구현 -->
			<hr>
			
			<p><a href="<%=contextPath%>/com/listByRecent.bo?nowPage=0&nowBlock=0">> 더보기</a></p>
			<div class="board1">
			<h2>개념글</h2>
				<table width="90%">
					<tr bgcolor="pink" height="16%">
						<td width="70%" align="left">제목</td>
						<td width="20%">작성자</td>
						<td width="10%">추천</td>
					</tr>
				<c:forEach end="4" var="communityVO" items="${ boardList }">
						<tr>
							<td align="left">
								<a href="javascript:void(0); fnRead(${communityVO.c_idx});">
									${ communityVO.c_title }
								</a>
							</td>
							<td>${ communityVO.c_nickname }</td>
							<td>${ communityVO.c_like }</td>
						</tr>
				</c:forEach>
				
			</table>
			</div>
			<div class="board2">
			<h2>자유게시판</h2>
				<table width="90%">
					<tr bgcolor="pink" height="16%">
						<td width="70%" align="left">제목</td>
						<td width="20%">작성자</td>
						<td width="10%">추천</td>
					</tr>
				<c:forEach end="4" var="communityVO" items="${ boardList }">
						<tr>
							<td align="left">
								<a href="javascript:void(0); fnRead(${communityVO.c_idx});">
									${ communityVO.c_title }
								</a>
							</td>
							<td>${ communityVO.c_nickname }</td>
							<td>${ communityVO.c_like }</td>
						</tr>
				</c:forEach>
				
			</table>
			</div>
			
		</div>
			<!-- 게시판 끝 -->
			<!-- 포토 구역 시작 -->
	<div class="centertb3">
	<img alt="핫 클립" src="<%=contextPath%>/eq/img/banner/hotclipbanner.jpg" width="98%">
			<hr>
			 <table class="centertb3">
			 			<tr>
						<%				
								vo2 = (ClipCrawlingVO)list2.get(0);
								String ptext = vo2.getpText();
								if(ptext.length() > 60) {
									ptext = ptext.substring(0, 60) + "...";
								}
								//iframe 자동재생 방지 추가 4.3
								String iframe = vo2.getIframeSrc();
								if(iframe.length() > 77) {
									iframe = iframe.substring(0, 77);
								}
						%>
						
							<td>
							<div>
							 <iframe src="<%=iframe%>" width="700px" height="400px" ></iframe>
							</div>
							<h4><b><%=vo2.getStrongText()%></b></h4>
 							<p><%=ptext%></p>
							</td>
						</tr>
						
			</table> 
			
		</div>
		<br>
		<div class="maintic">
			<img alt="예매" src="<%=contextPath%>/eq/img/banner/ticketbanner.jpg" width="98%">
    		<hr>
    		<table>
    			<tr>
    				<td><a href="http://www.cgv.co.kr/ticket/"  target="_blank">
    				<button class="ticbt1">
    					<img src="<%=contextPath%>/eq/img/cgv.png" width="90%">
    				</button>
    				</a></td>
    				<td><a href="https://megabox.co.kr/booking" target="_blank">
    				<button class="ticbt2">
    					<img src="<%=contextPath%>/eq/img/megabox.png" width="90%">
    				</button>
    				</a></td>
    				<td><a href="https://www.lottecinema.co.kr/NLCHS/Ticketing" target="_blank">
    				<button class="ticbt3">
    					<img src="<%=contextPath%>/eq/img/lotte.png" width="90%">
    				</button>
    				</a></td>
    			</tr>
    		</table>
		<br><br><br>
    	</div>
			
		
	</center>
	<form name="frmRead">
		<input type="hidden" name="c_idx">
		<input type="hidden" name="nowPage" value="0">
		<input type="hidden" name="nowBlock" value="0">
	</form>
<script>
function fnRead(val){
	document.frmRead.action = "<%=contextPath%>/com/read.bo";
	document.frmRead.c_idx.value = val;
	document.frmRead.submit();
}
</script>	
</body>
</html>