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

<style>
	.boarddiv{
		margin-top: 50px;
		width : 90%;
	}
			
	.boarddiv table{
		width : 60%;
		float : left;
	}
	
	.boardread{
		width : 30%;
		float : right;
		text-align: right;
	}
	
	.titlez{
		width : 100%;
		height : 50px;
		text-align : left;
		font-size: 1.5em;
		font-style: bold;
	}
	
	.textboxz{
		margin : 30px 0;
		height : 500px;
		width : 100%;
		border: 1px solid black;
	}
	
	

</style>

</head>
<body>
	<center>
		<div class="boarddiv">
			<div class="titlez">
				글 제목입니다람쥐
			</div>	
		<table>
		<tr>
			<td width="10%">
				작성자
			</td>
			<td>
			2023-03-17
			</td>
			
		</tr>
		</table>
		<div class="boardread">
		 좋아요 : 1 &nbsp;&nbsp;&nbsp; 조회수 : 1
		</div>
		<hr width="100%">	
		<div class="textboxz">
			
		</div>	
		
		
			<p id="like">추천 수 : 1</p>
			
			<button id="like_btn">좋아요</button>
			
			<button>답글</button>
			
			
		
		
		</div>
	</center>
	
	
</body>
</html>