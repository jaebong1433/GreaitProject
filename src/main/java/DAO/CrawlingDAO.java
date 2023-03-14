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

import VO.CrawlingVO;


public class CrawlingDAO {
	  String naverRankUrl = "https://movie.naver.com/movie/running/current.nhn?order=reserve";
//	  String naverCilpUrl = "https://movie.naver.com/movie/running/movieclip.naver?subcategoryid=TRAILER&order=";
//	 
		 // 비즈니스로직 : 네이버, 다음 영화정보 크롤링 및 DB에 저장
	      
//	      List<MovieDTO> rankList = new ArrayList<>();
		  public List<CrawlingVO> getMainDatas() throws IOException{
			  List<CrawlingVO> mainList = new ArrayList<CrawlingVO>();
			  
			  // 네이버 영화 실시간 예매 순위 1~10위까지 수집
		      Document naverDoc = Jsoup.connect(naverRankUrl).get();
		      Elements naverList = naverDoc.select("dt.tit a");
		      Elements naverImg = naverDoc.select("div.thumb a img");
		      Elements scoreList = naverDoc.select("dl.lst_dsc");
		      Elements rating = naverDoc.select("dt.tit span");

		      // 1~10위까지 영화정보 추출
		      for (int i = 0; i < 10; i++) {
		    	 CrawlingVO vo = new CrawlingVO();
		         // 순위, 영화제목, 포스터이미지, 네이버영화코드
		    	 String rating2 = rating.get(i).text(); //영화 관람가
		         String movie = naverList.get(i).text(); // 영화 제목
		         String imgSrc = naverImg.get(i).attr("src"); // 포스터 이미지
		         Double naverScore = Double.parseDouble(scoreList.get(i).select("span.num").first().text());//평점
		        
		         vo.setRating2(rating2);
		         vo.setMovie(movie);
		         vo.setImgSrc(imgSrc);
		         vo.setNaverScore(naverScore); 
		         
		         mainList.add(vo);
		      }   
		      return mainList;
	      }

	       
	      
	}
	











