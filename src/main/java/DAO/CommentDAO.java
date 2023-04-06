package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.CommunityVO;

//DB와 연결하여 비즈니스로직 처리 하는 클래스 
public class CommentDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	//커넥션풀 생성 후 커넥션 객체 얻는 생성자
	public CommentDAO() {
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
	
	//댓글 등록!
	public void addComment(String m_nickname, String comment_nick, String comment_pw, String comment_content, String c_idx,
			String comment_uniqueid) {
			
			String sql = null;
			try {
				con = ds.getConnection();
				
//				sql = "insert into community (c_idx, c_title, c_nickname, c_uniqueid, c_password, c_content, "
//						+ "c_date, c_views, c_like, c_group, c_level) "
//						+ " values (community_idx.nextVal, ?, ?, ?, ?, ?, sysdate, 0, 0, 0, 0)";
				sql = "insert into com_comment (comment_idx, c_idx, comment_pw, m_nickname, comment_nick, comment_uniqueid, comment_content) "
						+ "values (comment_seq.nextVal,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, c_idx);
				pstmt.setString(2, comment_pw);
				pstmt.setString(3, m_nickname);
				pstmt.setString(4, comment_nick);
				pstmt.setString(5, comment_uniqueid);
				pstmt.setString(6, comment_content);
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("addComment 메소드 내부에서 오류 !");
				e.printStackTrace();
			}finally {
				closeResource();
			}
			
	}
	
	
	
	
	
	
	

}









