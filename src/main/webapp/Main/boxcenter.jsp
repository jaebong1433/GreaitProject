<%@page import="VO.BoxCrawlingVO"%>
<%@page import="VO.CrawlingVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	
	
%>    
   
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.108.0">
    <title>Center</title>
	<!-- 제이쿼리 사용을 위한 제이쿼리 라이이브러리 연동 -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   
	<script type="text/javascript" src="<%=contextPath%>/eq/js/main.js"></script>

	<style type="text/css">
		.boxo{
			width: 98%;
			height: 120%;
			text-align: center;
			margin: auto;
		}
		.boxo hr{
			width: 90%;
			border: 1.5px gray solid;
		}
		
		
		.boxtb{
			width: 95%;
			height: 500px;
			font-size: 0.8em;
			text-align: left;
		}
		
		.test{
			height:400px;
		}
		
		a{
			color: black;
			text-decoration: none;
		}
	
	</style>
  
</head>
<body>

						<%
						ArrayList list = (ArrayList)request.getAttribute("boxList");
						
						 BoxCrawlingVO vo = null;
						 String imgSrc;
						 String age;
						 String title; 
						 String dDate;
						 String people; 
						 %>
<center>
	<div class="boxo">
	<h2><b>BoxOffice</b></h2>
	<hr>
	<div>
		<table class="boxtb">
			<tr>
				<td>	
				<%
					for (int i = 0; i < 5; i++) {
						vo= (BoxCrawlingVO)list.get(i);
						imgSrc = vo.getImgSrc();
						age = vo.getAge();
						title = vo.getTitle();
						dDate = vo.getdDate();
						people = vo.getPeople();
				%>	 
					<td>	
						<div class="test">
							<img src="<%=imgSrc%>" alt="" width="200px" />
							<br>
							<table> 
								<tr>
									<td width="200px">
									<h5><b><%=title %></b></h5>
									</td>
								</tr>
								<tr>
									<td>	
									영화 관람가:<%=age%>
									</td>
								</tr>
								<tr>
									<td>
									<%=people%>
									</td>
								</tr>
								<tr>	
								<td>
									개봉일:<%=dDate%>
									</td>
								</tr>
							</table>
						</div>
									
				</td>
			<%	 
				}
						
			%>
			</tr>
		</table>
		<table class="boxtb">
			<tr>
				<td>	
				<%
					for (int i = 5; i < 10; i++) {
						vo= (BoxCrawlingVO)list.get(i);
						imgSrc = vo.getImgSrc();
						age = vo.getAge();
						title = vo.getTitle();
						dDate = vo.getdDate();
						people = vo.getPeople();
				%>	 
					<td>	
						<div class="test">
							<img src="<%=imgSrc%>" alt="" width="200px" />
							<br>
							<table> 
								<tr>
									<td width="200px">
									<h5><b><%=title %></b></h5>
									</td>
								</tr>
								<tr>
									<td>	
									영화 관람가:<%=age%>
									</td>
								</tr>
								<tr>
									<td>
									<%=people%>
									</td>
								</tr>
								<tr>	
								<td>
									개봉일:<%=dDate%>
									</td>
								</tr>
							</table>
						</div>
									
				</td>
			<%	 
				}
						
			%>
			</tr>
		</table>
		<table class="boxtb">
			<tr>
				<td>	
				<%
					for (int i = 10; i < 15; i++) {
						vo= (BoxCrawlingVO)list.get(i);
						imgSrc = vo.getImgSrc();
						age = vo.getAge();
						title = vo.getTitle();
						dDate = vo.getdDate();
						people = vo.getPeople();
				%>	 
					<td>	
						<div class="test">
							<img src="<%=imgSrc%>" alt="" width="200px" />
							<br>
							<table> 
								<tr>
									<td width="200px">
									<h5><b><%=title %></b></h5>
									</td>
								</tr>
								<tr>
									<td>	
									영화 관람가:<%=age%>
									</td>
								</tr>
								<tr>
									<td>
									<%=people%>
									</td>
								</tr>
								<tr>	
								<td>
									개봉일:<%=dDate%>
									</td>
								</tr>
							</table>
						</div>
									
				</td>
			<%	 
				}
						
			%>
			</tr>
		</table>
		<table class="boxtb">
			<tr>
				<td>	
				<%
					for (int i = 15; i < 20; i++) {
						vo= (BoxCrawlingVO)list.get(i);
						imgSrc = vo.getImgSrc();
						age = vo.getAge();
						title = vo.getTitle();
						dDate = vo.getdDate();
						people = vo.getPeople();
				%>	 
					<td>	
						<div class="test">
							<img src="<%=imgSrc%>" alt="" width="200px" />
							<br>
							<table> 
								<tr>
									<td width="200px">
									<h5><b><%=title %></b></h5>
									</td>
								</tr>
								<tr>
									<td>	
									영화 관람가:<%=age%>
									</td>
								</tr>
								<tr>
									<td>
									<%=people%>
									</td>
								</tr>
								<tr>	
								<td>
									개봉일:<%=dDate%>
									</td>
								</tr>
							</table>
						</div>
									
				</td>
			<%	 
				}
						
			%>
			</tr>
			
			<table class="boxtb">
			<tr>
				<td>	
				<%
					for (int i = 20; i < 25; i++) {
						vo= (BoxCrawlingVO)list.get(i);
						imgSrc = vo.getImgSrc();
						age = vo.getAge();
						title = vo.getTitle();
						dDate = vo.getdDate();
						people = vo.getPeople();
				%>	 
					<td>	
						<div class="test">
							<img src="<%=imgSrc%>" alt="" width="200px" />
							<br>
							<table> 
								<tr>
									<td width="200px">
									<h5><b><%=title %></b></h5>
									</td>
								</tr>
								<tr>
									<td>	
									영화 관람가:<%=age%>
									</td>
								</tr>
								<tr>
									<td>
									<%=people%>
									</td>
								</tr>
								<tr>	
								<td>
									개봉일:<%=dDate%>
									</td>
								</tr>
							</table>
						</div>
									
				</td>
			<%	 
				}
						
			%>
			</tr>
		</table>
		
	</div>
</center>
</body>
</html>