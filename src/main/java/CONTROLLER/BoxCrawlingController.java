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
import DAO.CrawlingDAO;
import DAO.MemberDAO;
import VO.BoxCrawlingVO;
import VO.CrawlingVO;
//   /Crawling/maincenter.me
@WebServlet("/BoxCrawling/*")
public class BoxCrawlingController extends HttpServlet {
	BoxCrawlingDAO dao;
	
	@Override
	public void init() throws ServletException {
		dao = new BoxCrawlingDAO();
	
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
		
		//메인화면 요청주소/boxCrawling/boxOffice2.me
		if(action.equals("/boxOffice2.me")) {
			
			List<BoxCrawlingVO> boxList = dao.getBoxDatas();
			
			request.setAttribute("boxList", boxList);
			
			nextPage = "/boxOffice2.jsp";
			
		}
		
		//메인화면 요청주소/boxCrawling/boxOffice1.me
		if(action.equals("/boxOffice1.me")) {
			
			List<BoxCrawlingVO> boxList1 = dao.getBoxDatas1();
			List<BoxCrawlingVO> boxList2 = dao.getBoxDatas2();
			List<BoxCrawlingVO> boxList3 = dao.getBoxDatas3();
			List<BoxCrawlingVO> boxList4 = dao.getBoxDatas4();
			
			request.setAttribute("boxList1", boxList1);
			request.setAttribute("boxList2", boxList2);
			request.setAttribute("boxList3", boxList3);
			request.setAttribute("boxList4", boxList4);
			
			nextPage = "/boxOffice1.jsp";
			
		}
		
		//메인화면 요청주소/boxCrawling/boxOffice22.me
		if(action.equals("/boxOffice22.me")) {
			
			List<BoxCrawlingVO> boxList = dao.getBoxDatas22();
			
			request.setAttribute("boxList", boxList);
			
			nextPage = "/boxOffice22.jsp";
			
		}
		
		//메인화면 요청주소/boxCrawling/boxOffice22.me
		if(action.equals("/boxOffice21.me")) {
			
			List<BoxCrawlingVO> boxList = dao.getBoxDatas21();
			
			request.setAttribute("boxList", boxList);
			
			nextPage = "/boxOffice21.jsp";
			
		}
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
	
		dispatch.forward(request, response); 
		
	}

	       
	      
	}
	










