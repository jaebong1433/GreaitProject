<%@page import="VO.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	
	//조회한 글정보 얻기
	BoardVO vo = (BoardVO)request.getAttribute("vo");
	String name	 = vo.getB_name();//조회한 글을 작성한 사람
	String email = vo.getB_email();//조회한 글을 작성한 사람의 이메일 
	String title = vo.getB_title();//조회한 글제목
	String content = vo.getB_content().replace("/r/n", "<br>"); //조회한 글내용
	
	String nowPage = (String)request.getAttribute("nowPage");
	String nowBlock = (String)request.getAttribute("nowBlock");
	String b_idx = (String)request.getAttribute("b_idx");
	
	//관리자 아이디로 로그인 하지 않았을 경우 글제목 눌렀을떄 화면 보여 주지 말자!
	String id = (String)session.getAttribute("id");
	
	if(id == null){//로그인 하지 않았을 경우 
%>		
		<script>
			alert("관리자만 글 내용 확인 가능!"); 
			history.back();
		</script>
<%	
	}
%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글 수정 화면</title>
	</head>
	<body>
	
	</body>
</html>