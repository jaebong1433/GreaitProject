<%@page import="VO.BoardLikeVO"%>
<%@page import="java.sql.Date"%>
<%@page import="VO.CommunityVO"%>
<%@ page
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	
	CommunityVO vo = (CommunityVO)request.getAttribute("vo");
	String title = vo.getC_title();
	String writer = vo.getC_nickname();
	String content = vo.getC_content();
	Date writeDate = vo.getC_date();
	int views = vo.getC_views();
	int like = vo.getC_like();
	
	String nowPage = (String)request.getAttribute("nowPage");
	String nowBlock = (String)request.getAttribute("nowBlock");
	String c_idx = (String)request.getAttribute("c_idx");
  	String loginNick = (String)session.getAttribute("nickname");
  
	BoardLikeVO boardLikeVO = (BoardLikeVO)request.getAttribute("boardLikeVO");
	String check;
	
	if(boardLikeVO == null) {
		check = "no";
	} else {
		check = "yes";
	}	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
		
		<style type="text/css">
	.boarddiv{
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
		border: 1px solid black;
		text-align: left;
	}
	
		</style>
		
	</head>
	<body>
	<center>
		<div class="boarddiv">
			<div class="titlez">
				<%= title %>
			</div>	
		<table>
		<tr>
			<td width="10%">
				<%= writer %>
			</td>
			<td>
				<%= writeDate %>
			</td>
			
		</tr>
		</table>
		<div class="boardread">
		 좋아요 : <%= like %> &nbsp;&nbsp;&nbsp; 조회수 : <%= views %>
		</div>
		<hr width="100%">	
			<textarea class="textboxz" readonly>
			<%= content %>
			</textarea>
      
			<p id="like">추천 수 : <%= like %></p>
			
			<button id="like_btn">좋아요</button>
			
			<button onclick="javascript:replyBoard(<%= vo.getC_idx() %>)">답글</button>
			
			<form name="reply">
				<input type="hidden" name="c_idx">
				<input type="hidden" name="nowPage" value="<%=nowPage%>">
				<input type="hidden" name="nowBlock" value="<%=nowBlock%>">
			</form>
		
		
		</div>
	</center>
		<script type="text/javascript">
			var check = "<%= check %>"	
			if(check == "yes") {
				$("#like_btn").css({backgroundColor : "red"});
			} else {
				$("#like_btn").css({backgroundColor : "blue"});
			}
			
			
			function replyBoard(val) {
				document.reply.action = "<%=contextPath%>/com/replyBoard.bo";
				document.reply.c_idx.value = val;
				document.reply.submit();
			}
			
			$("#like_btn").on("click", function() {
				if(check == "no") {
					$.ajax({
						type: "post",
						async : true,
						url : "<%= contextPath %>/com/like.bo",
						data : { c_idx : ${c_idx}},
						dataType : "text",
						success : function(data) {
							$("#like").text(data);
						}
					});
					check = "yes";
					$("#like_btn").css({backgroundColor : "red"});
					return;
				} else {
					$.ajax({
						type: "post",
						async : true,
						url : "<%= contextPath %>/com/likeCancel.bo",
						data : { c_idx : ${c_idx}},
						dataType : "text",
						success : function(data) {
							$("#like").text(data);
						}
					});
					check = "no";
					$("#like_btn").css({backgroundColor : "blue"});
					return;
				}
			});
		</script>
	</body>
</html>