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
		List<YoutubeCrawlingVO> youtubeList = new ArrayList<YoutubeCrawlingVO>();
	  //Selenium과 Chrome 브라우저를 사용하여 웹 페이지를 엽니다
		//Web Driver 압축 해제 경로 입력
	   System.setProperty("webdriver.chrome.driver", "C:\\selenium\\chromedriver.exe");
	   
	   ChromeOptions options = new ChromeOptions();
	   options.addArguments("--headless");
	   options.addArguments("--disable-gpu");

	   WebDriver driver = new ChromeDriver(options);
	   
	   driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS); // 10초간 기다림
	   driver.manage().timeouts().pageLoadTimeout(10, TimeUnit.SECONDS);//페이지로드가 완료 될 때까지 기다리는 시간 설정
	   driver.get("https://movie.daum.net/main");
	   
//	   WebElement videoWrapper = driver.findElement(By.id("video-wrapper"));
//	   JavascriptExecutor js = (JavascriptExecutor) driver;
//	   js.executeScript("arguments[0].setAttribute('style', 'margin-top: 50px;')", videoWrapper);
//	   
     WebElement playerContainer = driver.findElement(By.className("thumb_video"));
     WebElement iframe = playerContainer.findElement(By.tagName("iframe"));
     
//      WebElement activeLi = driver.findElement(By.className("info"));
//      WebElement strongTag = activeLi.findElement(By.tagName("a"));
     
     YoutubeCrawlingVO vo = new YoutubeCrawlingVO();
     
     String iframeSrc = iframe.getAttribute("src");
//      String strongText = strongTag.getText();
     System.out.println(iframeSrc);
//      System.out.println(strongText);
//      vo.setImgSrc(iframeSrc);
//      vo.setTitle(strongText);
     
     youtubeList.add(vo);
     driver.quit();
     
    

%>
</body>
</html>