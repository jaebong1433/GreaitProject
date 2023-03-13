package CONTROLLER;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CommunityDAO;
import VO.CommunityVO;
import VO.MemberVO;


//http://localhost:8090/greaitProject/com/Main 

@WebServlet("/com/*")
public class CommunityController extends HttpServlet {

	//CommunityDAO객체를 저장할 참조변수 선언
	CommunityDAO dao;
	
	@Override
	public void init() throws ServletException {
		dao = new CommunityDAO();
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
		
		//클라이언트의 웹브라우저로 응답할 데이터 종류 설정 및 문자처리방식 UTF-8설정 
		response.setContentType("text/html; charset=utf-8");
		
		//1.한글처리 
		request.setCharacterEncoding("UTF-8");
		//1.1 클라이언트가 요청한 2단계요청주소 request객체에서 얻기
		String action = request.getPathInfo();
		System.out.println("2단계 요청 주소 : " + action);
		
		String nextPage = null;
		
		ArrayList list = null;
		
		CommunityVO vo = null;
		
		int count = 0;
		
		HttpSession session = request.getSession();
		session.setAttribute("nickname", "admin");
		
		PrintWriter out = response.getWriter();
		
		if(action.equals("/Main")) {
			
			nextPage = "/main.jsp";
		}
		
		//http://localhost:8090/greaitProject/com/list.bo
		else if(action.equals("/list.bo")) {
			System.out.println(true);
			list = dao.boardListAll();
			count = dao.getTotalRecord();
			
			String nowPage = request.getParameter("nowPage");
			String nowBlock = request.getParameter("nowBlock");
			System.out.println(nowPage + "페이지번호");
			System.out.println(nowBlock + "블럭위치번호");	
			
			request.setAttribute("list", list);
			request.setAttribute("count", count);
			request.setAttribute("center","/board/list.jsp");
			
			//페이징 처리 를 위해 담는다.
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("nowBlock", nowBlock);
			
			nextPage = "/index.jsp";
		}
		
		else if(action.equals("/read.bo")) {
			String c_idx = request.getParameter("c_idx");
			String nowPage_ = request.getParameter("nowPage");
			String nowBlock_ = request.getParameter("nowBlock");
			
			vo = dao.boardRead(c_idx);
			
			request.setAttribute("vo", vo);//글번호로 조회한 글하나의 정보  
			request.setAttribute("nowPage", nowPage_); //중앙화면 read.jsp로 전달을 위해 
			request.setAttribute("nowBlock", nowBlock_);
			request.setAttribute("c_idx", c_idx);
			
			nextPage = "/board/detail.jsp";
		}
		
		else if(action.equals("/like.bo")) {
			int c_idx = Integer.parseInt(request.getParameter("c_idx"));
			
			dao.addLike(c_idx);
			vo = dao.getVO(c_idx);
			String like = String.valueOf(vo.getC_like());
			System.out.println(like);
			out.write(like);
			
			return;
		}
		//글 작성 화면 요청을 했을때
		else if(action.equals("/write.bo")) {
			String loginNick = (String)session.getAttribute("nickname");
			
			MemberVO membervo = dao.oneMember(loginNick);
			request.setAttribute("center", "board/write.jsp");
			request.setAttribute("membervo", membervo);
			
			request.setAttribute("nowPage", request.getParameter("nowPage"));
			request.setAttribute("nowBlock", request.getParameter("nowBlock"));
			
			nextPage = "/CarMain.jsp";

		}
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	
	}//doHandle()메소드 끝 
}//클래스 끝








