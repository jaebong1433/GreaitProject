<%@page import="VO.CommunityVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	String nickname = (String)session.getAttribute("m_nickname");
	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>

		function fnSearch(){
			var word = document.getElementById("word").value;
			if(word == null || word == ""){
				alert("검색어를 입력하세요."); 
				document.getElementById("word").focus();
				return false;
			}
			else{
				document.frmSearch.submit();
			}
		}
		
		function fnRead(val){
			document.frmRead.action = "<%=contextPath%>/com/read.bo";
			document.frmRead.c_idx.value = val;
			document.frmRead.submit();
		}

		</script>
		<style>
			.listtext{
				width : 97%;
				height : 1000px;
			}
		</style>
		
		
		
		
		
	</head>
<body>	
<%
int totalRecord = 0; //board테이블에 저장된 글의 총개수 -
int numPerPage = 5; //한 페이지당 조회해서 보여줄 글 개수  -
int pagePerBlock = 4; //한 블럭당 묶여질 페이지 번호 개수 -
 					  //  1  2  3  4 <- 한블럭으로 묶음

int totalPage = 0; //총 페이지수 - 
int totalBlock = 0; // 총 블럭수 -
int nowPage = 0; //현재 사용자에게 보여지고 있는 페이지가 위치한 번호 저장  -
				 //(클릭한 페이지 번호 구하여 저장)
int nowBlock = 0;//클릭한 페이지 번호가 속한~~~~~ 블럭위치번호값 저장 -
int beginPerPage = 0; //각 페이지마다 ~~ 보여지는 시작 글번호(맨위의 글번호)저장 -

//BoardController에서 재요청해서 전달한 request에 담긴 ArrayList배열 꺼내오기 
//조회된 글들 
ArrayList list = (ArrayList)request.getAttribute("list");

//조회된 총 글 개수 
totalRecord = (Integer)request.getAttribute("count");

//현재 페이지 번호를 클릭했다면?
if( request.getAttribute("nowPage") != null){
	nowPage = Integer.parseInt(
								request.getAttribute("nowPage")
								.toString() 
							   );	
}

//각 페이지 번호에 보여지는 글목록의 가장위의 글에대한 글번호 구하기
beginPerPage = nowPage * numPerPage;

totalPage =  (int)Math.ceil( (double)totalRecord / numPerPage );      

//클릭한 페이지번호가 속한 블럭위치번호 구하기
if(request.getAttribute("nowBlock") != null){
	
	//BoardController로 부터 전달 받는다.
	nowBlock = Integer.parseInt(
								request
								.getAttribute("nowBlock")
								.toString()
								);	
}
	
//총 블럭수 구하기 
//총 블럭수  = 총 페이지수  / 한블럭당 묶여질 페이지 개수 
totalBlock = (int)Math.ceil( (double)totalPage / pagePerBlock ); 

%>
<center>
<form name="frmRead">
		<input type="hidden" name="c_idx">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<input type="hidden" name="nowBlock" value="<%=nowBlock%>">
</form>

<table class="listtext">
	<tr height="40"> 
		<td width="46%" style="text-align: left"> 
			&nbsp;&nbsp;&nbsp; <img src="<%=contextPath%>/board/images/board02.gif" width="150" height="30">
		</td>
	</tr>
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
	        		<td colspan="4" style="height: 19px">&nbsp;</td> 
	        	</tr>
	        	<tr>
	        		<button href="javascript:void(0)" onclick="bestPost()">개념글</button>
	        		<button href="javascript:void(0)" onclick="listByLike()">좋아요순</button>
	        		<button href="javascript:void(0)" onclick="listByViews()">조회수순</button>
	        		<button href="javascript:void(0)" onclick="listByRecent()">최신순</button>
	        	</tr>
	        	<tr> 
	        		<td colspan="4">
						<table border="0" width="100%" cellpadding="2" cellspacing="0">
							<tr align="center" bgcolor="#D0D0D0" height="120%">
								<td align="left">번호</td>
								<td align="left">제목</td>
								<td align="left">내용</td>
								<td align="left">작성자</td>
								<td align="left">작성일</td>
								<td align="left">조회수</td>
								<td align="left">추천</td>
							</tr>	
				<%
					//게시판 board테이블에서 조회된 글이 없다면?
					if(list.isEmpty()){
				%>		
							<tr align="center">
								<td colspan="5">등록된 글이 없습니다.</td>
							</tr>
				<%		
					}else{//게시판 board테이블에서 조회된 글들이 있다면?
				
						for(int i=beginPerPage; i<(beginPerPage+numPerPage); i++){
							
							//만약 각페이지마다 보여지는 시작글번호가  게시판의 총글의 개수와 같으면 
							if(i == totalRecord){
								break;
							}
							
								CommunityVO vo = (CommunityVO)list.get(i);
								
								String content = vo.getC_content();
								if(content.length() > 20) {
									content = content.substring(0, 20) + "...";
								}
				%>			
								
							<tr>
								<td align="left"><%=vo.getC_idx()%></td>				
								<td>
								<%
// 								    int level = vo.getB_level();
																		
// 									for(int j=0; j<level*4; j++){
// 										out.print("&nbsp;");
// 									}
								
									int width = 0;  //답변글에 대한 이미지의 들여쓰기 너비값
									
									//글의 들여쓰기정도 level값이 0보다 크다면?답변글
									if(vo.getC_level() > 0){
										
										width = vo.getC_level() * 10;
								%>
									<img src="<%=contextPath%>/board/images/level.gif" width="<%=width%>" height="15">
									<img src="<%=contextPath%>/board/images/re.gif">
								<%	
									}
								%>		
									<%--글제목 나타내는 곳 --%>
									<a href="javascript:fnRead('<%=vo.getC_idx()%>')">
										<%=vo.getC_title()%>
									</a>
								</td>
								<td align="left">
										<%=content%>
								</td>
								<td align="left"><%=vo.getC_nickname()%></td>
								<td align="left"><%=vo.getC_date()%></td>
								<td align="left"><%=vo.getC_views()%></td>
								<td align="left"><%=vo.getC_like()%></td>
							</tr>
					
				<% 
						}//for		
					}
				%>				

						</table>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td colspan="4">&nbsp;</td>
	        	</tr>
	        	<tr>
	        		<td colspan="4">&nbsp;</td>
	        	</tr>
				<tr>

					<form action="<%=contextPath%>/com/searchlist.bo" 
						  method="post" 
						  name="frmSearch" 
						  onsubmit="javascript:fnSearch();">
		            	<td colspan="2">
		            		<div align="right"> 
			            		<select name="key">
			              			<option value="titleContent">제목 + 내용</option>
			              			<option value="name">작성자</option>
			              		</select>
			              	</div>
		              	</td>
			            <td width="26%">
			            	<div align="center"> &nbsp;
			            		<input type="text" name="word" id="word"/>
			            		<input type="submit" value="검색"/>
			            	</div>
			            </td>
		            </form>
			   <%
 					if(nickname == null){//로그인 하지 않았을 경우 
 				%>		
 						<script>
 							alert("로그인 하고 글을 작성하세요!"); 
 							history.back();
 						</script>
 				<%	
 					}
 				%>         
	            	<%-- 새글쓰기 버튼이미지 --%>
		            <td width="38%" style="text-align: left"> 
		             	<input type="image" 
		             		   src="<%=contextPath%>/board/images/write.gif" 
		             		   onclick="location.href='<%=contextPath%>/com/write.bo?nowBlock=<%=nowBlock%>&nowPage=<%=nowPage%>'"/>
		        	</td>
		        </tr>
	       		<tr>
	       			<td colspan="4">&nbsp;</td>
	       		</tr>
			</table>
			</div>
	 	</td>
	</tr>
	<tr align="center"> 
		<td  colspan="3" align="center">
		Go To Page
		<%   
			if(totalRecord != 0){//DB에 글이 있다면?
					
				if(nowBlock > 0){//현재 클릭한 페이지번호가 속한 블럭위치가 0 보다 크다면?
		%>			
					<a href="<%=contextPath%>/com/list.bo?nowBlock=<%=nowBlock-1%>&nowPage=<%=((nowBlock-1) * pagePerBlock)%>">
						◀ 이전<%=pagePerBlock%>개
					</a>
		<%		}//안쪽 if %>
			
				
		<%
				for(int i=0; i<pagePerBlock; i++){
		%>			
					&nbsp;&nbsp;
					<a href="<%=contextPath%>/com/list.bo?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock * pagePerBlock)+i%>">
						<%=(nowBlock * pagePerBlock)+i+1 %>	
						<%if((nowBlock * pagePerBlock)+i+1 == totalPage) break; %>
					</a>
					&nbsp;&nbsp;
		<%			
				}
		%>		
			   
			 
		<%
				if(totalBlock > nowBlock + 1){
		%>			
					
					<a href="<%=contextPath%>/com/list.bo?nowBlock=<%=nowBlock+1%>&nowPage=<%=((nowBlock+1) * pagePerBlock)%>">
						  ▶ 다음 <%=pagePerBlock%>개
					</a>
				
		<%			
				}
		%>	   
			   	
				
				
		<% }//바깥 if %>
		
		
		</td> 
	</tr>
</table>
</center>
</body>
</html>