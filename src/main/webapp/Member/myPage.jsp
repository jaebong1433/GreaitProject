<%@page import="VO.MemberVO"%>
<%@ page
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	
	String m_nickname = (String)session.getAttribute("m_nickname");
	MemberVO vo = (MemberVO)request.getAttribute("vo");
%>	

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="<%=contextPath%>/eq/css/myCss.css">
		<style type="text/css">
			.mpdiv{
				width : 98%;
				margin : 30px 0 0 0;
			}
			
			.mptb{
				border : 1px solid black;
				width : 60%;
				height : 300px;
				float : right;
				margin : 20px 100px 0px 0px;
			}
			
			.mptb td{
				border : 1px solid gray;
				
			}
			
			.mptb button{
				background-color: gray;
				color: white;
				margin-left: 10px;
				width: 80px;
				height: 30px;
				border-radius: 10px;
			}
			
			.profiletb{
				width : 20%;
				height : 300px;
				float : left;
				border : 3px solid gray;
				margin : 20px 0px 0px 100px;
				text-align: center;
			}
			
			
			.profimg {
			    width: 200px;
			    height: 200px; 
			    border-radius: 70%;
			    overflow: hidden;
			    margin: auto;
			}
			.profimg img{
			    width: 100%;
			    height: 100%;
			    object-fit: cover;
			}
			
			.btnbtn{
				margin : auto;
				width : 200px;
				height : 500px;
			}
			
			.btnbtn input{
				margin-top: 10px;
				width : 150px;
				height: 40px;
				background-color: gray;
				color : white;
				border-radius : 10px;
			}
			
			
		</style>
		
	</head>
	<body>
	
	<form action="<%=contextPath%>/member1/mypageUpdate.me" class="form" method="post">
	
		<center>
			<div class="mpdiv">
				<img alt="마이페이지" src="<%=contextPath%>/eq/img/banner/mypagebanner.jpg" width="98%">

				<hr>
				<table class="mptb">
					<tr>
						<td width="10%">닉네임</td>
						<td width="40%"><%=vo.getM_nickname()%></td>
						<input type="hidden" name="m_nickname" value="<%=vo.getM_nickname()%>">
					
					</tr>
					<tr>	
						<td>이름</td>
						<td><%=vo.getM_name()%></td>
					</tr>
					<tr>
						<td>ID</td>
						<td><%=vo.getM_id() %></td>
					</tr>
					<tr>	
						<td>Email</td>
						<td><%=vo.getM_email()%></td>
					</tr>
					<tr>
						<td>가입일자</td>
						<td><%=vo.getM_date() %></td>
					</tr>
					<tr>
						<td>
							<img width="40%" alt="등급이미지" src="<%= contextPath %>/Member/images/<%= vo.getM_gradeimage() %>">
							<p id="level">LV.${ vo.m_level }</p></td>
						
						<c:set var="exp" value="${ vo.m_exp - (vo.m_level - 1) * 100 }" />
						<c:set var="exp_space" value="${ 100 - exp }" />
						
						<c:if test="${ exp < 0 }">
							<c:set var="exp" value="${ 0 }" />
						</c:if>
						<c:if test="${ exp_space < 0 }">
							<c:set var="exp_space" value="${ 0 }" />
						</c:if>
						<td>
							<p id="exp">경험치 : ${ exp } / 100	<input type="button" value="레벨업" onClick="levelUp('<%= vo.getM_nickname() %>', '<%= vo.getM_exp() %>'); return false;">
							 </p>
							<div>
								<table>
									<tr>
										<c:set var="loop" value="false"/>
										<c:forEach var="i" begin="1" end="${ exp }">
											<c:if test="${ !loop }">
												<td width="4px" bgcolor="yellow"><p></p></td>
												<c:if test="${ i > 100 }">
													<c:set var="loop" value="true"/>
												</c:if>
											</c:if>
										</c:forEach>
										<c:set var="loop" value="false"/>
										<c:forEach var="i" begin="1" end="${ exp_space }">
											<c:if test="${ !loop }">
												<td width="4px"><p></p></td>
												<c:if test="${ i > 100 }">
													<c:set var="loop" value="true"/>
												</c:if>
											</c:if>
										</c:forEach>
										
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
				
				<table class="profiletb">
					<tr>
						<td class="proftt">
						<div class="profimg">
							<img src="<%=contextPath%>/eq/img/pps.png">
						</div>
						</td>
					</tr>
					<tr>
						<td height="19%">
							<b><%=vo.getM_nickname()%></b>님
						</td>
					</tr>
				</table>
				<div class="btnbtn">
					<input type="button" value="회원수정" onClick="location.href='<%=contextPath %>/member1/mypageUpdate.me'"; return false;">
					<input type="button" value="회원탈퇴" onClick="location.href='<%=contextPath %>/member1/withdrawal.me'"; return false;">
				</div>
				
			</div>
		</center>
		
	</form>	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    	
    	function levelUp(nickname, exp){
//     		alert(nickname + ", " + exp);
    		$.ajax({
				type: "post",
				async : true,
				url : "${pageContext.request.contextPath}/member1/levelUp.me",
				data : {},
				dataType : "text",
				success : function(data) {
					if(${vo.m_level} >= data) {
						alert("레벨업을 할 수 없습니다!");
					} else {
						alert("레벨업 하였습니다." + ${vo.m_level} + "->" + data);
						$("#level").text("LV." + data);
					}
				}
			});
    	}
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    </script>
		
	</body>
</html>