package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
			nextPage = "/greaitMain.jsp";
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
			
			
			nextPage="/greaitMain.jsp";
		}
		
	//	
		else if(action.equals("/login.me")) {//로그인 창으로 이동
			String email = request.getParameter("email");
			String pw = request.getParameter("pw");
			
					
		}
		
		else if(action.equals("/loginPro.me")) {//로그인 수행
			
		}
		
		else if(action.equals("/logoutPro.me")) {//로그아웃 수행
		
			
			
		}		
	//
		
		
		
		else if(action.equals("/mypage.me")) {//마이페이지로 이동
			
		}
		
		else if(action.equals("/update.me")) {//회원정보 수정
			
		}
		
		else if(action.equals("/signOut.me")) {//회원탈퇴
			
		}		
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		
		dispatch.forward(request, response);
	}
	
}
