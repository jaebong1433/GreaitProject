<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.openqa.selenium.WebElement"%>
<%@page import="org.openqa.selenium.By"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="org.openqa.selenium.WebDriver"%>
<%@page import="org.openqa.selenium.chrome.ChromeDriver"%>
<%@page import="org.openqa.selenium.chrome.ChromeOptions"%>
<%@page import="VO.YoutubeCrawlingVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String daumRankUrl = "http://www.cgv.co.kr/movies/pre-movies.aspx";
	//개봉예정 영화 25편까지 수집 후 각 변수에 저장
	Document daumDoc = Jsoup.connect(daumRankUrl).get();//Jsoup을 사용하여 다음영화 메인화면 데이터수집
	
	//요소별 선택자 사용해 수집한 데이터 변수에 저장
	Elements daumImg = daumDoc.select("div.box-image span.thumb-image img");
	Elements daumTitle = daumDoc.select("div.box-contents strong.title");
	Elements daumPercent = daumDoc.select("div.box-contents strong.percent span");
 	Elements daumDate = daumDoc.select("div.box-contents span.txt-info");
 	Elements daumAge = daumDoc.select("div.box-image span.thumb-image i");
 	
 	System.out.println(daumAge);

      //개봉예정영화 25편 이미지는 "src", 문자열은 text로 영화정보 추출 후 각 변수에 저장
      for (int i = 0; i < 25; i++) {
	     String imgSrc = daumImg.get(i).attr("src"); //포스터 이미지
     	 String title = daumTitle.get(i).text(); //영화 제목
		 String percent = daumPercent.get(i).text();//영화 예매율
	     String dDate = daumDate.get(i).text(); //영화 개봉일
	     String age = daumAge.get(i).text();//영화 관람가
	     
	     System.out.println(imgSrc);
	     System.out.println(title);
	     System.out.println(percent);
	     System.out.println(dDate);
	     System.out.println(age);
	     
      }   
  
%>
</body>
</html>