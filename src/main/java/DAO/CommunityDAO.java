package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import VO.CommunityVO;

//DB와 연결하여 비즈니스로직 처리 하는 클래스 
public class CommunityDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	//커넥션풀 생성 후 커넥션 객체 얻는 생성자
	public CommunityDAO() {
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
	
	public ArrayList boardListAll() {
		ArrayList list = new ArrayList();
		
		try {
			con = ds.getConnection();
			String sql = "select * from community order by c_group asc";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CommunityVO vo = new CommunityVO(rs.getInt("c_idx"),
												rs.getString("c_title"),
												rs.getString("c_nickname"), 
												rs.getString("c_content"), 
												rs.getDate("c_date"),
												rs.getInt("c_views"),
												rs.getInt("c_like"),
												rs.getInt("c_group"),
												rs.getInt("c_level"));
				list.add(vo);
			}
			
		} catch(Exception e) {
			System.out.println("boardListAll");
			e.printStackTrace();
		} finally {
			closeResource();
		}
		
		
		return list;
	}
	
	public int getTotalRecord() {
		int total = 0;
		
		try {
			con = ds.getConnection();
			String sql = "select count(*) as cnt from community";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt("cnt");
			
		} catch(Exception e) {
			System.out.println("getTotalRecord");
			e.printStackTrace();
		} finally {
			closeResource();
		}
		
		
		return total;
	}
	
	public CommunityVO boardRead(String c_idx) {
		CommunityVO vo = null;
		String sql = null;
		
		try {
			con = ds.getConnection();
			sql = "update community set c_views = c_views + 1 where c_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_idx);
			pstmt.executeQuery();
			
			
			//--------------------------------------------
			con = ds.getConnection();
			sql = "select * from community where c_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new CommunityVO(rs.getInt("c_idx"),
									rs.getString("c_title"),
									rs.getString("c_nickname"), 
									rs.getString("c_content"), 
									rs.getDate("c_date"),
									rs.getInt("c_views"),
									rs.getInt("c_like"),
									rs.getInt("c_group"),
									rs.getInt("c_level"));
			}
			
		} catch(Exception e) {
			System.out.println("boardRead");
			e.printStackTrace();
		} finally {
			closeResource();
		}
		
		return vo;
	}
	
	public void addLike(int c_idx) {
		String sql = null;
		
		try {
//			con = ds.getConnection();
//			sql = "update community set c_views = c_views - 1 where c_idx = ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, c_idx);
//			pstmt.executeQuery();
			
			
			con = ds.getConnection();
			sql = "update community set c_like = c_like + 1 where c_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_idx);
			rs = pstmt.executeQuery();
			
		} catch(Exception e) {
			System.out.println("boardRead");
			e.printStackTrace();
		} finally {
			closeResource();
		}
	}
	
	public CommunityVO getVO(int c_idx) {
		CommunityVO vo = null;
		try {
			con = ds.getConnection();
			String sql = "select * from community where c_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new CommunityVO(rs.getInt("c_idx"),
												rs.getString("c_title"),
												rs.getString("c_nickname"), 
												rs.getString("c_content"), 
												rs.getDate("c_date"),
												rs.getInt("c_views"),
												rs.getInt("c_like"),
												rs.getInt("c_group"),
												rs.getInt("c_level"));
			}
			
			
		} catch(Exception e) {
			System.out.println("boardRead");
			e.printStackTrace();
		} finally {
			closeResource();
		}
		return vo;	
	}
	
}







