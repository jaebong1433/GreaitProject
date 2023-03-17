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
										        slideWidth:200,//슬라이드폭
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
	<style type="text/css">
		.centertb1{
			width: 98%;
			height: 400px;
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
			margin-bottom: 50px;
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
		
		.fonttb h6{
			margin-top : 10px;
			font-size: 1.3em;
			font-weight: bold;
			color: black;
		}
		
		.hover{
			width: 200px;
			overflow: hidden;
		}
		
		.hover img{
			transition: all 0.1s linear;
		}
		
		.hover:hover img{
			transform: scale(1.1);
		}
		
		
	
	</style>
  
</head>
<body>
<center>
<!-- 영화 슬라이드 구역 -->
	<div>
	<br>
	<h2>HOT & NEW</h2>
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
									<img src="<%=imgSrc%>" alt="" width="300px" />
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
		<!-- 예고편 구역 시작 -->
		<div>
			<h2>예고편</h2>
			<hr>
			<table class="centertb2">
				<tr>
						<%
						ArrayList list2 = (ArrayList)request.getAttribute("mainClipList");
						
						CrawlingVO vo2 = null;
						 String clipTitle; //예고편 제목
					     String clipImg; // 포스터 이미지
					     
					     for (int i = 0; i < 4; i++) {
								
 							 vo2 = (CrawlingVO)list2.get(i);
							 clipTitle = vo2.getClipTitle();
							 clipImg = vo2.getClipImg();
						%>	 				
			
							<td>
								<a href="#">
									<img src="<%=clipImg%>" width="180px" height="100px"><br>
									<span><strong><%=clipTitle%></strong></span>
								</a>	
							</td>
							
					<%	 
						 }
					%>
				</tr>
			</table>
			
		</div><br><br>
			<!-- 예고편 구역 끝 -->
			<!-- 포토 구역 시작 -->
		<div>
			<h2>포토</h2>
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
		
	</center>
</body>
</html>