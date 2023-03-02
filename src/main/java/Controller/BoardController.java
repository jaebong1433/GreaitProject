package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.BoardDAO;
import DAO.MemberDAO;
import VO.BoardVO;
import VO.MemberVO;


@WebServlet("/board1/*")
public class BoardController extends HttpServlet{
	
	BoardDAO boarddao;
	MemberDAO memberdao;
	
	@Override
	public void init() throws ServletException {
		boarddao = new BoardDAO();
		memberdao = new MemberDAO();
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
		//BoardVo객체를 저장할 참조 변수
		BoardVO vo = null;
		//ArrayList배열 저장할 참조변수
		ArrayList list = null;
		//글 개수 조회
		int count = 0;
		
		if (action.equals("/write.bo")) {
			
			HttpSession session = request.getSession();
			String memberemail = (String)session.getAttribute("이메일");
			
			//새글을 입력하는 화면에 로그인한 회원의 이름, 이메일을 보여주기 위해
			//member테이블에서 SELECT하여 가져와 합니다.
			//MemberVO memberVo = memberdao.findMember(memberemail);
			
			//페이징 처리 를 위해 담는다.
			request.setAttribute("nowPage", request.getParameter("nowPage"));
			request.setAttribute("nowBlock", request.getParameter("nowBlock"));
			
		}else if (action.equals("/writePro.bo")) {
			
			
			
		}else if (action.equals("/list.bo")) {
			
			
			
		}else if (action.equals("/searchlist.bo")) {
			
			
			
		}
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		
		dispatch.forward(request, response);
	}
}
