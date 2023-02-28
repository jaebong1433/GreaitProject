package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
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
import DAO.OrderDAO;
import VO.MemberVO;
import VO.OrderHistoryVO;
import VO.OrderVO;

@WebServlet("/order1/*") 
public class OrderController extends HttpServlet {

	OrderDAO dao;
	
	@Override
	public void init() throws ServletException {
		dao = new OrderDAO();
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
		
		//주문리스트 페이지에 들어갔을 때
		if(action.equals("/orderList.do")) {
			
			Vector vector = dao.getAllList();
			//getAllList()메소드를 사용하여 벡터에 모든 상품을 저장하여 리퀘스트를 통해 shop.jsp로 전달한다.
			
			request.setAttribute("vector", vector);
			request.setAttribute("center", "shop.jsp");
			nextPage="/GreaIT.jsp";
		}
		
		//주문리스트 디테일 페이지에 들어갔을 때
		else if(action.equals("/order_detail.do")) {
			//주문리스트 페이지에서 idx를 전달받아 getVO메소드를 통해 vo에 해당 idx의 정보를 저장하고
			//리퀘스트를 통해 주문 디테일 페이지로 전달한다.
			
			int idx =  Integer.parseInt(request.getParameter("detail"));
			OrderVO vo = dao.getVO(idx);
			
			request.setAttribute("vo", vo);
			request.setAttribute("center", "shopDetail.jsp");
			nextPage="/GreaIT.jsp";
		}
		
		else if(action.equals("/orderPro.do")) {
			int idx =  Integer.parseInt(request.getParameter("idx"));
			OrderVO vo = dao.getVO(idx);
			
			String buyername = request.getParameter("buyername");
			String address = request.getParameter("address");
			String phonenumber = request.getParameter("phonenumber");
			int quentity = Integer.parseInt(request.getParameter("quentity"));
			String paymentmethod = request.getParameter("paymentmethod");
			
			String image = vo.getImage();
			String info = vo.getInfo();
			int price = vo.getPrice();
			
			OrderHistoryVO vo2 = new OrderHistoryVO(image, info, quentity, price, buyername, phonenumber, address, paymentmethod, idx);
			dao.order(vo2);
			
			
			nextPage="/GreaIT.jsp";
		}
		
		else if(action.equals("/orderHistory.do")) {
			
		}
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
	
}
