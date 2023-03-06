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
	
	//주소 업데이트 완료 3.2 재봉
	public void insertMember(MemberVO vo) {
	
		try {
			//커넥션 풀에 만들어져 있는 DB와 미리 연결을 맺은 Connection객체 빌려오기 
			//요약 DB연결
			con = ds.getConnection();
			
			//insert문장 완성하기
			String sql = "INSERT INTO MEMBER (EMAIL, PW, NAME, phoneNum, address1, address2, address3, address4, address5, m_date) " 
									+ "values(?,      ?,   ?,     ?,      ?,       ?,        ?,        ?,        ?,       sysdate) ";
                         
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhoneNum());
			pstmt.setString(5, vo.getAddress1());
			pstmt.setString(6, vo.getAddress2());
			pstmt.setString(7, vo.getAddress3());
			pstmt.setString(8, vo.getAddress4());
			pstmt.setString(9, vo.getAddress5());
			
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
	//2-27일 정경훈 수정함
	//입력한 아이디와 비밀번호를 매개변수로 받아  DB의 테이블에 저장되어 있는지 확인하는 메소드
	public int loginCheck(String login_email, String login_pw) {
		int check = -1;
		
		try {
			//DB접속
			con = ds.getConnection();
			//매개변수로 로그인 아이디 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
			String sql = "select * from member where email=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login_email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {//입력한 아이디로 조회한 행이 있으면?
				//입력한 비밀번호와 조화된 비밀먼호와 비교 해서 있으면?
				if(login_pw.equals(rs.getString("pw")) ) {
					check = 1;
				
				}else { //아이디는 맞고 비번 틀림
					check = 0;
				}
			}else {//아이디가 틀림
			check = -1;
			}
		} catch (Exception e) {
				System.out.println("loginCheck 메소드 내부에서 SQL문 실행 오류");
				e.printStackTrace();	
		}finally {
			closeResource();
		}
		return check;
		
		}
	

	//3월 2일 아이디찾기 구현중
		public MemberVO findId(String name, String phoneNum) {
	
		MemberVO vo = null;
		
		try {
			
			con = ds.getConnection();
			
			String sql = "select email from member where name=? and phoneNum=?";
				pstmt = con.prepareStatement(sql);	
				
				pstmt.setString(1, name);
				pstmt.setString(2, phoneNum);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					
					vo = new MemberVO();
					vo.setEmail(rs.getString("email"));
					
				}
					
		}catch (Exception e) {
			
			System.out.println("findId 메소드 내부에서 SQL문 실행 오류");
			e.printStackTrace();
			
		}finally {
			
		}
		
		return vo;
		
	}
		public MemberVO findPw(String name, String phoneNum, String email) {
			
			MemberVO vo = null;
			
			try {
				
				con = ds.getConnection();
				
				String sql = "select pw  from member where name=? and phoneNum=? and email=?";
				
					pstmt = con.prepareStatement(sql);	
					
					pstmt.setString(1, name);
					pstmt.setString(2, phoneNum);
					pstmt.setString(3, email);
					
					rs = pstmt.executeQuery();
					
					if (rs.next()) {
						vo = new MemberVO();
						vo.setPw(rs.getString("pw"));
					
					}
			}catch (Exception e) {
				
				System.out.println("findPw 메소드 내부에서 SQL문 실행 오류");
				e.printStackTrace();
				
			}finally {
				
			}
			
			return vo;
			
		}
		
		//3월 2일 아이디찾기 비번호 찾기 구현중
	
		
		
	//회원 이메일을 이용해 회원 정보 조회
	public MemberVO findMember(String email) {
		
			MemberVO vo = null;
			
			try {
				//DB접속 : 커넥션풀에 만들어져 있는 커넥션 얻기
				con = ds.getConnection();
				
				String sql = "SELECT * FROM member WHERE email='"+ email+"'";
				
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					
					vo = new MemberVO();
					vo.setEmail(email);
					vo.setPw(rs.getString("pw"));
					vo.setName(rs.getString("name"));
					vo.setPhoneNum(rs.getString("phoneNum"));
					vo.setAddress1(rs.getString("address1"));
					vo.setAddress2(rs.getString("address2"));
					vo.setAddress3(rs.getString("address3"));
					vo.setAddress4(rs.getString("address4"));
					vo.setAddress5(rs.getString("address5"));
					vo.setM_date(rs.getDate("m_date"));
				}		
			}catch(Exception e) {
				System.out.println("getOneOrder메소드 에서  SQL오류 : " + e);
			}finally {
				closeResource(); //자원 해제
			}
			return vo;//조회된 차량 한대정보가 저장된 CarConfirmVo객체를 CarController서블릿으로 반환!
	}
	
	//회원정보수정하는 메소드 3.3 재봉
	//입력한 회원정보를 수정하는 메소드 
		public int updateMember(HttpServletRequest request) {
			
			int result = 0; //수정성공시 1이 저장되고 , 수정 실패하면 0이 저장될 변수 
			
			try {
				//커넥션 풀에서 DB와 미리 연결을 맺어 만들어져 있는 Connection객체 빌려오기 
				//요약 : DB접속
				con = ds.getConnection();
				
				String sql = "UPDATE member set"
						   + " pw=?,"
						   + " name=?,"
						   + " phoneNum=?,"
						   + " address1=?,"
						   + " address2=?,"
						   + " address3=?,"
						   + " address4=?,"
						   + " address5=?"
						   + " WHERE email=? ";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, request.getParameter("pw"));
				pstmt.setString(2, request.getParameter("name"));
				pstmt.setString(3, request.getParameter("phoneNum"));
				pstmt.setString(4, request.getParameter("address1"));
				pstmt.setString(5, request.getParameter("address2"));
				pstmt.setString(6, request.getParameter("address3"));
				pstmt.setString(7, request.getParameter("address4"));
				pstmt.setString(8, request.getParameter("address5"));
				pstmt.setString(9, request.getParameter("email"));
				
				result = pstmt.executeUpdate();
				
			} catch (Exception e) {
				
				System.out.println("updateMember메소드 내부에서 SQL실행 오류 ");
				e.printStackTrace();
				
			} finally {
				//자원해제
				closeResource();
			}
			
			return result;
		}
	
	//회원정보삭제시키는 메소드 3.2 재봉
	public int MemberDelete(String email, String pw) {
		
		int result = 0;
		
		try {
			con = ds.getConnection();
			
			String sql = "delete from member where email=? and pw=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			
			result = pstmt.executeUpdate();
					
		} catch (Exception e) {
			System.out.println("MemberDelete메소드 내부에서 SQL실행 오류 ");
			e.printStackTrace();
		} finally {
			//자원해제
			closeResource();
		}	
		
		return result;
	}	

}

