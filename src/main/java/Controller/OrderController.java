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
import VO.InquiryHistoryVO;
import VO.InquiryHistoryVO;
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
		
		HttpSession session = request.getSession();
		
		//http://localhost:8090/greaitProject/order1/orderList.do
		//주문리스트 페이지에 들어갔을 때
		if(action.equals("/inquiryList.do")) {
			
			Vector vector = dao.getAllTechList();
			//getAllList()메소드를 사용하여 벡터에 모든 상품을 저장하여 리퀘스트를 통해 shop.jsp로 전달한다.
			
			request.setAttribute("vector", vector);
			request.setAttribute("center", "order.jsp");
			nextPage="/GreaIT.jsp";
		}
		
		if(action.equals("/shoppingList.do")) {
			
			Vector vector = dao.getAllGoodsList();
			//getAllList()메소드를 사용하여 벡터에 모든 상품을 저장하여 리퀘스트를 통해 shop.jsp로 전달한다.
			
			request.setAttribute("vector", vector);
			request.setAttribute("center", "shop.jsp");
			nextPage="/GreaIT.jsp";
		}
		
		//http://localhost:8090/greaitProject/order1/order_detail.do
		//주문리스트 디테일 페이지에 들어갔을 때
		else if(action.equals("/inquiry_detail.do")) {
			//주문리스트 페이지에서 idx를 전달받아 getVO메소드를 통해 vo에 해당 idx의 정보를 저장하고
			//리퀘스트를 통해 주문 디테일 페이지로 전달한다.
			
			int idx =  Integer.parseInt(request.getParameter("detail"));
			OrderVO vo = dao.getVO(idx);
			
			String email = (String)session.getAttribute("email");
			MemberVO membervo = dao.getUser(email);
			
			request.setAttribute("vo", vo);
			request.setAttribute("membervo", membervo);
			request.setAttribute("center", "inquiry.jsp");
			nextPage="/GreaIT.jsp";
		}
		
		else if(action.equals("/shop_detail.do")) {
			//주문리스트 페이지에서 idx를 전달받아 getVO메소드를 통해 vo에 해당 idx의 정보를 저장하고
			//리퀘스트를 통해 주문 디테일 페이지로 전달한다.
			
			int idx =  Integer.parseInt(request.getParameter("detail"));
			OrderVO vo = dao.getVO(idx);
			
			String email = (String)session.getAttribute("email");
			MemberVO membervo = dao.getUser(email);
			
			request.setAttribute("vo", vo);
			request.setAttribute("membervo", membervo);
			request.setAttribute("center", "shopDetail.jsp");
			nextPage="/GreaIT.jsp";
		}
		
		//http://localhost:8090/greaitProject/order1/orderPro.do
		//주문하기 눌렀을 때 주문 실행
		else if(action.equals("/inquiryPro.do")) {
			int idx =  Integer.parseInt(request.getParameter("idx"));
			OrderVO vo = dao.getVO(idx);
			
			String itemname = vo.getItemname();
			String image = vo.getImage();
			String info = vo.getInfo();
			String managername = vo.getManagername();
			int price = vo.getPrice();
			String buyername = request.getParameter("buyername");
			String email = request.getParameter("email");
			String phonenumber = request.getParameter("phonenumber");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");
			String address5 = request.getParameter("address5");
			String address = address1 + address2 + address3 + address4 + address5;
			String paymentmethod = request.getParameter("paymentmethod");
			
			
			InquiryHistoryVO vo2 = new InquiryHistoryVO(idx, itemname, image,
													info, managername, price, buyername, 
													email, phonenumber, address);
			dao.inquiry(vo2);
			
			
			nextPage="/GreaIT.jsp";
		}
		
		else if(action.equals("/orderPro.do")) {
			int idx =  Integer.parseInt(request.getParameter("idx"));
			OrderVO vo = dao.getVO(idx);
			
			String itemname = vo.getItemname();
			String image = vo.getImage();
			String info = vo.getInfo();
			String managername = vo.getManagername();
			int price = vo.getPrice();
			int quentity = Integer.parseInt(request.getParameter("quentity"));
			int totalprice = price * quentity;
			String buyername = request.getParameter("buyername");
			String email = request.getParameter("email");
			String phonenumber = request.getParameter("phonenumber");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			String address4 = request.getParameter("address4");
			String address5 = request.getParameter("address5");
			String address = address1 + address2 + address3 + address4 + address5;
			String paymentmethod = request.getParameter("paymentmethod");
			
			
			OrderHistoryVO vo2 = new OrderHistoryVO(idx, itemname, image,
													info, managername, price, 
													quentity, totalprice, buyername, 
													email, phonenumber, address, 
													paymentmethod);
			dao.order(vo2);
			
			
			nextPage="/GreaIT.jsp";
		}
		
		//http://localhost:8090/greaitProject/order1/orderHistory.do
		//주문내역 들어갔을 때
		else if(action.equals("/orderHistory.do")) {
			String email = (String)session.getAttribute("email");
			
			Vector shopVector = dao.getAllOrderHistory(email);
			Vector techVector = dao.getAllInquiryHistory(email);
			
			request.setAttribute("shopVector", shopVector);
			request.setAttribute("techVector", techVector);
			
			request.setAttribute("center", "orderHistory.jsp");
			nextPage="/GreaIT.jsp";
		}
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
	
}
