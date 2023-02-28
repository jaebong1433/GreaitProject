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
								 rs.getInt("price"), 
								 rs.getInt("quentity"), 
								 rs.getString("paymentmethod"));
				vector.add(vo);
			}
		} catch(Exception e) {
			System.out.println("getAllList");
			e.printStackTrace();
		} finally {
			
		}
		
		return vector;
	};

}

