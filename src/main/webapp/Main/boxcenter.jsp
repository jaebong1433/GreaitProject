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
		.centertb1{
			width: 98%;
			height: 350px;
			text-align: center;
			margin: auto;
		}
		
		
		
		.centertb2{
			width: 98%;
			text-align: center;
			height: 400px;
			margin: auto;
		}
		
		.centertb3{
			width: 98%;
			text-align: center;
			margin-top: 20px;
			height : 400px;
		}
		
		
		
		a{
			text-decoration: none;
			color : black;
		}
		
		hr{
			width: 90%;
			border: 1.5px gray solid;
			
		}
		
		.fonttb{
			font-size: 0.8em;
			text-align: left;
		}
		
		
	
	</style>
  
</head>
<body>
<center>
<!-- 영화 슬라이드 구역 -->
	<div>
	<br>
	<h2>BoxOffice</h2>
	<hr>
	<div>
		<table class="centertb1">
			<tr>
				<td>	
				<div>
					<ul>
						<%
						
						ArrayList list = (ArrayList)request.getAttribute("boxList");
						
						 BoxCrawlingVO vo = null;
						 String imgSrc;
						 String age;
						 String title; 
						 String dDate;
						 String people; 
						 
						 for (int i = 0; i < 5; i++) {
						
							 vo= (BoxCrawlingVO)list.get(i);
							 imgSrc = vo.getImgSrc();
							 age = vo.getAge();
							 title = vo.getTitle();
							 dDate = vo.getdDate();
							 people = vo.getPeople();
						%>	 
							 <li>
									<img src="<%=imgSrc%>" alt="" width="140px" />
									<span>
									<div class="fonttb">
									<table> 
										<tr>
											<strong><%=title %></strong><br>
										</tr>
										<tr>	
											영화 관람가:<%=age%><br>
										</tr>
										<tr>
										
										<td><%=people%><br>
										</td>
										</tr>
										<tr>	
											개봉일:<%=dDate%>
										</tr>
									</table>
									</div>
									</span>
							</li>
						<%	 
						 }
						
						%>
						
					</ul>
					</td>
					
				</div>
				</tr>
				<tr>
				<td>	
				<div>
					<ul>
						<%
						
						 for (int i = 5; i < 10; i++) {
						
							 vo= (BoxCrawlingVO)list.get(i);
							 imgSrc = vo.getImgSrc();
							 age = vo.getAge();
							 title = vo.getTitle();
							 dDate = vo.getdDate();
							 people = vo.getPeople();
						%>	 
							 <li>
									<img src="<%=imgSrc%>" alt="" width="140px" />
									<span>
									<div class="fonttb">
									<table> 
										<tr>
											<strong><%=title %></strong><br>
										</tr>
										<tr>	
											영화 관람가:<%=age%><br>
										</tr>
										<tr>
										
										<td><%=people%><br>
										</td>
										</tr>
										<tr>	
											개봉일:<%=dDate%>
										</tr>
									</table>
									</div>
									</span>
							</li>
						<%	 
						 }
						
						%>
						
					</ul>
					</td>
					
				</div>
				</tr>
				<tr>
				<td>	
				<div>
					<ul>
						<%
						
						 for (int i = 10; i < 15; i++) {
						
							 vo= (BoxCrawlingVO)list.get(i);
							 imgSrc = vo.getImgSrc();
							 age = vo.getAge();
							 title = vo.getTitle();
							 dDate = vo.getdDate();
							 people = vo.getPeople();
						%>	 
							 <li>
									<img src="<%=imgSrc%>" alt="" width="140px" />
									<span>
									<div class="fonttb">
									<table> 
										<tr>
											<strong><%=title %></strong><br>
										</tr>
										<tr>	
											영화 관람가:<%=age%><br>
										</tr>
										<tr>
										
										<td><%=people%><br>
										</td>
										</tr>
										<tr>	
											개봉일:<%=dDate%>
										</tr>
									</table>
									</div>
									</span>
								
							</li>
						<%	 
						 }
						
						%>
						
					</ul>
					</td>
					
				</div>
				</tr>
				<tr>
				<td>	
				<div>
					<ul>
						<%
						
						 for (int i = 15; i < 20; i++) {
						
							 vo= (BoxCrawlingVO)list.get(i);
							 imgSrc = vo.getImgSrc();
							 age = vo.getAge();
							 title = vo.getTitle();
							 dDate = vo.getdDate();
							 people = vo.getPeople();
						%>	 
							 <li>
									<img src="<%=imgSrc%>" alt="" width="140px" />
									<span>
									<div class="fonttb">
									<table> 
										<tr>
											<strong><%=title %></strong><br>
										</tr>
										<tr>	
											영화 관람가:<%=age%><br>
										</tr>
										<tr>
										
										<td><%=people%><br>
										</td>
										</tr>
										<tr>	
											개봉일:<%=dDate%>
										</tr>
									</table>
									</div>
									</span>
							</li>
						<%	 
						 }
						
						%>
						
					</ul>
					</td>
					
				</div>
				</tr>
				<tr>
				<td>	
				<div>
					<ul>
						<%
						
						 for (int i = 20; i < 25; i++) {
						
							 vo= (BoxCrawlingVO)list.get(i);
							 imgSrc = vo.getImgSrc();
							 age = vo.getAge();
							 title = vo.getTitle();
							 dDate = vo.getdDate();
							 people = vo.getPeople();
						%>	 
							 <li>
									<img src="<%=imgSrc%>" alt="" width="140px" />
									<span>
									<div class="fonttb">
									<table> 
										<tr>
											<strong><%=title %></strong><br>
										</tr>
										<tr>	
											영화 관람가:<%=age%><br>
										</tr>
										<tr>
										
										<td><%=people%><br>
										</td>
										</tr>
										<tr>	
											개봉일:<%=dDate%>
										</tr>
									</table>
									</div>
									</span>
							</li>
						<%	 
						 }
						
						%>
						
					</ul>
					</td>
					
				</div>
				</tr>
				<tr>
				<td>	
				<div>
					<ul>
						<%
						
						 for (int i = 25; i < 30; i++) {
						
							 vo= (BoxCrawlingVO)list.get(i);
							 imgSrc = vo.getImgSrc();
							 age = vo.getAge();
							 title = vo.getTitle();
							 dDate = vo.getdDate();
							 people = vo.getPeople();
						%>	 
							 <li>
									<img src="<%=imgSrc%>" alt="" width="140px" />
									<span>
									<div class="fonttb">
									<table> 
										<tr>
											<strong><%=title %></strong><br>
										</tr>
										<tr>	
											영화 관람가:<%=age%>
										</tr>
										<tr>
										
										<td><%=people%>
										</td>
										</tr>
										<tr>	
											개봉일:<%=dDate%>
										</tr>
									</table>
									</div>
									</span>
							</li>
						<%	 
						 }
						
						%>
						
					</ul>
					</td>
					
				</div>
				</tr>
			</table>
			<br><br>
		</div>
		</div>
		<!-- 영화 슬라이드 구역 끝-->
	</center>
</body>
</html>