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

//DB와 연결하여 비즈니스로직 처리 하는 클래스 
public class MemberDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	//커넥션풀 생성 후 커넥션 객체 얻는 생성자
	public MemberDAO() {
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
	
	//아이디 중복 체크 !
	public boolean overlappedId(String id) {//입력한 아이디를 매개변수 id로 받는다
		
		boolean result = false;
		
		try {
			
			con = ds.getConnection();
			
			//오라클의 decode()함수를 이용하여 서블릿에서 전달되는
			//입력한 ID에 해당하는 데이터를 검색하여 true 또는 false를 반환하는데
			//검색한 갯수가 1(검색한 레코드가 존재하면)이면 'true'를 반환,
			//존재하지 않으면 'false'를 문자열로 반환하여 조회합니다.
			String sql = "select decode(count(*),1,'true','false') ";
				   sql	+= "as result from member";
				   sql  += " where email=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			rs.next();//조회된 제목줄에 커서(화살표)가 있다가 조회된 줄로 내려가 위치함
			
			String value = rs.getString("result");//"true"
			
			//문자열 "true" 또는 "false"를   Boolean자료형으로 형변환 하여 저장
			result = Boolean.parseBoolean(value);//true 또는 false
						
			//true -> 아이디 중복
			//false-> 아이디가 DB에 없으므로 중복 아님 
			
		}catch(Exception e) {

			System.out.println("overlappedId 메소드 내부에서 오류");
			e.printStackTrace();
		}finally {
			closeResource();//자원해제
		}
	
		return result;//true 또는 false를  MemberController로 반환 
	}

	public void insertMember(MemberVO vo) {
	
		try {
			//커넥션 풀에 만들어져 있는 DB와 미리 연결을 맺은 Connection객체 빌려오기 
			//요약 DB연결
			con = ds.getConnection();
			
			//insert문장 완성하기
			String sql = "INSERT INTO MEMBER (EMAIL, PW, NAME, phoneNum, address, m_date) " 
									+ "values(?,      ?,   ?,     ?,      ?,     sysdate) ";
                         
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhoneNum());
			pstmt.setString(5, vo.getAddress());
			
			//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 
			//DB의 테이블에 실행!
			pstmt.executeUpdate();
						
		} catch (Exception e) {
			System.out.println("insertMember메소드 내부에서 SQL실행 오류 " + e);
			e.printStackTrace();
		} finally {
			closeResource(); //자원해제
		}
		
	}
	
	//회원 이메일을 이용해 회원 정보 조회
	public MemberVO findMember(String _email) {
		
		MemberVO memInfo = null;
		try {
			con = ds.getConnection();
			
			String sql = "select * from member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, _email);
			System.out.println(sql);
			rs = pstmt.executeQuery();
			rs.next();
			String email = rs.getString("email");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			String phoneNum = rs.getString("phoneNum");
			String address = rs.getString("address");
			Date m_date = rs.getDate("m_date");
			memInfo = new MemberVO(email,pw,name,phoneNum,address,m_date);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeResource();
		}
		return memInfo;
	}

		

}

