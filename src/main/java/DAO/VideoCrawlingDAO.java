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
import VO.VideoCrawlingVO;



public class VideoCrawlingDAO {
	String videoUrl = "https://tv.kakao.com/search/cliplinks?q=%EC%8A%A4%EC%A6%88%EB%A9%94%EC%9D%98%20%EB%AC%B8%EB%8B%A8%EC%86%8D&sort=Score";
	String videoUrl1 = "https://tv.kakao.com/search/cliplinks?q=%EB%8D%94%20%ED%8D%BC%EC%8A%A4%ED%8A%B8%20%EC%8A%AC%EB%9E%A8%EB%8D%A9%ED%81%AC&sort=Score";
	String videoUrl2 = "https://tv.kakao.com/search/cliplinks?q=%EB%8C%80%EC%99%B8%EB%B9%84&sort=Score";
	String videoUrl3 = "https://tv.kakao.com/search/cliplinks?q=%EC%95%84%EB%B0%94%ED%83%80%3A%EB%AC%BC%EC%9D%98%20%EA%B8%B8&sort=Score";	
	String videoUrl4 = "https://tv.kakao.com/search/cliplinks?q=%EC%98%AC%EB%B9%BC%EB%AF%B8&sort=Score";
	String videoUrl5 = "https://tv.kakao.com/search/cliplinks?q=%EA%B3%B5%EC%A1%B02&sort=Score";
	String videoUrl6 = "https://tv.kakao.com/search/cliplinks?q=%ED%83%91%EA%B1%B4%3A%EB%A7%A4%EB%B2%84%EB%A6%AD&sort=Score";
	String videoUrl7 = "https://tv.kakao.com/search/cliplinks?q=%ED%97%8C%ED%8A%B8&sort=Score";
	String videoUrl8 = "https://tv.kakao.com/search/cliplinks?q=%ED%95%9C%EC%82%B0%3A%20%EC%9A%A9%EC%9D%98%20%EC%B6%9C%ED%98%84&sort=Score";
	String videoUrl9 = "https://tv.kakao.com/search/cliplinks?q=%EB%B2%94%EC%A3%84%EB%8F%84%EC%8B%9C2&sort=Score";
	String videoUrl10 = "https://tv.kakao.com/search/cliplinks?q=%EC%8A%A4%ED%8C%8C%EC%9D%B4%EB%8D%94%EB%A7%A8%3A%EB%85%B8%20%EC%9B%A8%EC%9D%B4%20%ED%99%88&sort=Score";
	String videoUrl11 = "https://tv.kakao.com/search/cliplinks?q=%EB%A7%88%EB%85%802&sort=Score";
	String videoUrl12 = "https://tv.kakao.com/search/cliplinks?q=%EB%AA%A8%EA%B0%80%EB%94%94%EC%8A%88&sort=Score";
	String videoUrl13 = "https://tv.kakao.com/search/cliplinks?q=%EC%8B%B1%ED%81%AC%ED%99%80&sort=Score";
	String videoUrl14 = "https://tv.kakao.com/search/cliplinks?q=%EA%B7%B9%EC%9E%A5%ED%8C%90%20%EA%B7%80%EB%A9%B8%EC%9D%98%20%EC%B9%BC%EB%82%A0%3A%EB%AC%B4%ED%95%9C%EC%97%B4%EC%B0%A8&sort=Score";
	public List<VideoCrawlingVO> getVideoDatas() throws IOException{
			     List<VideoCrawlingVO> szmList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(6) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(6) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         szmList.add(vo);
				
		      return szmList;
	      }
		  
		  public List<VideoCrawlingVO> getVideoDatas1() throws IOException{
			     List<VideoCrawlingVO> sldkList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl1).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(2) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(2) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         sldkList.add(vo);
				
		      return sldkList;
	      }
		  
		  public List<VideoCrawlingVO> getVideoDatas2() throws IOException{
			     List<VideoCrawlingVO> dobList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl2).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(2) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(2) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         dobList.add(vo);
				
		      return dobList;
	      }
		  
		  public List<VideoCrawlingVO> getVideoDatas3() throws IOException{
			     List<VideoCrawlingVO> abtList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl3).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(3) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(3) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         abtList.add(vo);
				
		      return abtList;
	      }
		  public List<VideoCrawlingVO> getVideoDatas4() throws IOException{
			     List<VideoCrawlingVO> obmList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl4).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(2) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(2) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         obmList.add(vo);
				
		      return obmList;
	      }
		  public List<VideoCrawlingVO> getVideoDatas5() throws IOException{
			     List<VideoCrawlingVO> gzList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl5).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(1) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(1) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         gzList.add(vo);
				
		      return gzList;
	      }
		  public List<VideoCrawlingVO> getVideoDatas6() throws IOException{
			     List<VideoCrawlingVO> tgList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl6).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(5) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(5) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         tgList.add(vo);
				
		      return tgList;
	      }
		  public List<VideoCrawlingVO> getVideoDatas7() throws IOException{
			     List<VideoCrawlingVO> htList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl7).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(1) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(1) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         htList.add(vo);
				
		      return htList;
	      }
		  public List<VideoCrawlingVO> getVideoDatas8() throws IOException{
			     List<VideoCrawlingVO> hsList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl8).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(1) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(1) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         hsList.add(vo);
				
		      return hsList;
	      }
		  public List<VideoCrawlingVO> getVideoDatas9() throws IOException{
			     List<VideoCrawlingVO> bzList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl9).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(2) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(2) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         bzList.add(vo);
				
		      return bzList;
	      }
		  public List<VideoCrawlingVO> getVideoDatas10() throws IOException{
			     List<VideoCrawlingVO> spList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl10).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(1) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(1) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         spList.add(vo);
				
		      return spList;
	      }
		  public List<VideoCrawlingVO> getVideoDatas11() throws IOException{
			     List<VideoCrawlingVO> mnList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl11).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(1) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(1) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         mnList.add(vo);
				
		      return mnList;
	      }
		  public List<VideoCrawlingVO> getVideoDatas12() throws IOException{
			     List<VideoCrawlingVO> mgdsList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl12).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(1) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(1) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         mgdsList.add(vo);
				
		      return mgdsList;
	      }
		  public List<VideoCrawlingVO> getVideoDatas13() throws IOException{
			     List<VideoCrawlingVO> skhList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl13).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(1) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(1) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         skhList.add(vo);
				
		      return skhList;
	      }
		  public List<VideoCrawlingVO> getVideoDatas14() throws IOException{
			     List<VideoCrawlingVO> kkList = new ArrayList<VideoCrawlingVO>();
			  
			    Document videoDoc = Jsoup.connect(videoUrl14).get();
				Elements videoImg = videoDoc.select("div.video_item:nth-of-type(2) img");
				Elements videoTitle = videoDoc.select("div.video_item:nth-of-type(2) strong");
				
					VideoCrawlingVO vo = new VideoCrawlingVO();
		    	 	String imgSrc = videoImg.attr("src");
		    		String title = videoTitle.text();
		    		
		    	 vo.setImgSrc(imgSrc);
		         vo.setTitle(title);
		        
		         kkList.add(vo);
				
		      return kkList;
	      }
	}
	










