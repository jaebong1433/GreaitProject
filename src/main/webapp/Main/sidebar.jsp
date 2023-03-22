<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
%>
	
	
	
<!DOCTYPE html>
	<html class="no-js">
	<head>
	<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Sidebars</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
		<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
		<meta name="author" content="FREEHTML5.CO" />

	 



    
		<link rel="stylesheet" href="<%=contextPath%>/css/style.css">
	
		<link rel="stylesheet" id="theme-switch" href="<%=contextPath%>/css/style.css">
		<link href="<%=contextPath %>/eq/css/bootstrap.min.css" rel="stylesheet">
		<link href="<%=contextPath %>/eq/css/sidebars.css" rel="stylesheet">

	<style>
	
		 .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
	
		.mobject{
			border: 0.5px solid gray;
			width : 220px;
			height: 100%;
			background-color: white;
		}
		
		.logsetf{
			height: 70px;
			text-align: left;
			margin-left: 10px;
		}
		
		.logsetf table{
			text-align: center;
			width: 90%; 
			border: 1px solid black;
			background-color: gray;
		}
		.logsetf td{
			border: 1px solid black;
			width: 50%;
		}
		
		.logsetf a{
			color:white;
		}
		
		
		.logf{
			width : 100%;
			height: 70px;
			text-align: center;
			align: center;
			float: center;
		}
		
		.logf button{
			background-color : #5D5D5D;
			color : white;
			width : 95%;
			height: 40px;
			border-radius: 10px;
			margin-top: 15px;
		}
		
		.sidelogo{
			margin-left: 15px;
		}
		
		ul li{
			list-style: none;
		}
		
		
	</style>
	
</head>
<body>
<div class="mobject">
	<div class="flex-shrink-0 p-3" style="width: 215px;">
    <div class="sidelogo">
    <a href="<%=contextPath%>/Crawling/maincenter.me" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <img src="<%=contextPath%>/eq/img/mm2.png" width="100%">
    </a>
   	</div>
    <ul class="list-unstyled ps-0">
    <!-- 로그인 로그아웃  마이페이지버튼만생성 구현-->
    <%
    
    	String m_nickname = (String)session.getAttribute("m_nickname");
    
    	if(m_nickname == null){
    
    %>
    
    	<div class="logf">
    		<a href="<%=contextPath%>/member1/login.me"><button>로그인</button></a>
    	
    <%
    
    	}else{
    		
    	
    %>	
    	<div class="logsetf">	
    		<b><%=m_nickname%></b>님<br><br>
		<table>	
		<tr>
		<td>
			<a href="<%=contextPath%>/member1/logout.me">logout</a>
    	</td>
    	<td>	
    		<form action="<%=contextPath%>/member1/mypage.me" method="post" class="form">
			
			
				<input type="hidden" name="m_nickname" value="<%=m_nickname%>">
			
			<a href="#" onclick="check(); return false;">
				myPage</a>
			</form>		
			</td>	
		</tr>		
		</table>	
		
    		<%
    		}
    		%>
    		
    		
    	</div>
    <li class="border-top my-3" style="list-style:none;"></li>
      <li class="mb-1" style="list-style:none;">
        <a href="<%=contextPath%>/com/listByRecent.bo?nowPage=0&nowBlock=0"><button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" 
        		data-bs-target="collapse" aria-expanded="false">
          커뮤니티
        </button></a>
      </li>
      <li class="mb-1" style="list-style:none;">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
          박스오피스
        </button>
        <div class="collapse" id="home-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small"><!--3.21 li a 링크 추가 -->
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">2023.03</a></li>
            <li><a href="<%=contextPath%>/BoxCrawling/boxOffice2.me" class="link-dark d-inline-flex text-decoration-none rounded">2023.02</a></li>
            <li><a href="<%=contextPath%>/BoxCrawling/boxOffice1.me" class="link-dark d-inline-flex text-decoration-none rounded">2023.01</a></li>
            <li><a href="<%=contextPath%>/BoxCrawling/boxOffice22.me" class="link-dark d-inline-flex text-decoration-none rounded">2022</a></li>
            <li><a href="<%=contextPath%>/BoxCrawling/boxOffice21.me" class="link-dark d-inline-flex text-decoration-none rounded">2021</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1" style="list-style:none;">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
          예매하기
        </button>
        <div class="collapse" id="dashboard-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="http://www.cgv.co.kr/ticket/" class="link-dark d-inline-flex text-decoration-none rounded">CGV</a></li>
            <li><a href="https://megabox.co.kr/booking" class="link-dark d-inline-flex text-decoration-none rounded">메가박스</a></li>
            <li><a href="https://www.lottecinema.co.kr/NLCHS/Ticketing" class="link-dark d-inline-flex text-decoration-none rounded">롯데시네마</a></li>
          </ul>
        </div>
      </li>
       <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
          영상
        </button>
        <div class="collapse" id="orders-collapse">
          	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            	<li><a href="<%=contextPath%>/videoCrawling/videocenter.me" class="link-dark d-inline-flex text-decoration-none rounded">예고편</a></li>
            	<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">괸련영상</a></li>
         	</ul>
        </div>
      </li>
      <!-- 경로 추가 -->
      <!-- 한성준 -->
      <li class="mb-1" style="list-style:none;">
        <a href="<%=contextPath%>/map/movieMap.mo"><button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="collapse" aria-expanded="false">
          극장 검색
        </button></a>
      </li>
      
    </ul>
  </div>
</div>	
	<!-- Main JS (Do not remove) -->
	<script src="<%=contextPath%>/eq/js/main.js"></script>
    <script src="<%=contextPath%>/eq/js/bootstrap.bundle.min.js"></script>
	<script src="<%=contextPath%>/eq/js/sidebars.js"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    	function check(){
    		$("form").submit();
    	}
    </script>
	
</body>
</html>