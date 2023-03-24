package CONTROLLER;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
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
import VO.BoardLikeVO;
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
		
		String center = null;
		
		ArrayList list = null;
		
		CommunityVO vo = null;
		
		BoardLikeVO boardLikeVO = null;
		
		HttpSession session = request.getSession();
		String ip = (String)session.getAttribute("ip");
		if(ip == null) {
			//20230321 정태영 : 로그인 안 했을 때 아이피 주소 대입, 세션값 ㄴㄴ
			//수정사항. 로그인 하지 않은 경우 반드시 ip주소를 새로 얻어 오므로 딜레이가 발생하여
			//		세션값이 ip주소를 저장하여 ip주소가 없는 경우에만 받아오게 변경함
			try (java.util.Scanner s = new java.util.Scanner(new java.net.URL("https://api64.ipify.org").openStream(), "UTF-8").useDelimiter("\\A")) {
				System.out.println("세션값에 저장된 ip주소가 없으므로 새로 생성함 : " + String.valueOf(ip));
				ip = s.next();
				session.setAttribute("ip", ip);
			} catch (java.io.IOException e) {
			    e.printStackTrace();
			}
		}
		System.out.println("ip 주소 : " + ip);
		
		PrintWriter out = response.getWriter();
		
		int count = 0;
		
		//필터 적용할 때 계속 같은 구문을 써야 해서 간소화시키기 위해 내부 클래스를 만들었는데
		//만들고 보니 굳이 필요할까 싶기도 해서 나중에 삭제할 수도 있음. -정태영
		class EasyList {
			public void list() {
				List noticeList = comDAO.getAllNotice();
				int noticeCount = comDAO.getTotalNoticeRecord();
				System.out.println("list, noticeCount : " + noticeCount);
				
				String loginNick = (String)session.getAttribute("m_nickname"); //세션에 저장된 nickname을 가져옴
				String nowPage = request.getParameter("nowPage");
				String nowBlock = request.getParameter("nowBlock");
				System.out.println(nowPage + "페이지번호");
				System.out.println(nowBlock + "블럭위치번호");	
				
				request.setAttribute("center","/board/list.jsp");
				
				//페이징 처리 를 위해 담는다.
				request.setAttribute("nowPage", nowPage);
				request.setAttribute("nowBlock", nowBlock);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("noticeCount", noticeCount);
			}
		}
		
		if(action.equals("/Main")) {
			
			nextPage = "/index.jsp";
		}
		
		//http://localhost:8090/greaitProject/com/list.bo
		//커뮤니티 버튼을 누르면 게시판으로 이동
		//정태영
		
		//20230321 정태영 : 내부클래스를 만듦으로써 기존 list.bo의 역할은 listByRecent가 대신하게 되었음.
		//현재로써는 필요없는 데이터, 일단 내부클래스에 문제가 있을 수도 있으므로 남겨둘 것임.
		else if(action.equals("/list.bo")) {
			list = comDAO.listByRecent();//모든 CommunityVO를 List에 저장
			
			String loginNick = (String)session.getAttribute("m_nickname"); //세션에 저장된 nickname을 가져옴
			count = comDAO.getTotalRecord(); //모든 List의 size를 count에 저장
			
			String nowPage = request.getParameter("nowPage");
			String nowBlock = request.getParameter("nowBlock");
			System.out.println(nowPage + "페이지번호");
			System.out.println(nowBlock + "블럭위치번호");	
			
			request.setAttribute("list", list); //list와 count를 attribute에 저장하여 다음 페이지로 전송함
			request.setAttribute("count", count);
			request.setAttribute("center","/board/list.jsp");
			
			//페이징 처리 를 위해 담는다.
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("nowBlock", nowBlock);
//			nextPage = "/board/list.jsp";
			nextPage = "/index.jsp";
		}
		
		
		//20230321 정태영 : 개념글 버튼을 눌렀을 때
		else if(action.equals("/bestPost.bo")) {
			EasyList easyList = new EasyList();
			
			list = comDAO.listByLike();//모든 CommunityVO를 List에 저장
			count = comDAO.getBestPostRecord(); //모든 List의 size를 count에 저장
			easyList.list();
			request.setAttribute("list", list); //list와 count를 attribute에 저장하여 다음 페이지로 전송함
			request.setAttribute("count", count);
			nextPage = "/index.jsp";
		}
		//20230321 정태영 : 좋아요 순 버튼을 눌렀을 때
		else if(action.equals("/listByLike.bo")) {
			EasyList easyList = new EasyList();
			
			list = comDAO.listByLike();//모든 CommunityVO를 List에 저장
			count = comDAO.getTotalRecord(); //모든 List의 size를 count에 저장
			easyList.list();
			request.setAttribute("list", list); //list와 count를 attribute에 저장하여 다음 페이지로 전송함
			request.setAttribute("count", count);
			nextPage = "/index.jsp";
		}
		//20230321 정태영 : 조회수 순 버튼을 눌렀을 때
		else if(action.equals("/listByViews.bo")) {
			EasyList easyList = new EasyList();
			
			list = comDAO.listByViews();//모든 CommunityVO를 List에 저장
			count = comDAO.getTotalRecord(); //모든 List의 size를 count에 저장
			easyList.list();
			request.setAttribute("list", list); //list와 count를 attribute에 저장하여 다음 페이지로 전송함
			request.setAttribute("count", count);
			nextPage = "/index.jsp";
		}
		//20230321 정태영 : 최신순 버튼을 눌렀을 때
		else if(action.equals("/listByRecent.bo")) {
			EasyList easyList = new EasyList();
			
			list = comDAO.listByRecent();//모든 CommunityVO를 List에 저장
			count = comDAO.getTotalRecord(); //모든 List의 size를 count에 저장
			easyList.list();
			request.setAttribute("list", list); //list와 count를 attribute에 저장하여 다음 페이지로 전송함
			request.setAttribute("count", count);
			nextPage = "/index.jsp";
		}
		
		//게시글을 클릭하였을 때 게시글 읽기
		//정태영
		else if(action.equals("/read.bo")) {
			String c_idx = request.getParameter("c_idx"); //게시글의 c_idx를 받아온다.
			String nowPage_ = request.getParameter("nowPage");
			String nowBlock_ = request.getParameter("nowBlock");
			String nickname = (String)session.getAttribute("m_nickname");
			System.out.println("read.bo 닉네임: " + nickname);
			//20230321 정태영 : 로그인 하지 않았을 경우 닉네임에 아이피 주소를 대입함
			if(nickname == null) {
				nickname = ip;
			}
			System.out.println("1");
			vo = comDAO.boardRead(c_idx); //게시글 하나의 정보를 CommunityVO에 저장한다.
			System.out.println("2");
			boardLikeVO = comDAO.getBoardlikeVO(c_idx, nickname);
			
			System.out.println("3");
			request.setAttribute("boardLikeVO", boardLikeVO);
			request.setAttribute("vo", vo);//글번호로 조회한 글하나의 정보  
			request.setAttribute("nowPage", nowPage_); //중앙화면 read.jsp로 전달을 위해 
			request.setAttribute("nowBlock", nowBlock_);
			request.setAttribute("c_idx", c_idx);
			request.setAttribute("center","/board/detail.jsp");
			
//			nextPage = "/board/detail.jsp";
			nextPage = "/index.jsp";
		}
		//0323 정태영 : 공지 클릭했을 때
		else if(action.equals("/noticeRead.bo")) {
			String c_idx = request.getParameter("c_idx"); //게시글의 c_idx를 받아온다.
			String nowPage_ = request.getParameter("nowPage");
			String nowBlock_ = request.getParameter("nowBlock");
			String nickname = (String)session.getAttribute("m_nickname");
			System.out.println("read.bo 닉네임: " + nickname);
			//20230321 정태영 : 로그인 하지 않았을 경우 닉네임에 아이피 주소를 대입함
			if(nickname == null) {
				nickname = ip;
			}
			vo = comDAO.noticeRead(c_idx); //게시글 하나의 정보를 CommunityVO에 저장한다.
			boardLikeVO = comDAO.getnoticeLikeVO(c_idx, nickname);
			request.setAttribute("boardLikeVO", boardLikeVO);
			request.setAttribute("vo", vo);//글번호로 조회한 글하나의 정보  
			request.setAttribute("nowPage", nowPage_); //중앙화면 read.jsp로 전달을 위해 
			request.setAttribute("nowBlock", nowBlock_);
			request.setAttribute("c_idx", c_idx);
			request.setAttribute("center","/board/noticeDetail.jsp");
			
			nextPage = "/index.jsp";
		}
		
		//좋아요 버튼 눌렀을 때
		//정태영
		else if(action.equals("/like.bo")) {
			String c_idx = request.getParameter("c_idx");//c_idx를 받아와서 String으로 저장
			String nickname = (String)session.getAttribute("m_nickname");
			if(nickname == null) {
				System.out.println("like.bo ip주소 : " + ip);
				nickname = ip;
			}
			
			
			boardLikeVO = comDAO.addLike(c_idx, nickname); //게시글 DB의 c_like에 1을 추가하는 메서드
			vo = comDAO.getComVO(c_idx); //CommunityVO에 게시글 정보를 저장함
			
			if(!vo.getC_nickname().equals(nickname)) {
				//0324 정태영 : 좋아요를 받은 대상에게 경험치 3을 제공, 본인 게시글에 좋아요 누르는 것으로는 경험치 못 얻음
				System.out.println(nickname);
				System.out.println(vo.getC_nickname());
				memberDAO.updateExp(vo.getC_nickname(), 3);
			}
			
			String like = String.valueOf(vo.getC_like()); //out.write();에 바로 vo.getC_like를 대입하면 오류가 발생, int값을 String으로 변환시켜줌.
			out.write(like);//ajax가 success하였으므로 data로 전송
			
			return;
		}
		//좋아요 취소를 클릭했을 때
		//정태영
		else if(action.equals("/likeCancel.bo")) {
			String c_idx = request.getParameter("c_idx");//c_idx를 받아와서 String으로 저장
			String nickname = (String)session.getAttribute("m_nickname");
			if(nickname == null) {
				System.out.println("likeCancel.bo ip주소 : " + ip);
				nickname = ip;
			}
			
			boardLikeVO = comDAO.CancelLike(c_idx, nickname); //게시글 DB의 c_like에 1을 추가하는 메서드
			vo = comDAO.getComVO(c_idx); //CommunityVO에 게시글 정보를 저장함

			if(!vo.getC_nickname().equals(nickname)) {
				System.out.println(nickname);
				System.out.println(vo.getC_nickname());
				//0324 정태영 : 좋아요를 받은 대상에게 경험치 -3을 제공, 본인 게시글에 좋아요 누르는 것으로는 경험치 못 얻음
				memberDAO.updateExp(vo.getC_nickname(), -3);
			}
			
			System.out.println(vo);
			String like = String.valueOf(vo.getC_like()); //out.write();에 바로 vo.getC_like를 대입하면 오류가 발생, int값을 String으로 변환시켜줌.
			out.write(like);//ajax가 success하였으므로 data로 전송
			return;
		}
		
		// 0323 정태영 : 공지 좋아요
		else if(action.equals("/noticeLike.bo")) {
			String c_idx = request.getParameter("c_idx");//c_idx를 받아와서 String으로 저장
			String nickname = (String)session.getAttribute("m_nickname");
			if(nickname == null) {
				System.out.println("like.bo ip주소 : " + ip);
				nickname = ip;
			}
			
			
			boardLikeVO = comDAO.addNoticeLike(c_idx, nickname); //게시글 DB의 c_like에 1을 추가하는 메서드
			vo = comDAO.getNoticeVO(c_idx); //CommunityVO에 게시글 정보를 저장함
			String like = String.valueOf(vo.getC_like()); //out.write();에 바로 vo.getC_like를 대입하면 오류가 발생, int값을 String으로 변환시켜줌.
			out.write(like);//ajax가 success하였으므로 data로 전송
			
			return;
		}
		//좋아요 취소를 클릭했을 때
		//정태영
		else if(action.equals("/noticeLikeCancel.bo")) {
			String c_idx = request.getParameter("c_idx");//c_idx를 받아와서 String으로 저장
			String nickname = (String)session.getAttribute("m_nickname");
			if(nickname == null) {
				System.out.println("likeCancel.bo ip주소 : " + ip);
				nickname = ip;
			}
			
			boardLikeVO = comDAO.CancelNoticeLike(c_idx, nickname); //게시글 DB의 c_like에 1을 추가하는 메서드
			vo = comDAO.getNoticeVO(c_idx); //CommunityVO에 게시글 정보를 저장함
			String like = String.valueOf(vo.getC_like()); //out.write();에 바로 vo.getC_like를 대입하면 오류가 발생, int값을 String으로 변환시켜줌.
			out.write(like);//ajax가 success하였으므로 data로 전송
			
			return;
		}
		
		
		//답글 버튼을 눌렀을 때
		//정태영
		else if(action.equals("/replyBoard.bo")) {
			String nickname = (String)session.getAttribute("m_nickname"); //답글 달 때 자동으로 닉네임을 넣기 위해 session에서 nickname을 받아온다.
			MemberVO membervo = memberDAO.getMemVO(nickname); //nickname으로 DB에 저장된 값을 얻어 membervo에 저장함
			
			String c_idx = request.getParameter("c_idx");
			
			request.setAttribute("membervo", membervo);
			request.setAttribute("c_idx", c_idx);
			
			nextPage = "/board/reply.jsp";
		}
		//글 작성 화면 요청을 했을때
		else if(action.equals("/write.bo")) {
			
			request.setAttribute("center", "board/write.jsp");
			request.setAttribute("nowPage", request.getParameter("nowPage"));
			request.setAttribute("nowBlock", request.getParameter("nowBlock"));
			
			nextPage = "/board/write.jsp";

		}
		//글 작성 버튼을 눌러 글 작성 요청을 했을때
		else if(action.equals("/writePro.bo")) {
			String nick = request.getParameter("w");
			String title = request.getParameter("t");
			String content = request.getParameter("c");
			String pass = request.getParameter("p");
			vo = new CommunityVO();
			vo.setC_nickname(nick);
			vo.setC_title(title);
			vo.setC_content(content);
			vo.setC_password(pass);
			int result = comDAO.insertBoard(vo);
			
			String nickname = (String)session.getAttribute("m_nickname");
			//0324 정태영 : 세션에 닉네임이 저장되어 있으면 사용자의 경험치를 증가시킴
			if(nickname != null) {
				System.out.println("writePro.bo 세션값에 닉네임이 저장되어 있습니다.");
				memberDAO.updateExp(nickname, 2);
			}
			
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
		//0321 정태영 : write.jsp에서 공지글로 쓰기 체크하고 등록을 눌렀을 때
		else if(action.equals("/noticePro.bo")) {
			System.out.println(true);
			
			String nick = request.getParameter("w");
			String title = request.getParameter("t");
			String content = request.getParameter("c");
			String pass = request.getParameter("p");
			vo = new CommunityVO();
			vo.setC_nickname(nick);
			vo.setC_title(title);
			vo.setC_content(content);
			vo.setC_password(pass);
			int result = comDAO.insertNoticeBoard(vo);
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
		//정태영
		else if(action.equals("/replyPro.bo")) {
			//정태영
			String title = request.getParameter("title");
			String nickname = request.getParameter("writer");
			String content = request.getParameter("content");
			String pass = request.getParameter("pass");
			String super_c_idx = request.getParameter("c_idx"); //답글화면에서 입력한 title, writer, content를 받아오고, super_c_idx도 받음
			
			
			String nickname_ = (String)session.getAttribute("m_nickname");
			//0324 정태영 : 세션에 닉네임이 저장되어 있으면 사용자의 경험치를 증가시킴
			if(nickname_ != null) {
				System.out.println("writePro.bo 세션값에 닉네임이 저장되어 있습니다.");
				memberDAO.updateExp(nickname_, 2);
			}
			
			comDAO.replyInsertBoard(super_c_idx, title, nickname, content, pass); //답글달기 기능을 수행하는 메서드를 활용하여 답글을 db에 추가함
			
			nextPage="/com/listByRecent.bo?nowPage=0&nowBlock=0";
		}

		//검색 기능을 사용했을때 //한성준 03-14
		else if (action.equals("/searchlist.bo")) {
			List noticeList = comDAO.getAllNotice();
			int noticeCount = comDAO.getTotalNoticeRecord();
			String key = request.getParameter("key");//제목 + 내용 or 작성자
			String word = request.getParameter("word");//검색어
			
			request.setAttribute("noticeList", noticeList);
			request.setAttribute("noticeCount", noticeCount);
			//(글조회)
			list = comDAO.boardList(key,word);
			//(글 개수 조회)
			count = comDAO.getTotalRecord(key,word);
			System.out.println(key);
			System.out.println(word);
			
			request.setAttribute("center","/board/list.jsp");
			request.setAttribute("list", list);
			request.setAttribute("count", count);
			
			nextPage = "/index.jsp";
		}
		
		System.out.println(nextPage);
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	
	}//doHandle()메소드 끝 
}//클래스 끝