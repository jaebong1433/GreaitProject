<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.108.0">
    <title>Carousel Template · Bootstrap v5.3</title>
<!-- 제이쿼리 사용을 위한 제이쿼리 라이이브러리 연동 -->

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
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
										        speed:100, //이동속도(500:0.5초)
										        pager:false, //페이징 표시를 제어(flase:숨김, true:노출)
										        moveSlides:5, //이동슬라이드 수 설정
										        slideWidth:125,//슬라이드폭
										        minSlides:5,//최소 노출 슬라이드 수 
										        maxSlides:5,//최대 노출 슬라이드 수
										        slideMargin:30,//슬라이드 간의 간격 입니다.
										        auto:true,//자동 슬라이드 여부 (true:자동, false:수동)를 설정
										        autoHover:true, //마우스 오버시 자동 정지 시키는 설정
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
	<div id="bestbook_zone">
				
				<div id="best_bg">
					<ul>
						<li>
							<a href="#">
								<img src="<%=contextPath %>/eq/img/bestbook_list_1.png" alt="" />
								<span> <strong>책 제목</strong>책 저자</span>
							</a>
						</li>
						<li>
							<a href="#">
								<img src="<%=contextPath %>/eq/img/bestbook_list_2.png" alt="" /> 
								<span><strong>책 제목</strong>책 저자</span>
							</a>
						</li>
						<li>
							<a href="#">
								<img src="<%=contextPath %>/eq/img/bestbook_list_3.png" alt="" /> 
								<span><strong>책 제목</strong>책 저자</span>
							</a>
						</li>
						<li>
							<a href="#">
								<img src="<%=contextPath %>/eq/img/bestbook_list_4.png" alt="" /> 
								<span><strong>책 제목</strong>책 저자</span>
							</a>
						</li>
						<li>
							<a href="#">
								<img src="<%=contextPath %>/eq/img/bestbook_list_5.png" alt="" /> 
								<span><strong>책 제목</strong>책 저자</span>
							</a>
						</li>
						<li>
							<a href="#">
								<img src="<%=contextPath %>/eq/img/bestbook_list_6.png" alt="" /> 
								<span><strong>책 제목</strong>책 저자</span>
							</a>
						</li>
						<li>
							<a href="#">
								<img src="<%=contextPath %>/eq/img/bestbook_list_7.png" alt="" /> 
								<span><strong>책 제목</strong>책 저자</span>
							</a>
						</li>
						<li>
							<a href="#">
								<img src="<%=contextPath %>/eq/img/bestbook_list_8.png" alt="" /> 
								<span><strong>책 제목</strong>책 저자</span>
							</a>
						</li>
						<li>
							<a href="#">
								<img src="<%=contextPath %>/eq/img/bestbook_list_9.png" alt="" /> 
								<span><strong>책 제목</strong>책 저자</span> 
							</a>
						</li>
						<li>
							<a href="#"> 
								<img src="<%=contextPath %>/eq/img/bestbook_list_10.png" alt="" /> 
								<span><strong>책 제목</strong>책 저자</span>
							</a>
						</li>
					</ul>
					<p class="prev_btn">
						<a href="#"> 
							<img src="<%=contextPath %>/eq/img/bestbook_btn_left.png" alt="이전으로 이동" />
						</a>
					</p>
					<p class="next_btn">
						<a href="#"> 
							<img src="<%=contextPath %>/eq/img/bestbook_btn_right.png" alt="다음으로 이동" />
						</a>
					</p>
				</div>
			</div>
	
	

<!-- bxSlider 플러그인 연동 -->


</body>
</html>