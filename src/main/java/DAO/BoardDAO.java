package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.BoardVO;

//DB와 연결하여 비즈니스로직 처리 하는 클래스 
public class BoardDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	//커넥션풀 생성 후 커넥션 객체 얻는 생성자
	public BoardDAO() {
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
	
	public int insertBoard(BoardVO vo) 
	{
		int result = 0;
		
		String sql = null;
		
		try 
		{
			//커넥션풀에서 커넥션 얻기
			//DB접속
			con = ds.getConnection();
			
			//두번째 부터 입력되는 부글 들의 b_group를 1증가 시킨다.
			sql = "update DBname set b_group = b_group + 1";
			
			pstmt =con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			//insert SQL문 만들기 //b_group, b_level 0 0으로 insert
			sql = "insert into ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getB_email());
			pstmt.setString(2, vo.getB_pw());
			pstmt.setString(3, vo.getB_name());
			pstmt.setString(5, vo.getB_title());
			pstmt.setString(6, vo.getB_content());
			
			result = pstmt.executeUpdate(); //insert
		} 
		catch (Exception e) 
		{
			System.out.println("insertBoard메소드에서 SQL실행 오류");
			e.printStackTrace();
		}
		finally 
		{
			closeResource();
		}
		
		return result;
	}
}
