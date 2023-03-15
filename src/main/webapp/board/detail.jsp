<%@page import="VO.BoardLikeVO"%>
<%@page import="java.sql.Date"%>
<%@page import="VO.CommunityVO"%>
<%@ page
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

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
		<script>
			
		</script>
	</head>
	<body>
		<%= title %><br>
		<%= writer %><br>
		<%= content %><br>
		<%= writeDate %><br>
		<p>조회수 : <%= views %></p>
		추천 수 : <p id="like"><%= like %></p>
		
		<button id="like_btn">좋아요</button>
		<button id="cancel_like_btn">좋아요 취소</button><br>
		
		<button onclick="javascript:replyBoard(<%= vo.getC_idx() %>)">답글</button>
		
		<br>
		
		<form name="reply">
			<input type="hidden" name="c_idx">
			<input type="hidden" name="nowPage" value="<%=nowPage%>">
			<input type="hidden" name="nowBlock" value="<%=nowBlock%>">
		</form>
		
		<script type="text/javascript">
			function replyBoard(val) {
				document.reply.action = "<%=contextPath%>/com/replyBoard.bo";
				document.reply.c_idx.value = val;
				document.reply.submit();
			}	
		
		var check = "<%= check %>";
			$("#like_btn").on("click", function() {
				if(check == "yes") {
					alert("이미 좋아요를 눌렀습니다.");
				} else {
					$.ajax({
						type: "post",
						async : true,
						url : "<%= contextPath %>/com/like.bo",
						data : { c_idx : ${c_idx}},
						dataType : "text",
						success : function(data) {
							$("#like").text(data);
							check = "yes";
						}
					});
					return;
				}	
			});
			
			$("#cancel_like_btn").on("click", function() {
				if(check == "no") {
					alert("좋아요를 누르지 않았으므로 취소할 수 없습니다.");
				} else {
					$.ajax({
						type: "post",
						async : true,
						url : "<%= contextPath %>/com/likeCancel.bo",
						data : { c_idx : ${c_idx}},
						dataType : "text",
						success : function(data) {
							$("#like").text(data);
							check = "no";
						}
					});
					return;
				}	
			});
		</script>
	</body>
</html>