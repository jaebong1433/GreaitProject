package DAO;

import java.sql.Connection;
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

//DB와 연결하여 비즈니스로직 처리 하는 클래스 
public class ComunityDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	//커넥션풀 생성 후 커넥션 객체 얻는 생성자
	public ComunityDAO() {
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
	
	
	
		

}//CarDAO클래스 끝





//DELETE문은?  테이블에 저장된 데이터들을 삭제하는 구문이다
//테이블 자체를 삭제하려면? DROP문을 사용 해야 한다.

//문법1 -> DELETE FROM 삭제할테이블명  WHERE 조건열명=조건값;
//설명1 -> 조건열에 해당하는 조건값이 참인  행을 삭제 합니다.

//문법2 -> DELETE FROM 삭제할테이블명;
//설명2 -> 테이블에 저장된 모든 행을 삭제 합니다.

//문법3 -> DROP TABLE 삭제할테이블명;    
//설명3 -> 테이블 삭제 시킴!!   테이블에 저장된 모든 데이터 다~~ 삭제됨.




