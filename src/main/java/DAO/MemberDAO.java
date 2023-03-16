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
	
		//닉네임 중복 체크 !
		public boolean overlappedNickname(String m_nickname) {
			
			boolean result = false;
			
			try {
				
				con = ds.getConnection();
				
				
				String sql = "select decode(count(*),1,'true','false') ";
					   sql	+= "as result from m_member";
					   sql  += " where m_nickname=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m_nickname);
				
				rs = pstmt.executeQuery();
				
				rs.next();//조회된 제목줄에 커서(화살표)가 있다가 조회된 줄로 내려가 위치함
				
				String value = rs.getString("result");//"true"
				
				//문자열 "true" 또는 "false"를   Boolean자료형으로 형변환 하여 저장
				result = Boolean.parseBoolean(value);//true 또는 false
							
				//true -> 닉네임 중복
				//false-> 닉네임이 DB에 없으므로 중복 아님 
				
			}catch(Exception e) {

				System.out.println("overlappedNickname 메소드 내부에서 오류");
				e.printStackTrace();
			}finally {
				closeResource();//자원해제
			}
		
			return result;//true 또는 false를  MemberController로 반환 
		}
		
	//아이디 중복 체크 !
	public boolean overlappedId(String m_id) {
		
		boolean result = false;
		
		try {
			
			con = ds.getConnection();
			
			
			String sql = "select decode(count(*),1,'true','false') ";
				   sql	+= "as result from m_member";
				   sql  += " where m_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			
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
	
		//이메일 중복 체크 !
		public boolean overlappedEmail(String m_email) {
			
			boolean result = false;
			
			try {
				
				con = ds.getConnection();
				
				
				String sql = "select decode(count(*),1,'true','false') ";
					   sql	+= "as result from m_member";
					   sql  += " where m_email=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m_email);
				
				rs = pstmt.executeQuery();
				
				rs.next();//조회된 제목줄에 커서(화살표)가 있다가 조회된 줄로 내려가 위치함
				
				String value = rs.getString("result");//"true"
				
				//문자열 "true" 또는 "false"를   Boolean자료형으로 형변환 하여 저장
				result = Boolean.parseBoolean(value);//true 또는 false
							
				
				
			}catch(Exception e) {

				System.out.println("overlappedEmail 메소드 내부에서 오류");
				e.printStackTrace();
			}finally {
				closeResource();//자원해제
			}
		
			return result;//true 또는 false를  MemberController로 반환 
		}
	
		//회원가입 
		public void insertMember(MemberVO vo) {
	
		try {
			//커넥션 풀에 만들어져 있는 DB와 미리 연결을 맺은 Connection객체 빌려오기 
			//요약 DB연결
			con = ds.getConnection();
			
			//insert문장 완성하기
			String sql = "INSERT INTO M_MEMBER (m_nickname, m_id, m_pw, m_name, m_email, m_date) " 
									+ "values(   ?,          ?,    ?,    ?,      ?,      sysdate) ";
                         
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getM_nickname());
			pstmt.setString(2, vo.getM_id());
			pstmt.setString(3, vo.getM_pw());
			pstmt.setString(4, vo.getM_name());
			pstmt.setString(5, vo.getM_email());
			
			
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
	
	
	
	
	//입력한 아이디와 비밀번호를 매개변수로 받아  DB의 테이블에 저장되어 있는지 확인하는 메소드
	public int loginCheck(String m_id, String m_pw) {
		int check = -1;
		
		try {
			//DB접속
			con = ds.getConnection();
			//매개변수로 로그인 아이디 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
			String sql = "select * from m_member where m_id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {//입력한 아이디로 조회한 행이 있으면?
				//입력한 비밀번호와 조화된 비밀먼호와 비교 해서 있으면?
				if(m_pw.equals(rs.getString("m_pw")) ) {
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
	

	//아이디찾기
		public MemberVO findId(String m_name, String m_email) {
	
		MemberVO vo = null;
		
		try {
			
			con = ds.getConnection();
			
			String sql = "select m_id from m_member where m_name=? and m_email=?";
				pstmt = con.prepareStatement(sql);	
				
				pstmt.setString(1, m_name);
				pstmt.setString(2, m_email);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					
					vo = new MemberVO();
					vo.setM_id(rs.getString("m_id"));
					
				}
					
		}catch (Exception e) {
			
			System.out.println("findId 메소드 내부에서 SQL문 실행 오류");
			e.printStackTrace();
			
		}finally {
			
		}
		
		return vo;
		
	}
		//비밀번호찾기
		public MemberVO findPw(String m_name, String m_id, String m_email) {
			
			MemberVO vo = null;
			
			try {
				
				con = ds.getConnection();
				
				String sql = "select m_pw  from m_member where m_name=? and m_id=? and m_email=?";
				
					pstmt = con.prepareStatement(sql);	
					
					pstmt.setString(1, m_name);
					pstmt.setString(2, m_id);
					pstmt.setString(3, m_email);
					
					rs = pstmt.executeQuery();
					
					if (rs.next()) {
						vo = new MemberVO();
						vo.setM_pw(rs.getString("m_pw"));
					
					}
			}catch (Exception e) {
				
				System.out.println("findPw 메소드 내부에서 SQL문 실행 오류");
				e.printStackTrace();
				
			}finally {
				
			}
			
			return vo;
			
		}
		
		
	//회원 아이디을 이용해 회원 정보 조회
	public MemberVO findMember(String m_id) {
		
			MemberVO vo = null;
			
			try {
				//DB접속 : 커넥션풀에 만들어져 있는 커넥션 얻기
				con = ds.getConnection();
				
				String sql = "SELECT * FROM m_member WHERE m_id='"+ m_id+"'";
				
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					
					vo = new MemberVO();
					vo.setM_id(m_id);
					vo.setM_nickname("m_nickname");
					vo.setM_pw(rs.getString("m_pw"));
					vo.setM_name(rs.getString("m_name"));
					vo.setM_email(rs.getString("m_email"));
					
					vo.setM_date(rs.getDate("m_date"));
				}		
			}catch(Exception e) {
				System.out.println("getOneOrder메소드 에서  SQL오류 : " + e);
			}finally {
				closeResource(); //자원 해제
			}
			return vo;//조회된 차량 한대정보가 저장된 CarConfirmVo객체를 CarController서블릿으로 반환!
	}
	
	//회원정보수정하는 메소드
	//입력한 회원정보를 수정하는 메소드 
		public int updateMember(HttpServletRequest request) {
			
			int result = 0; //수정성공시 1이 저장되고 , 수정 실패하면 0이 저장될 변수 
			
			try {
				//커넥션 풀에서 DB와 미리 연결을 맺어 만들어져 있는 Connection객체 빌려오기 
				//요약 : DB접속
				con = ds.getConnection();
				
				String sql = "UPDATE m_member set"
						   + " m_pw=?,"
						   + " m_name=?,"
						   + " m_email=?,"
						   + " WHERE m_id=? ";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, request.getParameter("m_pw"));
				pstmt.setString(2, request.getParameter("m_name"));
				pstmt.setString(3, request.getParameter("m_email"));
				pstmt.setString(9, request.getParameter("m_id"));
				
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
	
	//회원정보삭제시키는 메소드
	public int MemberDelete(String m_id, String m_pw) {
		
		int result = 0;
		
		try {
			con = ds.getConnection();
			
			String sql = "delete from m_member where m_id=? and m_pw=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pw);
			
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
	
	//
	public MemberVO getMemVO(String nickname) {
		MemberVO vo = null;
		try {
			con = ds.getConnection();
			String sql = "select * from m_member where m_nickname = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new MemberVO(	rs.getString("m_nickname"),
									rs.getString("m_id"), 
									rs.getString("m_pw"), 
									rs.getString("m_name"),
									rs.getString("m_email"));
			}
		} catch(Exception e) {
			System.out.println("getMemVO");
			e.printStackTrace();
		} finally {
			closeResource();
		}
		return vo;	
	}
	
	//아이디를 이용해 멤버의 닉네임을 얻어 오는 메소드
	public String oneIdSelcet(String m_id) {
		String userNick = null;
		
		try {
			con = ds.getConnection();
			String sql = "select m_nickname from m_member where m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				userNick = rs.getString("m_nickname");
			}
		} catch(Exception e) {
			System.out.println("oneIdSelcet 메소드 내부에서 오류!");
			e.printStackTrace();
		} finally {
			closeResource();
		}
		return userNick;
	}

}

