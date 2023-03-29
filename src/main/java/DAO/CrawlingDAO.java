package DAO;
import java.io.IOException;
import java.util.ArrayList;
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
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import VO.BoxCrawlingVO;
import VO.CrawlingVO;
import VO.InfoCrawlingVO;
import VO.VideoCrawlingVO;
import VO.YoutubeCrawlingVO;



public class CrawlingDAO {
		//3.16 재봉 수정 
	  String daumRankUrl = "https://movie.daum.net/ranking/reservation";
	  String naverCilpUrl = "https://tv.naver.com/navermovie";
	  String daumPhotoUrl = "https://www.dureraum.org/bcc/board/list.do?rbsIdx=325";
	  
		 // 비즈니스로직 : 네이버, 다음 영화정보 크롤링 및 DB에 저장
	      
		
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
		  	
		  public List<CrawlingVO> getMainClipDatas() throws IOException{
			  List<CrawlingVO> mainClipList = new ArrayList<CrawlingVO>();
			  
		      Document ClipDoc = Jsoup.connect(naverCilpUrl).get();
		      Elements clipList = ClipDoc.select("dt.title a");
		      Elements clipImgSrc = ClipDoc.select("a.cds_thm img");
		      
		      for (int i = 0; i < 4; i++) {
		    	 CrawlingVO vo = new CrawlingVO();
		         // 영화제목, 포스터이미지
		    	 String clipTitle = clipList.get(i).text(); // 영화 제목
		         String clipImg = clipImgSrc.get(i).attr("src"); // 포스터 이미지
		         
		         vo.setClipTitle(clipTitle);
		         vo.setClipImg(clipImg);
		         
		         mainClipList.add(vo);
		      }   
		      return mainClipList;
	      } 
	      
		  public List<CrawlingVO> getMainPhotoDatas() throws IOException{
			  List<CrawlingVO> mainPhotoList = new ArrayList<CrawlingVO>();
			  
			  // 다음 영화 뉴스 포토 수집
		      Document PhotoDoc = Jsoup.connect(daumPhotoUrl).get();
		      Elements photoSrc = PhotoDoc.select("p.pto_img img");
		      
		      // 3.16 최신 영화 포토 10개 추출로 수정
		      for (int i = 0; i < 10; i++) {
		    	 CrawlingVO vo = new CrawlingVO();
		         // 포스터이미지
		    	 String photo = photoSrc.get(i).attr("src"); // 포스터 이미지
		         
		    	 vo.setPhoto(photo);
		         
		         mainPhotoList.add(vo);
		      }   
		      return mainPhotoList;
	      } 
		  
		  
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
		  public List<VideoCrawlingVO> getVideoDatas() throws IOException{
				String videoUrl = "https://tv.kakao.com/search/cliplinks?q=%EC%98%88%EA%B3%A0%ED%8E%B8&sort=PlayCount";
					     List<VideoCrawlingVO> videoList = new ArrayList<VideoCrawlingVO>();
					  
					    Document videoDoc = Jsoup.connect(videoUrl).get();
						Elements videoImg = videoDoc.select("div.video_item img");
						Elements videoTitle = videoDoc.select("div.video_item strong");
						Elements videoPlayCnt = videoDoc.select("div.video_item span.info_play span.info_append");
						Elements videoSrc = videoDoc.select("div.video_item a");
						for (int i = 0; i < 20; i++) {
							VideoCrawlingVO vo = new VideoCrawlingVO();
				    	 	String imgSrc = videoImg.get(i).attr("src");
				    		String title = videoTitle.get(i).text();
				    		String playCnt = videoPlayCnt.get(i).text();
				    	    String src = videoSrc.get(i).attr("href");
				    	 vo.setImgSrc(imgSrc);
				         vo.setTitle(title);
				         vo.setPlayCnt(playCnt);
				         vo.setSrc(src);
				         videoList.add(vo);
						 }   
				      return videoList;
			      }
		  
		//3.27 재봉 유튜브메소드 추가
		  public List<YoutubeCrawlingVO> getYoutubeDatas() throws IOException{
			  
			  			List<YoutubeCrawlingVO> youtubeList = new ArrayList<YoutubeCrawlingVO>();
			  			String youtubeUrl = null;
			  					
	  					for(int p=1; p<4; p++) {
	  						youtubeUrl = "https://search.daum.net/search?w=vclip&enc=utf8&q=%EC%98%81%ED%99%94&sort=accuracy&period=w&sd=20230317172015&ed=20230324172015&play_time_ge=600&DA=STC&cp=youtube-video&p="+p+"&display=thumb";
	  					
			  			Document youtubeDoc = Jsoup.connect(youtubeUrl).get();

			  			Elements youtubeImg = youtubeDoc.select("div.wrap_thumb img");
			  			Elements youtubeA = youtubeDoc.select("div.wrap_thumb a");
			  			Elements youtubeTitle = youtubeDoc.select("div.wrap_tit a");
						for (int i = 0; i < 12; i++) {
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
		  
		  //셀레니움 메소드 추가 3.28
		  public List<InfoCrawlingVO> getMainInfoDatas() throws Exception{
			  	WebDriver driver = null;	
				
				//Selenium과 Chrome 브라우저를 사용하여 웹 페이지를 엽니다
				//Web Driver 압축 해제 경로 입력
				System.setProperty("webdriver.chrome.driver", "C:\\selenium\\chromedriver.exe");
				driver = new ChromeDriver();//WebDriver 객체 생성
				
				//로드 웹페이지에서 특정 요소를 찾을 때까지 기다리는 시간 설정
				driver.manage().timeouts().implicitlyWait(20, TimeUnit.SECONDS);
				
				//페이지로드가 완료 될 때까지 기다리는 시간 설정
				driver.manage().timeouts().pageLoadTimeout(20, TimeUnit.SECONDS);
				
				//브라우저 창 최대화
				driver.manage().window().maximize();
				
				//웹 자동화 작업을 할 접속 사이트 명시
				driver.get("https://movie.daum.net/moviedb/contents?movieId=164918");
		       		
				//페이지가 로딩될 때까지 기다립니다.
				//WebDriverWait를 사용하여 player_iframe이 보이기를 기다립니다.
				WebDriverWait wait = new WebDriverWait(driver, 10);
				wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("playerContainer")));
				  // iframe 요소의 src 속성값 가져오기
		        WebElement playerContainer = driver.findElement(By.id("playerContainer"));
		        WebElement iframe = playerContainer.findElement(By.tagName("iframe"));
		        String src = iframe.getAttribute("src");
		        System.out.println("iframe src : " + src);
				
		        //브라우저 닫기
		        driver.close();
		  }
	}
	










