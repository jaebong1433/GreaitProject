package DAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import VO.BoxCrawlingVO;
import VO.CrawlingVO;
import VO.ClipCrawlingVO;
import VO.VideoCrawlingVO;
import VO.YoutubeCrawlingVO;



public class CrawlingDAO {
		//3.29 재봉 수정 사용하지않는 링크,메소드삭제
	  String daumRankUrl = "https://movie.daum.net/ranking/reservation";
	  	
	  	public List<CrawlingVO> getMainDatas() throws IOException{
			  List<CrawlingVO> mainList = new ArrayList<CrawlingVO>();
			  
			//다음 영화 실시간 예매 순위 1~10위까지 수집
			Document daumDoc = Jsoup.connect(daumRankUrl).get();
		    Elements daumAge = daumDoc.select("div.poster_movie span.txt_tag");
			Elements daumImg = daumDoc.select(".item_poster .poster_movie img");
	 		Elements daumTitle = daumDoc.select("strong.tit_item a");
	     	Elements daumScore = daumDoc.select("span.txt_grade");
	     	Elements daumNum = daumDoc.select("span.info_txt span.txt_num");
			Elements daumDate = daumDoc.select("span.txt_info span.txt_num");
	 	      
		      // 1~10위까지 영화정보 추출
		      for (int i = 0; i < 10; i++) {
		    	 CrawlingVO vo = new CrawlingVO();
		         // 순위, 영화제목, 포스터이미지, 네이버영화코드
		    	 String age = daumAge.get(i).text(); // 영화 관람가
	 	         String imgSrc = daumImg.get(i).attr("src"); // 포스터 이미지
		         String title = daumTitle.get(i).text(); // 영화 제목
			     String dScore = daumScore.get(i).text(); // 영화 평점
			     String dNum = daumNum.get(i).text(); //영화 예매율
			     String dDate = daumDate.get(i).text(); //영화 개봉일
	 	        
		         vo.setAge(age);
		         vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		         vo.setdScore(dScore);
		         vo.setdNum(dNum);
		         vo.setdDate(dDate);
		         
		         mainList.add(vo);
		      }   
		      return mainList;
	      }
		  
	  	  //3월 추가 4.3
		  public List<BoxCrawlingVO> getBoxDatas(String menuNo) throws IOException{
			  String daumUrl = null;
			  if(menuNo.equals("2")) {
				  daumUrl = "https://movie.daum.net/ranking/boxoffice/monthly?date=202302";
			  }else if(menuNo.equals("1")) {
				  daumUrl = "https://movie.daum.net/ranking/boxoffice/monthly?date=202301";
			  }else if(menuNo.equals("22")) {
				  daumUrl = "https://movie.daum.net/ranking/boxoffice/yearly?date=2022";
			  }else if(menuNo.equals("21")) {
				  daumUrl = "https://movie.daum.net/ranking/boxoffice/yearly?date=2021";
			  }else if(menuNo.equals("3")) {
				  daumUrl = "https://movie.daum.net/ranking/boxoffice/monthly";
			  }
			  List<BoxCrawlingVO> BoxList = new ArrayList<BoxCrawlingVO>();
			  Document daumDoc = Jsoup.connect(daumUrl).get();
			  Elements daumImg = daumDoc.select("div.thumb_item div.poster_movie img");
			  Elements daumAge = daumDoc.select("div.poster_movie span.txt_tag");
			  Elements daumTitle = daumDoc.select("strong.tit_item a");
			  Elements daumDate = daumDoc.select("span.txt_info span.info_txt span.txt_num");
			  Elements daumPeople = daumDoc.select("span.txt_info span.info_txt:nth-of-type(2)");
			    
		      for (int i = 0; i < 25; i++) {
		    	 BoxCrawlingVO vo = new BoxCrawlingVO();
		         	String imgSrc = daumImg.get(i).attr("src"); // 포스터 이미지
		    		String age = daumAge.get(i).text(); // 영화 관람가
		    	 	String title = daumTitle.get(i).text(); // 영화 제목
		    	    String dDate = daumDate.get(i).text(); //영화 개봉일
		    		String people = daumPeople.get(i).text(); //영화 관객수

		    	 vo.setImgSrc(imgSrc);
		         vo.setAge(age);
		    	 vo.setTitle(title);
		         vo.setdDate(dDate);
		         vo.setPeople(people);
		         
		         BoxList.add(vo);
		      }   
		      return BoxList;
	      }
		  //4.4 재봉 좋아요 업로드 변수 추가 
		  public List<VideoCrawlingVO> getVideoDatas() throws IOException{
				String videoUrl = "https://tv.naver.com/navermovie/clips";
					     List<VideoCrawlingVO> videoList = new ArrayList<VideoCrawlingVO>();
					  
					    Document videoDoc = Jsoup.connect(videoUrl).get();
						Elements videoImg = videoDoc.select("a.cds_thm img");
						Elements videoTitle = videoDoc.select("dt.title a");
						Elements videoPlayCnt = videoDoc.select("dd.meta span.hit");
						Elements videoLike = videoDoc.select("dd.meta span.like");
						Elements videoUpload = videoDoc.select("dd.meta span.time");
						Elements videoSrc = videoDoc.select("div.cds_type a");
						for (int i = 0; i < 20; i++) {
							VideoCrawlingVO vo = new VideoCrawlingVO();
				    	 	String imgSrc = videoImg.get(i).attr("src");
				    		String title = videoTitle.get(i).text();
				    		String playCnt = videoPlayCnt.get(i).text();
				    		String like = videoLike.get(i).text();
				    		String upload = videoUpload.get(i).text();
				    	    String src = videoSrc.get(i).attr("href");
				    	 vo.setImgSrc(imgSrc);
				         vo.setTitle(title);
				         vo.setPlayCnt(playCnt);
				         vo.setSrc(src);
				         vo.setLike(like);
				         vo.setUpload(upload);
				         videoList.add(vo);
						 }   
				      return videoList;
			      }
		  
		  //4.3 재봉 유튜브메소드 장르별로 수정완료
		  public List<YoutubeCrawlingVO> getYoutubeDatas() throws IOException{
			  
			  			List<YoutubeCrawlingVO> youtubeList = new ArrayList<YoutubeCrawlingVO>();
			  			int i = 0;
			  			String youtubeUrl[] =  {"https://search.daum.net/search?nil_suggest=btn&w=vclip&m=vclip&q=%EC%95%A1%EC%85%98+%EC%98%81%ED%99%94&play_time_ge=300&cp=youtube-video&play_time_le=600&DA=STC&p=1",
					 		 	  				"https://search.daum.net/search?nil_suggest=btn&w=vclip&m=vclip&q=%EA%B3%B5%ED%8F%AC+%EC%98%81%ED%99%94&play_time_ge=300&play_time_le=600&DA=STC&cp=youtube-video&p=1",
					 		 	  				"https://search.daum.net/search?nil_suggest=btn&w=vclip&m=vclip&q=%ED%8C%90%ED%83%80%EC%A7%80+%EC%98%81%ED%99%94&play_time_ge=300&play_time_le=600&DA=STC&cp=youtube-video&p=1",
					 		 	  				"https://search.daum.net/search?nil_suggest=btn&w=vclip&m=vclip&q=%EB%A1%9C%EB%A7%A8%EC%8A%A4+%EC%98%81%ED%99%94&play_time_ge=300&play_time_le=600&DA=STC&cp=youtube-video&p=1",
					 		 	  				"https://search.daum.net/search?nil_suggest=sugsch&w=vclip&m=vclip&sq=%EC%BD%94%EB%AF%B8%EB%94%94+%EC%98%81%ED%99%94&o=3&sugo=15&q=%EC%BD%94%EB%AF%B8%EB%94%94+%EC%98%81%ED%99%94&play_time_ge=300&play_time_le=600&DA=STC&cp=youtube-video&p=1"
												};
			  			
			  			for(String s : youtubeUrl) {

			  			Document youtubeDoc = Jsoup.connect(s).get();
			  					
			  			Elements youtubeImg = youtubeDoc.select("div.wrap_thumb img");
			  			Elements youtubeA = youtubeDoc.select("div.wrap_thumb a");
			  			Elements youtubeTitle = youtubeDoc.select("div.wrap_tit a");
			  			
						for (i = 0; i < 5; i++) {
							YoutubeCrawlingVO vo = new YoutubeCrawlingVO();
							String imgSrc = youtubeImg.get(i).attr("src");
							String href = youtubeA.get(i).attr("href");
							String title = youtubeTitle.get(i).text();
				    	 vo.setImgSrc(imgSrc);
				         vo.setTitle(title);
				         vo.setHref(href);
				         youtubeList.add(vo);
						 } 
			  			}
				      return youtubeList;
				      
			      }
		  
		  //셀레니움 메소드 수정 4.3 재봉
		  public List<ClipCrawlingVO> getMainClipDatas() throws IOException{
			  	List<ClipCrawlingVO> clipList = new ArrayList<ClipCrawlingVO>();
			  //Selenium과 Chrome 브라우저를 사용하여 웹 페이지를 엽니다
				//Web Driver 압축 해제 경로 입력
			   System.setProperty("webdriver.chrome.driver", "C:\\selenium\\chromedriver.exe");
			   
			   ChromeOptions options = new ChromeOptions();
			   //속도 개선을 위한 옵션 추가 4.3
			   options.addArguments("--headless");
			   options.addArguments("--disable-gpu");
			   options.addArguments("--no-sandbox"); 
			   options.addArguments("--disable-dev-shm-usage");
			   options.addArguments("--disable-popup-blocking");  
		       options.addArguments("--disable-defult-apps");
		       options.addArguments("--blink-settings=imagesEnabled=false"); //이미지 다운 안받음
		       options.addArguments("--disable-infobars");
		       options.addArguments("--disable-extensions");
		       options.addArguments("--disable-notifications");
		       
			   WebDriver driver = new ChromeDriver(options);
			   
			   driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS); // 10초간 기다림
//			   driver.manage().timeouts().pageLoadTimeout(10, TimeUnit.SECONDS);//페이지로드가 완료 될 때까지 기다리는 시간 설정
			   driver.get("https://movie.daum.net/main");
			   
//			   WebElement videoWrapper = driver.findElement(By.id("video-wrapper"));
//			   JavascriptExecutor js = (JavascriptExecutor) driver;
//			   js.executeScript("arguments[0].setAttribute('style', 'margin-top: 50px;')", videoWrapper);
//			   
		       WebElement playerContainer = driver.findElement(By.className("player_container"));
		       WebElement iframe = playerContainer.findElement(By.tagName("iframe"));
           
		       WebElement activeLi = driver.findElement(By.className("movie_visual"));
		       WebElement strongTag = activeLi.findElement(By.tagName("strong"));
		       WebElement pTag = activeLi.findElement(By.tagName("p"));

		       ClipCrawlingVO vo = new ClipCrawlingVO();
		       
		       String iframeSrc = iframe.getAttribute("src");
		       String strongText = strongTag.getText();
		       String pText = pTag.getText();
		       
		       vo.setIframeSrc(iframeSrc);
		       vo.setpText(pText);
		       vo.setStrongText(strongText);
		       
		       clipList.add(vo);
		       driver.quit();
		       
		       return clipList;
		  }
	}
	










