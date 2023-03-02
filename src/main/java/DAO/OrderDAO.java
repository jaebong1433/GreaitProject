package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import VO.MemberVO;
import VO.OrderHistoryVO;
import VO.OrderVO;

//DB와 연결하여 비즈니스로직 처리 하는 클래스 
public class OrderDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	//커넥션풀 생성 후 커넥션 객체 얻는 생성자
	public OrderDAO() {
		//context.xml파일에 설정한
		//Resource태그에 적힌  DataSource커넥션풀 객체 받아오기	
		try {
			//웹프로젝트의 디렉터리에 접근하기 위한 객체 생성
			Context ctx = new InitialContext();
			//커넥션풀 얻기 
			ds = (DataSource)ctx.lookup("java:/comp/env/jdbc/oracle");
		
		} catch (Exception e) {
			System.out.println("DB연결 실패! - " + e);
		}	
	}
	
	//자원해제 기능
	private void closeResource() {
		if(con != null)try {con.close();} catch (Exception e) {e.printStackTrace();}
		if(pstmt != null)try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
		if(rs != null)try {rs.close();} catch (Exception e) {e.printStackTrace();}		
	}	
	
	public Vector getAllList() {
		Vector vector = new Vector();
		
		OrderVO vo = null;
		
		try {
			
			con = ds.getConnection();
			String sql = "select * from order_list";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			
			while(rs.next()) {
				vo = new OrderVO(rs.getInt("idx"), 
								 rs.getString("itemname"), 
								 rs.getString("image"), 
								 rs.getString("info"), 
								 rs.getString("managername"), 
								 rs.getInt("price"));
				vector.add(vo);
			}
		} catch(Exception e) {
			System.out.println("getAllList");
			e.printStackTrace();
		} finally {
			closeResource();
		}
		
		return vector;
	};
	
	public OrderVO getVO(int idx) {
		OrderVO vo = null;
		try {
			con = ds.getConnection();
			
			String sql = "select * from order_list where idx=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new OrderVO(rs.getInt("idx"), 
						 rs.getString("itemname"), 
						 rs.getString("image"), 
						 rs.getString("info"), 
						 rs.getString("managername"), 
						 rs.getInt("price"));
			}
			
		} catch(Exception e) {
			System.out.println("getVO");
			e.printStackTrace();
		} finally {
			closeResource();
		}
		
		return vo;
	}
	
	public void order(OrderHistoryVO vo) {
		try {
			con = ds.getConnection();
			
			String sql = "insert into orderhistory VALUES (ORDER_IDX.nextval, "
														+ "?, "
														+ "?, "
														+ "?, "
														+ "?, "
														+ "?, "
														+ "?, "
														+ "?, "
														+ "?, "
														+ "?, "
														+ "?, "
														+ "?, "
														+ "?, "
														+ "SYSTIMESTAMP)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getItemname());
			pstmt.setString(2, vo.getImage());
			pstmt.setString(3, vo.getInfo());
			pstmt.setString(4, vo.getManagername());
			pstmt.setInt(5, vo.getPrice());
			pstmt.setInt(6, vo.getQuentity());
			pstmt.setInt(7, vo.getTotalprice());
			pstmt.setString(8, vo.getName());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getPhonenumber());
			pstmt.setString(11, vo.getAddress());
			pstmt.setString(12, vo.getPaymentmethod());
			
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("order");
			e.printStackTrace();
		} finally {
			closeResource();
		}
	}
	public Vector getAllOrderHistory(String email) {
		Vector vector = new Vector();
		OrderHistoryVO vo = null;
		
		try {
			con = ds.getConnection();
			
			String sql="select * from orderHistory where email=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new OrderHistoryVO(rs.getInt("idx"), 
										rs.getString("itemname"), 
										rs.getString("image"), 
										rs.getString("info"), 
										rs.getString("managername"), 
										rs.getInt("price"), 
										rs.getInt("quentity"), 
										rs.getInt("totalprice"), 
										rs.getString("name"), 
										rs.getString("email"), 
										rs.getString("phonenumber"), 
										rs.getString("address"), 
										rs.getString("paymentmethod"), 
										rs.getTimestamp("paytime"));
				vector.add(vo);
			}
			
		} catch(Exception e) {
			System.out.println("getAllOrderHistory");
			e.printStackTrace();
		} finally {
			closeResource();
		}
		
		return vector;
	}

}

