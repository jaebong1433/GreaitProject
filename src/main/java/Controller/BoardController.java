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
		
		if (action.equals("/write.bo")) { //새글  입력하는 화면 요청!
			
			HttpSession session = request.getSession();
			String email = (String)session.getAttribute("emailId");
			
			//새글을 입력하는 화면에 로그인한 회원의 이름, 이메일을 보여주기 위해
			//member테이블에서 SELECT하여 가져와 합니다.
			MemberVO memberVO = memberdao.findMember(email);
			
			//페이징 처리를 위해 담는다.
			request.setAttribute("nowPage", request.getParameter("nowPage"));
			request.setAttribute("nowBlock", request.getParameter("nowBlock"));
			
			request.setAttribute("membervo", memberVO);
			//경로 수정
			request.setAttribute("center", "boardWrite.jsp");
			nextPage = "/GreaIT.jsp";
			
		}else if (action.equals("/writePro.bo")) { //입력한 새글 정보를 DB에 추가 해줘~ 요청!
			
			
		
			
		}else if (action.equals("/list.bo")) { //게시판 모든 글 조회 요청	
			
			//요청한 값을 이용해  응답할 값을 마련
			//(글조회)
			list = boarddao.boardListAll();
			//(글 개수 조회)
			count = boarddao.getTotalRecord();
			System.out.println(count + "개");
			//list.jsp페이지의 페이징 처리 부분에서
			//이전 또는 다음 또는 각 페이지번호를 클릭했을때... 요청받는 값얻기
			String nowPage = request.getParameter("nowPage");
			String nowBlock = request.getParameter("nowBlock");
			System.out.println(nowPage + "페이지번호");
			System.out.println(nowBlock + "블럭위치번호");		
			
			//경로 수정
			request.setAttribute("center", "boardList.jsp");
			request.setAttribute("list", list);
			request.setAttribute("count", count);
			
			//페이징 처리 를 위해 담는다.
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("nowBlock", nowBlock);
			
			nextPage = "/GreaIT.jsp";
			
		}else if (action.equals("/searchlist.bo")) {
			
			
			
		}else if (action.equals("/read.bo")) {
			
			
			
		}
		
		
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		
		dispatch.forward(request, response);
	}
}
