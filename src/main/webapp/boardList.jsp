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
										<td align="left">다운로드 횟수</td>
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