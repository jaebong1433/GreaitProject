package CONTROLLER;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import DAO.CommunityDAO;
import DAO.CrawlingDAO;
import DAO.MemberDAO;
import VO.CrawlingVO;
//   /Crawling/maincenter.me
@WebServlet("/Crawling/*")
public class CrawlingController extends HttpServlet {
	CrawlingDAO dao;
	CommunityDAO comDAO;
	
	@Override
	public void init() throws ServletException {
		dao = new CrawlingDAO();
		comDAO = new CommunityDAO();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, 
						 HttpServletResponse response) 
						 throws ServletException, IOException {
	
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, 
						  HttpServletResponse response) 
						  throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, 
							HttpServletResponse response) 
							throws ServletException, IOException {
	
		//한글처리
		request.setCharacterEncoding("UTF-8");
	
		//웹브라우저로 응답할 데이터 종류 설정
		response.setContentType("text/html; charset=utf-8");
	
		//웹브라우저와 연결된 출력 스트림 통로 만들기
		PrintWriter out = response.getWriter();
	
		//서블릿으로 요청한 주소를 request에서 얻기
		String action = request.getPathInfo();
		System.out.println("요청한 주소 : " + action);
	
		//조건에 따라서  포워딩 또는 보여줄 VIEW주소 경로를 저장할 변수 
		String nextPage = null;
		// 요청한 중앙화면  뷰 주소를 저장할 변수 
		String center = null;
		
		
		//메인화면 요청주소/Crawling/maincenter.me
		if(action.equals("/maincenter.me")) {
			
			List<CrawlingVO> mainList = dao.getMainDatas();
			List<CrawlingVO> mainClipList = dao.getMainClipDatas();
			List<CrawlingVO> mainPhotoList = dao.getMainPhotoDatas();
			
			request.setAttribute("mainList", mainList);
			request.setAttribute("mainClipList", mainClipList);
			request.setAttribute("mainPhotoList", mainPhotoList);
			
			//------------------------------
			//3022 정태영 : 메인화면 게시판 기능을 위해 추가하는 기능
			List list = comDAO.listByRecent();//모든 CommunityVO를 List에 저장
			int count = comDAO.getTotalRecord();
			request.setAttribute("boardList", list); //list와 count를 attribute에 저장하여 다음 페이지로 전송함
			request.setAttribute("boardCount", count);
			
			
			
			
			//-------------------------------
			nextPage = "/index.jsp";
			
		}
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
	
		dispatch.forward(request, response); 
		
	}

	       
	      
	}
	











