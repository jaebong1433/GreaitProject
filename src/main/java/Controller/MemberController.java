package Controller;

import java.io.IOException;
import java.io.PrintWriter;

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

	MemberDAO memberdao;
	
	@Override
	public void init() throws ServletException {
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
		
		
		if(action.equals("/join.me")) {
			center = request.getParameter("center"); //members/join.jsp  중앙화면뷰 주소 얻기
			request.setAttribute("center", center);//members/join.jsp  중앙화면뷰 주소 바인딩 
			nextPage = "/GreaIT.jsp";
		}
		
		else if(action.equals("/joinIdCheck.me")) {
			//입력한 아이디 얻기
			String id = request.getParameter("emailId");

			//입력한 아이디가 DB에 저장되어 있는지 중복 체크 작업 
			//true -> 중복 , false -> 중복아님  둘중 하나를 반환 받음
			boolean result = memberdao.overlappedId(id);
			
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
		}
		
		else if(action.equals("/joinPro.me")) {//회원가입 실행
			//요청한 값 얻기
			String email = request.getParameter("email");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String phoneNum = request.getParameter("phoneNum");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");
			String address5 = request.getParameter("address5");
			String address = address1+address2+address3+address4+address5;
			
			MemberVO vo = new MemberVO(email,
									   pw,
									   name,
									   phoneNum,
									   address
									   );
			
			memberdao.insertMember(vo);

			nextPage="/GreaIT.jsp";

		}
		
	//	2-27일 로그인 수행 작성
		else if(action.equals("/login.me")) {//로그인 창으로 이동
			
			center = request.getParameter("center");
			
			//중앙화면 주소 바인딩
			request.setAttribute("center", center);
			
			//전체 메인화면 주소 저장

			nextPage = "/GreaIT.jsp";
		}
		
		else if(action.equals("/loginPro.me")) {//로그인 수행
			String login_email = request.getParameter("login_email");
			String login_pw = request.getParameter("login_pw");
			
			int check = memberdao.loginCheck(login_email, login_pw);

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
			}
			//session메모리생성
			HttpSession session = request.getSession();
			//session메모리에 입력한 아이디 바인딩(저장)
			session.setAttribute("email", login_email);
			
			//메인화면 VIEW 주소
			nextPage = "/GreaIT.jsp";


		}
		
		else if(action.equals("/logoutPro.me")) {//로그아웃 수행
			//기존에 생성했던 session메모리 얻기
			HttpSession session = request.getSession();
			session.invalidate();

			nextPage = "/GreaIT.jsp";

		}		
	
		else if (action.equals("/logout.me")) {//로그아웃
			
			HttpSession session = request.getSession();
			
			session.invalidate();
					
			nextPage = "/GreaIT.jsp";
			
		}
		
		else if(action.equals("/mypage.me")) {//마이페이지로 이동
			
		}
		
		else if(action.equals("/findId.me")) {//아이디 찾기
			
			String name = request.getParameter("name");
			String phoneNum = request.getParameter("phoneNum");
			
			
			MemberVO vo = memberdao.findId(name,phoneNum);
			
			request.setAttribute("vo", vo);
			
			request.setAttribute("center","findId.jsp");
			
			
			nextPage = "/GreaIT.jsp";
		}
		
		else if (action.equals("/findPw.me")) {//비밀번호 찾기
			
			String name = request.getParameter("name");
			String phoneNum = request.getParameter("phoneNum");
			String email = request.getParameter("email");
			
			
			MemberVO vo = memberdao.findPw(name,phoneNum,email);
			
			request.setAttribute("vo", vo);
			
			request.setAttribute("center","findPw.jsp");
			
			
			nextPage = "/GreaIT.jsp";
			
	
			
		}
		
		//메인화면에서 회원정보 수정버튼을 클릭했을 때...
		else if(action.equals("/updateForm.do")){
			String email = request.getParameter("email");
			
			MemberVO memInfo = memberdao.findMember(email);
			
			request.setAttribute("memInfo", memInfo);
			
			nextPage = "/GreaIT.jsp";
		}
		
		//회원정보 수정창에서 수정하기 버튼을 클릭했을 때..
		else if(action.equals("/update.me")) {
			String email = request.getParameter("email");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String phoneNum = request.getParameter("phoneNum");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");
			String address5 = request.getParameter("address5");
			String address = address1+address2+address3+address4+address5;
			
			MemberVO vo = new MemberVO(email,pw,name,phoneNum,address);
			
		}
		
		else if(action.equals("/signOut.me")) {//회원탈퇴
			String email = request.getParameter("email");
			
			memberdao.delMember(email);
			
			request.setAttribute("msg", "deleted");
			
			nextPage = "/listMembers.do";
		}		
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		
		dispatch.forward(request, response);
	}
	
}
