package CONTROLLER;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CommentDAO;

@WebServlet("/comment/*")
public class CommentController extends HttpServlet {

	CommentDAO commentDAO;
	@Override
	public void init() throws ServletException {
		commentDAO = new CommentDAO();
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
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		
		
		if(action.equals("/addComment.bo")) {
			
			String nickname = request.getParameter("nickname"); //로그인 했을 시 회원의 닉네임 
			String comment_nick = request.getParameter("comment_nick"); // 비로그인시 댓글 작성 닉네임
			String comment_pw = request.getParameter("comment_pw");
			String comment_content = request.getParameter("comment_content");
			String c_idx = request.getParameter("c_idx");
			String comment_uniqueid = request.getParameter("comment_uniqueid");
			
			if(nickname == null) { //비로그인시
				commentDAO.addComment(comment_nick,comment_pw,comment_content,c_idx,comment_uniqueid);
			}else { //로그인 했을시
				commentDAO.addLoginComment(nickname,comment_pw,comment_content,c_idx,comment_uniqueid);
			}
			
				
				
			nextPage = "/index.jsp";
		}
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	
	}//doHandle()메소드 끝 
}//클래스 끝