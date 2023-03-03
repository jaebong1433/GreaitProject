<%@page import="VO.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 게시판</title>
	</head>
	<body>

<%
	
	int totalRecord = 0; //board테이블에 저장된 글의 총개수 -
	
	int nowPage = 0; //현재 사용자에게 보여지고 있는 페이지가 위치한 번호 저장  -
	 				 //(클릭한 페이지 번호 구하여 저장)
	int nowBlock = 0;//클릭한 페이지 번호가 속한~~~~~ 블럭위치번호값 저장 -
	
	int beginPerPage = 0; //각 페이지마다 ~~ 보여지는 시작 글번호(맨위의 글번호)저장 -
	
	int numPerPage = 5; //한 페이지당 조회해서 보여줄 글 개수  -
	
	//BoardController에서 재요청해서 전달한 request에 담긴 ArrayList배열 꺼내오기 
	//조회된 글들 
	ArrayList list = (ArrayList)request.getAttribute("list");

	//조회된 총 글 개수 
// 	totalRecord = (Integer)request.getAttribute("count");
%>

<%--글제목 하나를 클릭했을때 BoardController로  글정보 조회 요청하는 <form> 
		클릭한 제목글이 속한 페이지번호 와 페이지번호를 묶은 블럭번호 같이 전달  
	--%>
	<form name="frmRead">
		<input type="hidden" name="b_idx">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<input type="hidden" name="nowBlock" value="<%=nowBlock%>">
	</form>
		<table width="97%" border="0" cellspacing="0" cellpadding="0">
			<h1>공지사항 게시판</h1>
			<tr> 
				<td colspan="3">
					<div align="center">
						<img src="<%=contextPath%>/board/images/line_870.gif" width="870" height="4">
					</div>
				</td>
			</tr>
			<tr> 
				<td colspan="3" valign="top">
					<div align="center"> 
			    	<table width="95%" border="0" cellspacing="0" cellpadding="0">
			        	<tr> 
			        		<td colspan="4">
								<table border="0" width="100%" cellpadding="2" cellspacing="0">
									<tr align="center" bgcolor="#D0D0D0" height="120%">
										<td align="left">번호</td>
										<td align="left">제목</td>
										<td align="left">이름</td>
										<td align="left">날짜</td>
										<td align="left">조회수</td>
									</tr>
<!-- 									<tr align="center"> -->
<!-- 										<td align="left">1</td> -->
<!-- 										<td align="left">aaa</td> -->
<!-- 										<td align="left">김길동</td> -->
<!-- 										<td align="left"> -->
<%-- 											<a href="mailto:<%=vo.getB_email()%>">admin@gmail.com</a> --%>
<!-- 										</td> -->
<!-- 										<td align="left">2023-03-03</td> -->
<!-- 										<td align="left">0</td> -->
<!-- 									</tr> -->
				<%-- <%
					//게시판 board테이블에서 조회된 글이 없다면?
					if(list.isEmpty()){
				%>		
							<tr align="center">
								<td colspan="6">등록된 글이 없습니다.</td>
							</tr>
				<%		
					}else{//게시판 board테이블에서 조회된 글들이 있다면?
				
						for(int i=beginPerPage; i<(beginPerPage+numPerPage); i++){
							
							//만약 각페이지마다 보여지는 시작글번호가  게시판의 총글의 개수와 같으면 
							if(i == totalRecord){
								break;
							}
							
								BoardVO vo = (BoardVO)list.get(i);
								
				%>
							<tr>
								<td align="left"><%=vo.getB_idx()%></td>				
								<td>
								<%
								
									int width = 0;  //답변글에 대한 이미지의 들여쓰기 너비값
									
									//글의 들여쓰기정도 level값이 0보다 크다면?답변글
									if(vo.getB_level() > 0){
										
										width = vo.getB_level() * 10;
								%>
									<img src="../board/images/level.gif" width="<%=width%>" height="15">
									<img src="../board/images/re.gif">
								<%	
									}
								%>		
									글제목 나타내는 곳
									<a href="javascript:fnRead('<%=vo.getB_idx()%>')">
										<%=vo.getB_title()%>
									</a>
								</td>
								<td align="left">
									<a href="mailto:<%=vo.getB_email()%>">
										<%=vo.getB_name()%>
									</a>
								</td>
								<td align="left"><%=vo.getB_date()%></td>
								<td align="left"><%=vo.getB_cnt()%></td>
							</tr>
					
				<% 
						}//for		
					}
				%> --%>
				<%-- 새글쓰기 버튼이미지 --%>
		            <td width="38%" style="text-align: left"> 
		             	<button onclick="location.href='<%=contextPath%>/board1/write.bo?nowBlock=<%=nowBlock%>&nowPage=<%=nowPage%>'">
		             		새글쓰기
		             	</button>
		        	</td>
		        	<tr>
	       				<td colspan="6">&nbsp;</td>
	       			</tr>
								</table>
							 </td>	
						  </tr>
					  </table>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>