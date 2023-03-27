<%@page import="VO.CrawlingVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String contextPath = request.getContextPath();
	ArrayList boardList = (ArrayList)request.getAttribute("list");
	int boardCount = (Integer)request.getAttribute("count");
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
		/*  
		주제 : 자동 슬라이드 배너 를 이용한 베스트 Book영역   
			 https://bxslider.com/ 접속하여 사용법 보기 
		*/
		  /* 베스트북 슬라이더 */
		  //$("#best_bg ul")로 베스트BOOK 목록 태그인 <ul>태그를 선택하여
		  //bxSlider()메서드 적용 하고 슬라이드 옵션을 지정 
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
		  //  https://bxslider.com/options/
		  
		  
		  
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
	
  
</head>
<body>
<center>
<!-- 영화 슬라이드 구역 -->
	<div>
	<br>
	<h2><b>박스오피스</b></h2>
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
										<tr><h6>
											<%=title %></h6>
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
			<br><br>
		</div>
		</div>
		<!-- 영화 슬라이드 구역 끝-->
		<!-- 게시판 시작 -->
		<div class="centertb2">
			<h2><b>게시판</b></h2>
			<!-- 0322 정태영 : 게시판 구현 -->
			<p><a href="<%=contextPath%>/com/listByRecent.bo?nowPage=0&nowBlock=0">> 더보기</a></p>
			<hr>
			<table class="comut">
				<tr align="center" bgcolor="#D0D0D0" height="120%">
					<td align="left">번호</td>
					<td align="left">제목</td>
					<td align="left">내용</td>
					<td align="left">작성자</td>
					<td align="left">작성일</td>
					<td align="left">조회수</td>
					<td align="left">추천</td>
				</tr>
				<c:forEach end="4" var="communityVO" items="${ boardList }">
						<tr>
							<td align="left">${ communityVO.c_idx }</td>
							<td align="left">
								<a href="javascript:void(0); fnRead(${communityVO.c_idx});">
									${ communityVO.c_title }
								</a>
							</td>
							<td align="left">
								<a href="javascript:void(0); fnRead(${communityVO.c_idx});">
									${ communityVO.c_content }
								</a>
							</td>
							<td align="left">${ communityVO.c_nickname }</td>
							<td align="left">${ communityVO.c_date }</td>
							<td align="left">${ communityVO.c_views }</td>
							<td align="left">${ communityVO.c_like }</td>
						</tr>
				</c:forEach>
				
			</table>
			<br><br><br>
		</div><br><br><br>
			<!-- 게시판 끝 -->
			<!-- 포토 구역 시작 -->
		<div>
			<h2><b>영화관련영상</b></h2>
			<hr>
			 <table class="centertb3">
				<tr>
					<%
					// 3.16 재봉 수정 불필요한 출력 삭제 및 for문 갯수 축소
						ArrayList list3 = (ArrayList)request.getAttribute("mainPhotoList");
						CrawlingVO vo3 = null;
						String photo; // 포스터 이미지
						
						for (int i = 0; i < 5; i++) {
							
							 vo3 = (CrawlingVO)list3.get(i);
							 photo = vo3.getPhoto();
				     %>			
							<td>
								<img src="<%=photo%>" width="200px" height="150px"><br>
							</td>
						<%	 
						 }
						
						%>
				</tr>
				<tr>
				 		<%
						 for (int i = 5; i < 10; i++) {
						
							 vo3 = (CrawlingVO)list3.get(i);
							 photo = vo3.getPhoto();
						%>	 
							<td>
								<img src="<%=photo%>" width="200px" height="150px"><br>
							</td>
						<%	 
						 }	
						
						%>
				</tr>
			</table> 
			
		</div>
		<div class="maintic">
    		<h2><b>영화예매</b></h2>
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