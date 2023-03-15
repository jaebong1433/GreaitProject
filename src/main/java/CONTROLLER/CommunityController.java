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
import DAO.MemberDAO;
import VO.CommunityVO;
import VO.MemberVO;


//http://localhost:8090/greaitProject/com/Main 

@WebServlet("/com/*")
public class CommunityController extends HttpServlet {

	//CommunityDAO객체를 저장할 참조변수 선언
	CommunityDAO comDAO;
	MemberDAO memberDAO;
	
	@Override
	public void init() throws ServletException {
		comDAO = new CommunityDAO();
		memberDAO = new MemberDAO();
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
		//커뮤니티 버튼을 누르면 게시판으로 이동
		//정태영
		else if(action.equals("/list.bo")) {
			
			String loginNick = (String)session.getAttribute("nickname"); //세션에 저장된 nickname을 가져옴
			System.out.println(true);
			list = comDAO.boardListAll();//모든 CommunityVO를 List에 저장
			count = comDAO.getTotalRecord(); //모든 List의 size를 count에 저장
			
			String nowPage = request.getParameter("nowPage");
			String nowBlock = request.getParameter("nowBlock");
			System.out.println(nowPage + "페이지번호");
			System.out.println(nowBlock + "블럭위치번호");	
			
			request.setAttribute("list", list); //list와 count를 attribute에 저장하여 다음 페이지로 전송함
			request.setAttribute("count", count);
//			request.setAttribute("center","/board/list.jsp");
			
			//페이징 처리 를 위해 담는다.
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("nowBlock", nowBlock);
			nextPage = "/board/list.jsp";
//			nextPage = "/index.jsp";
		}
		
		//게시글을 클릭하였을 때 게시글 읽기
		//정태영
		else if(action.equals("/read.bo")) {
			String c_idx = request.getParameter("c_idx"); //게시글의 c_idx를 받아온다.
			String nowPage_ = request.getParameter("nowPage");
			String nowBlock_ = request.getParameter("nowBlock");
			String nickname = (String)session.getAttribute("nickname");
			vo = comDAO.boardRead(c_idx); //게시글 하나의 정보를 CommunityVO에 저장한다.
			
			request.setAttribute("vo", vo);//글번호로 조회한 글하나의 정보  
			request.setAttribute("nowPage", nowPage_); //중앙화면 read.jsp로 전달을 위해 
			request.setAttribute("nowBlock", nowBlock_);
			request.setAttribute("c_idx", c_idx);
			session.setAttribute("nickname", nickname);
			
			
			nextPage = "/board/detail.jsp";
		}
		
		//좋아요 버튼 눌렀을 때
		//정태영
		else if(action.equals("/like.bo")) {
			String c_idx = request.getParameter("c_idx");//c_idx를 받아와서 String으로 저장
			
			comDAO.addLike(c_idx); //게시글 DB의 c_like에 1을 추가하는 메서드
			vo = comDAO.getComVO(c_idx); //CommunityVO에 게시글 정보를 저장함
			String like = String.valueOf(vo.getC_like()); //out.write();에 바로 vo.getC_like를 대입하면 오류가 발생, int값을 String으로 변환시켜줌.
			System.out.println(like); 
			out.write(like);//ajax가 success하였으므로 data로 전송
			
			return;
		}
		
		//답글 버튼을 눌렀을 때
		//정태영
		else if(action.equals("/replyBoard.bo")) {
			String nickname = (String)session.getAttribute("nickname"); //답글 달 때 자동으로 닉네임을 넣기 위해 session에서 nickname을 받아온다.
			MemberVO membervo = memberDAO.getMemVO(nickname); //nickname으로 DB에 저장된 값을 얻어 membervo에 저장함
			
			String c_idx = request.getParameter("c_idx");
			
			request.setAttribute("membervo", membervo);
			request.setAttribute("c_idx", c_idx);
			
			nextPage = "/board/reply.jsp";
		}
		//글 작성 화면 요청을 했을때
		else if(action.equals("/write.bo")) {
			String loginNick = (String)session.getAttribute("nickname");
			
			MemberVO membervo = memberDAO.getMemVO(loginNick);
			request.setAttribute("center", "board/write.jsp");
			request.setAttribute("membervo", membervo);
			
			request.setAttribute("nowPage", request.getParameter("nowPage"));
			request.setAttribute("nowBlock", request.getParameter("nowBlock"));
			
			nextPage = "/board/write.jsp";

		}
		//글 작성 버튼을 눌러 글 작성 요청을 했을때
		else if(action.equals("/writePro.bo")) {
			String nick = request.getParameter("w");
			String title = request.getParameter("t");
			String content = request.getParameter("c");
			
			vo = new CommunityVO();
			vo.setC_nickname(nick);
			vo.setC_title(title);
			vo.setC_content(content);
			int result = comDAO.insertBoard(vo);
			// "1" 또는 "0"
			String go = String.valueOf(result);
			
			//write.jsp로 ($.ajax()메소드 내부의 success:function(data)의 data매개변수로 전달)
			if(go.equals("1")) {
				out.print(go);
			}else {
				out.print(go);
			}
			return;
		}
		//답글 달기 버튼을 눌렀을 때
		else if(action.equals("/replyPro.bo")) {
			//정태영
			String title = request.getParameter("title");
			String nickname = request.getParameter("writer");
			String content = request.getParameter("content");
			String super_c_idx = request.getParameter("c_idx"); //답글화면에서 입력한 title, writer, content를 받아오고, super_c_idx도 받음
			
			
			comDAO.replyInsertBoard(super_c_idx, title, nickname, content); //답글달기 기능을 수행하는 메서드를 활용하여 답글을 db에 추가함
			System.out.println(true);
			
			nextPage="/com/list.bo";
		}
		//검색 기능을 사용했을때 //한성준 03-14
		else if (action.equals("/searchlist.bo")) {
			
			String key = request.getParameter("key");//제목 + 내용 or 작성자
			String word = request.getParameter("word");//검색어
			
			//(글조회)
			list = comDAO.boardList(key,word);
			//(글 개수 조회)
			count = comDAO.getTotalRecord(key,word);
			System.out.println(key);
			System.out.println(word);
			
			request.setAttribute("list", list);
			request.setAttribute("count", count);
			
			nextPage = "/board/list.jsp";
		}
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	
	}//doHandle()메소드 끝 
}//클래스 끝








