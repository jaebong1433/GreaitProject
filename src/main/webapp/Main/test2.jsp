
<%@ page
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
%>	

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
		
		<style type="text/css">
	.boarddiv {
		margin-top: 50px;
		width : 90%;
		height: 1000px;
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
		text-align: left;
		border : none;
	}
	
	.like_btn{
		width: 100px;
		border: none;
		margin: 10px 0;
		background-color: white;
	}
	
	.like_div{
		width: 300px;
		height: 100px;
	}
	
		</style>
		
	</head>
	<body>
	<center>
		<div class="boarddiv">
			<div class="titlez">
				Title
			</div>	
		<table>
		<tr>
			<td width="10%">
				writer
			</td>
			<td>
				writedate
			</td>
			
		</tr>
		</table>
		<div class="boardread">
		 좋아요 : like &nbsp;&nbsp;&nbsp; 조회수 : views
		</div>
		<hr width="100%">	
			<textarea class="textboxz" readonly>
			contect
			</textarea>
      	<div class="like_div">
			<p id="like">추천 수 : like</p>
			
			<button id="like_btn" class="like_btn">
				<img src="<%=contextPath%>/eq/img/good.png" width="100px">
			</button>
			&nbsp;&nbsp;
			<button class="like_btn">
				<img src="<%=contextPath%>/eq/img/ment.png" width="100px">
			</button>
			</div>
			<form name="reply">
				<input type="hidden" name="c_idx">
			</form>
			<!-- 목록버튼 03/20 허상호 -->
			<div align="center">
            	<a href="" id="list">
            		<img src="<%=contextPath%>/board/images/list.gif" border="0"/>
            	</a>
            </div>
		
		</div>
	</center>
		<script type="text/javascript">
		
</script>
</body>
</html>