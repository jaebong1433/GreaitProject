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

import DAO.BoxCrawlingDAO;
import DAO.CommunityDAO;
import DAO.CrawlingDAO;
import DAO.MemberDAO;
import DAO.VideoCrawlingDAO;
import VO.BoxCrawlingVO;
import VO.CrawlingVO;
import VO.VideoCrawlingVO;
//   /Crawling/maincenter.me
@WebServlet("/Crawling/*")
public class CrawlingController extends HttpServlet {
	CrawlingDAO dao;
	CommunityDAO comDAO;
	VideoCrawlingDAO vcdao;
	@Override
	public void init() throws ServletException {
		dao = new CrawlingDAO();
		comDAO = new CommunityDAO();
		vcdao = new VideoCrawlingDAO();
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
			
		}else if(action.equals("/boxOffice.me")) {
			String menuNo = request.getParameter("menu");
			
			List<BoxCrawlingVO> boxList = dao.getBoxDatas(menuNo);
			
			request.setAttribute("boxList", boxList);
			request.setAttribute("center", "/Main/boxcenter.jsp");
			nextPage = "/index.jsp";
			
		}else if(action.equals("/videocenter.me")) {
			
			List<VideoCrawlingVO> szmList = vcdao.getVideoDatas();
			List<VideoCrawlingVO> sldkList = vcdao.getVideoDatas1();
			List<VideoCrawlingVO> dobList = vcdao.getVideoDatas2();
			List<VideoCrawlingVO> abtList = vcdao.getVideoDatas3();
			List<VideoCrawlingVO> obmList = vcdao.getVideoDatas4();
			List<VideoCrawlingVO> gzList = vcdao.getVideoDatas5();
			List<VideoCrawlingVO> tgList = vcdao.getVideoDatas6();
			List<VideoCrawlingVO> htList = vcdao.getVideoDatas7();
			List<VideoCrawlingVO> hsList = vcdao.getVideoDatas8();
			List<VideoCrawlingVO> bzList = vcdao.getVideoDatas9();
			List<VideoCrawlingVO> spList = vcdao.getVideoDatas10();
			List<VideoCrawlingVO> mnList = vcdao.getVideoDatas11();
			List<VideoCrawlingVO> mgdsList = vcdao.getVideoDatas12();
			List<VideoCrawlingVO> skhList = vcdao.getVideoDatas13();
			List<VideoCrawlingVO> kkList = vcdao.getVideoDatas14();
			
			request.setAttribute("szmList", szmList);
			request.setAttribute("sldkList", sldkList);
			request.setAttribute("dobList", dobList);
			request.setAttribute("abtList", abtList);
			request.setAttribute("obmList", obmList);
			request.setAttribute("gzList", gzList);
			request.setAttribute("tgList", tgList);
			request.setAttribute("htList", htList);
			request.setAttribute("hsList", hsList);
			request.setAttribute("bzList", bzList);
			request.setAttribute("spList", spList);
			request.setAttribute("mnList", mnList);
			request.setAttribute("mgdsList", mgdsList);
			request.setAttribute("skhList", skhList);
			request.setAttribute("kkList", kkList);
			request.setAttribute("center", "/Main/videocenter.jsp");
			nextPage = "/index.jsp";
		}
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
	
		dispatch.forward(request, response); 
		
	}

	       
	      
	}
	











