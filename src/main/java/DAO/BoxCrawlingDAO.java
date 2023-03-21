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



public class BoxCrawlingDAO {
		String daumUrl = "https://movie.daum.net/ranking/boxoffice/monthly?date=202302";
		String daumUrl1 = "https://movie.daum.net/ranking/boxoffice/monthly?date=202301";
	    String daumUrl22 = "https://movie.daum.net/ranking/boxoffice/yearly?date=2022";
	    String daumUrl21 = "https://movie.daum.net/ranking/boxoffice/yearly?date=2021";
	    
		  public List<BoxCrawlingVO> getBoxDatas() throws IOException{
			  List<BoxCrawlingVO> BoxList = new ArrayList<BoxCrawlingVO>();
			  
			  Document daumDoc = Jsoup.connect(daumUrl).get();
			  Elements daumImg = daumDoc.select("div.thumb_item div.poster_movie img");
			  Elements daumAge = daumDoc.select("div.poster_movie span.txt_tag");
			  Elements daumTitle = daumDoc.select("strong.tit_item a");
			  Elements daumDate = daumDoc.select("span.txt_info span.info_txt span.txt_num");
			  Elements daumPeople = daumDoc.select("span.txt_info span.info_txt:nth-of-type(2)");
			    
		      for (int i = 0; i < 30; i++) {
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
		  
		  public List<BoxCrawlingVO> getBoxDatas1() throws IOException{
			  List<BoxCrawlingVO> BoxList1 = new ArrayList<BoxCrawlingVO>();
			  
			  Document daumDoc = Jsoup.connect(daumUrl1).get();
			  Elements daumImg = daumDoc.select("div.thumb_item div.poster_movie img");
			  Elements daumAge = daumDoc.select("div.poster_movie span.txt_tag");
			  Elements daumTitle = daumDoc.select("strong.tit_item a");
			  Elements daumDate = daumDoc.select("span.txt_info span.info_txt span.txt_num");
			  Elements daumPeople = daumDoc.select("span.txt_info span.info_txt:nth-of-type(2)");
			    
		      for (int i = 0; i < 26; i++) {
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
		         
		         BoxList1.add(vo);
		      }   
		      return BoxList1;
	      }
		  
		  public List<BoxCrawlingVO> getBoxDatas2() throws IOException{
			  List<BoxCrawlingVO> BoxList2 = new ArrayList<BoxCrawlingVO>();
			  
			  Document daumDoc = Jsoup.connect(daumUrl1).get();
			  Elements daumAge = daumDoc.select("div.poster_movie span.txt_tag");
			  Elements daumTitle = daumDoc.select("strong.tit_item a");
			  Elements daumDate = daumDoc.select("span.txt_info span.info_txt span.txt_num");
			  Elements daumPeople = daumDoc.select("span.txt_info span.info_txt:nth-of-type(2)");
			  
			  for (int i = 0; i < 30; i++) {
		    	 BoxCrawlingVO vo = new BoxCrawlingVO();
		         	String age = daumAge.get(i).text(); // 영화 관람가
		    	 	String title = daumTitle.get(i).text(); // 영화 제목
		    	    String dDate = daumDate.get(i).text(); //영화 개봉일
		    		String people = daumPeople.get(i).text(); //영화 관객수

		    	 vo.setAge(age);
		    	 vo.setTitle(title);
		         vo.setdDate(dDate);
		         vo.setPeople(people);
		         
		         BoxList2.add(vo);
		      }   
		      return BoxList2;
	      }
		  
		  public List<BoxCrawlingVO> getBoxDatas3() throws IOException{
			  List<BoxCrawlingVO> BoxList3 = new ArrayList<BoxCrawlingVO>();
			  
			  Document daumDoc = Jsoup.connect(daumUrl1).get();
			  Elements daumImg = daumDoc.select("div.thumb_item div.poster_movie img");
			  
		      for (int i = 26; i < 29; i++) {
		    	 BoxCrawlingVO vo = new BoxCrawlingVO();
		         	String imgSrc = daumImg.get(i).attr("src"); // 포스터 이미지
		         	
		    	 vo.setImgSrc(imgSrc);
		    	
		         BoxList3.add(vo);
		      }   
		      return BoxList3;
	      }
		  
		  public List<BoxCrawlingVO> getBoxDatas4() throws IOException{
			  List<BoxCrawlingVO> BoxList4 = new ArrayList<BoxCrawlingVO>();
			  
			  Document daumDoc = Jsoup.connect(daumUrl1).get();
			  Elements daumAge = daumDoc.select("div.poster_movie span.txt_tag");
			  Elements daumTitle = daumDoc.select("strong.tit_item a");
			  Elements daumDate = daumDoc.select("span.txt_info span.info_txt span.txt_num");
			  Elements daumPeople = daumDoc.select("span.txt_info span.info_txt:nth-of-type(2)");

		      for (int i = 27; i < 30; i++) {
		    	BoxCrawlingVO vo = new BoxCrawlingVO();
		    	String age = daumAge.get(i).text(); // 영화 관람가
		  	 	String title = daumTitle.get(i).text(); // 영화 제목
		  	    String dDate = daumDate.get(i).text(); //영화 개봉일
		  		String people = daumPeople.get(i).text(); //영화 관객수
	         	
		  		 vo.setAge(age);
		    	 vo.setTitle(title);
		         vo.setdDate(dDate);
		         vo.setPeople(people);
		    	
		         BoxList4.add(vo);
		      }   
		      return BoxList4;
	      }
		 
		  public List<BoxCrawlingVO> getBoxDatas22() throws IOException{
			  List<BoxCrawlingVO> BoxList = new ArrayList<BoxCrawlingVO>();
			  
			  Document daumDoc = Jsoup.connect(daumUrl22).get();
			  Elements daumImg = daumDoc.select("div.thumb_item div.poster_movie img");
			  Elements daumAge = daumDoc.select("div.poster_movie span.txt_tag");
			  Elements daumTitle = daumDoc.select("strong.tit_item a");
			  Elements daumDate = daumDoc.select("span.txt_info span.info_txt span.txt_num");
			  Elements daumPeople = daumDoc.select("span.txt_info span.info_txt:nth-of-type(2)");
			    
		      for (int i = 0; i < 30; i++) {
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
		  
		  public List<BoxCrawlingVO> getBoxDatas21() throws IOException{
			  List<BoxCrawlingVO> BoxList = new ArrayList<BoxCrawlingVO>();
			  
			  Document daumDoc = Jsoup.connect(daumUrl21).get();
			  Elements daumImg = daumDoc.select("div.thumb_item div.poster_movie img");
			  Elements daumAge = daumDoc.select("div.poster_movie span.txt_tag");
			  Elements daumTitle = daumDoc.select("strong.tit_item a");
			  Elements daumDate = daumDoc.select("span.txt_info span.info_txt span.txt_num");
			  Elements daumPeople = daumDoc.select("span.txt_info span.info_txt:nth-of-type(2)");
			    
		      for (int i = 0; i < 30; i++) {
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
	










