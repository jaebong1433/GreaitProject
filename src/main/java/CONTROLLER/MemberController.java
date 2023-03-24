package CONTROLLER;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import DAO.MemberDAO;
import VO.MemberVO;

@WebServlet("/member1/*") 
public class MemberController extends HttpServlet {
	//멤버 서비스 추가
	
		MemberDAO memberdao;
	
		@Override
		public void init() throws ServletException {
			memberdao = new MemberDAO();
			//멤버 서비스 
		
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
			
			//메인화면 요청주소
			if(action.equals("/main.me")) {
				
				
				nextPage = "/Crawling/maincenter.me";
			
			//회원 가입 눌렀을때 보여주는페이지
			}else if (action.equals("/join1.me")) {
				
				
				nextPage = "/Member/join1.jsp";
				
				
			//회원가입 약관동의 했을경우 다음패이지로 확인	
			}else if (action.equals("join2.me")) {
				
				
				nextPage = "/Member/join2.jsp";
				
			
			//회원가입 실행 
			}else if(action.equals("/joinPro.me")) {
				//요청한 값 얻기
				String m_nickname = request.getParameter("m_nickname");
				String m_id = request.getParameter("m_id");
				String m_pw = request.getParameter("m_pw");
				String m_name = request.getParameter("m_name");
				String m_email = request.getParameter("m_email");
			
				
				MemberVO vo = new MemberVO(
											m_nickname,
											m_id,
											m_pw,
											m_name,
											m_email);
				
				
				memberdao.insertMember(vo);

				nextPage= "/Member/join3.jsp";

				
			//회원가입 닉네임 얻기
			}else if (action.equals("/joinNicknameCheck.me")) {
				//입력한 닉네임 얻기
				String m_nickname = request.getParameter("m_nickname");
				
				boolean result = memberdao.overlappedNickname(m_nickname);
			
				if(result == true) {
					out.write("not_usable");
					return;
				}else {
					out.write("usable");
					return;
				}
				

			//회원가입 아이디 얻기
			}else if(action.equals("/joinIdCheck.me")) {
			//입력한 아이디 얻기
				String m_id = request.getParameter("m_id");
			
				//입력한 아이디가 DB에 저장되어 있는지 중복 체크 작업 
				//true -> 중복 , false -> 중복아님  둘중 하나를 반환 받음
				boolean result = memberdao.overlappedId(m_id);
			
				//아이디 중복결과를 다시 한번 확인 하여 조건값을 
				//join.jsp파일과 연결된 join.js파일에 작성해 놓은
				//success:function의 data매개변수로 웹브라우저를 거쳐 보냅니다!
				if(result == true) {
					out.write("not_usable");
					return;
				}else {
					out.write("usable");
					return;
				}
			
				
			//회원가입 이메일 얻기
			}else if(action.equals("/joinEmailCheck.me")) {
			//입력한 이메일 얻기
				String m_email = request.getParameter("m_email");
				
				//입력한 이메일이 DB에 저장되어 있는지 중복 체크 작업 
				//true -> 중복 , false -> 중복아님  둘중 하나를 반환 받음
				boolean result = memberdao.overlappedEmail(m_email);
				
				//이메일 중복결과를 다시 한번 확인 하여 조건값을 
				//join.jsp파일과 연결된 join.js파일에 작성해 놓은
				//success:function의 data매개변수로 웹브라우저를 거쳐 보냅니다!
				if(result == true) {
					out.write("not_usable");
					return;
				}else {
					out.write("usable");
					return;
				}
			
				
			
			//로그인 수행
			}else if(action.equals("/login.me")) {//로그인 창으로 이동
			

				nextPage = "/Member/login.jsp";			
				
			
			//로그인 유효성검
			}else if(action.equals("/loginPro.me")) {//로그인 수행
				String m_id = request.getParameter("m_id");
				String m_pw = request.getParameter("m_pw");
				String nickname = null;
				
				int check = memberdao.loginCheck(m_id, m_pw);

				if(check == 0) {//아이디는 맞고 비번 틀림
					out.println("<script>");
					out.println(" window.alert('비밀번호 틀림');");
					out.println(" history.go(-1);");
					out.println("</script>");
					return;
				}else if(check == -1) {//아이디 틀림 , 비밀번호 맞음 	
					out.println("<script>");
					out.println(" window.alert('아이디 틀림');");
					out.println(" history.back();");
					out.println("</script>");
					return;				
				}else if(check == 1){
					nickname = memberdao.logName(m_id);
				}
				//session메모리생성
				HttpSession session = request.getSession();
				
				//session메모리에 입력한 아이디 바인딩(저장)
				session.setAttribute("m_nickname", nickname);
				
				//메인화면 VIEW 주소
				nextPage = "/Crawling/maincenter.me";

		
			//로그아웃 수행	
			}else if(action.equals("/logoutPro.me")) {//로그아웃 수행
					//기존에 생성했던 session메모리 얻기
				HttpSession session = request.getSession();
				session.invalidate();
		
				nextPage = "/Crawling/maincenter.me";
		
				
					
			//로그아웃 실행
			}else if (action.equals("/logout.me")) {//로그아웃
					
				HttpSession session = request.getSession();
					
				session.invalidate();
							
				nextPage = "/Crawling/maincenter.me";
				
				
			// 아이디 찾기 
			}else if(action.equals("/findID.me")) {//아이디 찾기
					
				//request.setAttribute("center","findId.jsp");
					
				nextPage = "/Member/findID.jsp";
				
				
			//아이디 찾기 수행	
			}else if(action.equals("/findIdResult.me")) {//아이디 찾기
					
				String m_name = request.getParameter("m_name");
				String m_email = request.getParameter("m_email");
					
				
				String m_id = memberdao.findId(m_name,m_email);
					
					
				if( m_id == null) {//
					out.println("<script>");
					out.println(" window.alert('회원 정보가 틀립니다 다시 입력해주세요');");
					out.println(" history.go(-1);");
					out.println("</script>");
					return;
				}else if (m_id != null){
					request.setAttribute("m_id", m_id);
					
				}
				

				
				nextPage = "/Member/findID2.jsp";
					
					
			
			//비밀번호 찾기수행
			}else if (action.equals("/findPW.me")) {//비밀번호 찾기수행
					
					
					nextPage = "/Member/findPW.jsp";
					
					
			//비밀번호 찾기 실행
			}else if(action.equals("/findPwResult.me")) {//비밀번호 찾기
					
				String m_name = request.getParameter("m_name");
				String m_id= request.getParameter("m_id");
				String m_email = request.getParameter("m_email");

				String m_pw = memberdao.findPW(m_name,m_id,m_email);
					
				
					
				if(m_pw == null) {//
					out.println("<script>");
					out.println(" window.alert('회원 정보가 틀립니다 다시 입력해주세요');");
					out.println(" history.go(-1);");
					out.println("</script>");
					return;
				}else if (m_pw != null){
					request.setAttribute("m_pw", m_pw);
					
				}
				
				
				nextPage = "/Member/findPW2.jsp";
				
				
			
			//카카오 로그인창에서 로그인 버튼을 눌렀을 때
			}else if(action.equals("/kakaoLoginPro.me")) {
				
				//---부장
				
					
				//메인화면 view 주소
				nextPage ="/Crawling/maincenter.me";
			
		
			//회원정보 수정을 위해 회원정보 조회 요청!
			}else if(action.equals("/mypage.me")) { 
				//요청한 값 얻기
				String m_nickname = request.getParameter("m_nickname");
					
				MemberVO vo = memberdao.findMember(m_nickname);
				
				//View중앙화면에 보여주기 위해 request에  vo를 바인딩
				request.setAttribute("vo", vo);
				
				request.setAttribute("center", "/Member/myPage.jsp");
				
	
				nextPage = "/index.jsp";
			
				
			//회원 정보수정을 위한 회원 확인 비밀번호인증	
			}else if (action.equals("/mypageUpdate.me")) {
				
				request.setAttribute("center", "/Member/modMemberForm.jsp");
				
				
				nextPage = "/index.jsp";
				
			
				
			//회원 정보수정을 위한 회원 확인 비밀번호인증
			}else if (action.equals("/mypageUpdate1.me")) {
				
				String m_nickname = request.getParameter("m_nickname");
				String m_pw = request.getParameter("m_pw");
				
				MemberVO vo = memberdao.getMemVO(m_nickname);
				String loginPw = vo.getM_pw();
				System.out.println(m_pw);
				System.out.println(loginPw);
				
				if(loginPw.equals(m_pw)) {
					
					request.setAttribute("vo", vo);	
					nextPage = "/Member/modMemberForm1.jsp";
					
				}else {
					
					
					out.println("<script>");
					out.println(" window.alert('비밀번호가 틀립니다 다시 입력해주세요');");
					out.println(" history.go(-1);");
					out.println("</script>");
					return;
				}
				
				
			
			//회원정보 수정창에서 수정완료 버튼을 클릭했을 때
			}else if(action.equals("/update.me")) {
				int result = memberdao.updateMember(request);
				
				if(result == 1) {//수정 성공
					
					
				out.print("<script>" + "  alert('회원정보가 수정 되었습니다.');" 
					                     + " location.href='" + request.getContextPath()
										 + "/member1/main.me'"
		                  + "</script>");

				return;
					
				}else {
					
					out.print("<script>"
							+ " alert('회원정보 수정 실패!');"
							+ " history.back();"
							+ "</script>");
					return;
					
				}
				
				
				
			//회원탈퇴를 위해 비밀번호를 입력하는 화면 요청! 
			}else if(action.equals("/delete.me")) {
			
				nextPage = "/Member/Delete.jsp";
				
				
			
			//회원탈퇴 
			}else if(action.equals("/signOut.me")) {
				//요청한 값 얻기
				//삭제할 예약아이디, 삭제를 위해 입력한 비밀번호 
				String m_id = request.getParameter("m_id")  ;
				String m_pw = request.getParameter("m_pw");
				
				//응답할 값 마련 
				//예약정보를 삭제(취소)하기 위해 CarDAO객체의 OrderDelete메소드 호출할떄...
				//매개변수로 삭제할 예약아이디와 입력한 비밀번호 전달하여 DB에서 DELETE시키자
				//삭제에 성공하면 OrderDelete메소드의 반환값은 삭제에 성공한 레코드 개수 1을 반환 받고
				//실패하면 0을 반환 받습니다.
				int result = memberdao.MemberDelete(m_id,m_pw);
				
				System.out.println(result);
				
				if(result == 1) {//삭제 성공
					
					
					out.print("<script>" 
								+ "  alert('회원정보가 탈퇴되었습니다.');" 
								+ " location.href='" + request.getContextPath()
			                    + "/member1/logout.me'" 
		                  + "</script>");
	
					return;
					
				}else {
					
					out.print("<script>"
							+ " alert('회원정보 탈퇴 실패!');"
							+ " history.back();"
							+ "</script>");
					return;
				}
				
				
			}		
		
			//포워딩 (디스패처 방식)
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		
			dispatch.forward(request, response);
			}
	
		}
