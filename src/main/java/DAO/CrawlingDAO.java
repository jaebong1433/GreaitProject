package DAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import VO.BoxCrawlingVO;
import VO.CrawlingVO;



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
		  
	}
	










