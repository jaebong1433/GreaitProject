<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="center" value="${requestScope.center}"/>
<c:out value="${center}" />
  
<c:if test="${center == null}">
	<c:set var="center" value="Main/maincenter.jsp"/>
</c:if>




<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>무드무비</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">    
	    <meta http-equiv="content-type" content="text/html; charset=utf-8">
	    <meta name="author" content="Jobboard">
	    <!-- 타이틀 아이콘 -->
    	<link rel="shortcut icon" href="<%=contextPath%>/eq/img/micon.png">
    
		
		<style type="text/css">
			
			
			
			.main{
				
				width: 100%;
				height: 2000px;
				float: center;
			}
			
			
			.mainside{
				height: 100%;
				float : left;
				margin-left: 50px;
				text-align : left;
				position: fixed;
			}
			.maintext{
				width : 79%;
				height: 100%;
				
				margin-right: 20px;
				float : right;
				background-color: white;
			}
			
			.mainbot{
				width : 79%;
				height: 28%;
				float : right;
			}
			
			.wsd{
				position: relative;
			    min-height: 100%;
			    margin: 0 auto;
			    padding-top: 7px;
			    background-color : white;
			}
			
			
		</style>
		
	</head>
	<body>
	<div class="wsd">
		<center>
			
		
		<table class="main">
			<tr>
				<td class="mainside"><jsp:include page="Main/sidebar.jsp"/></td>	
				<td class="maintext"><jsp:include page="${center}" /></td>
			</tr>
			<tr>
				<td class="mainbot"><jsp:include page="Main/bottom.jsp"/> </td>
			</tr>					
		</table>
		</center>
	</div>	
	</body>
</html>