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
import VO.BoardLikeVO;
import VO.CommunityVO;
import VO.MemberVO;

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
	
	//커뮤니티 들어갔을 때 화면을 띄워주는 기능
	//정태영
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
												rs.getString("c_password"),
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
	
	//게시글의 갯수를 조회하는 메소드
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
	
	
	//게시글을 클릭했을 때 자세히 보는 기능
	//정태영
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
									rs.getString("c_password"),
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
	
	//좋아요 눌렀을 때
	//정태영
	public BoardLikeVO addLike(String c_idx, String nickname) {
		String sql = null;
		BoardLikeVO boardLikeVO = null;
		
		try {
			//조회수를 1 감소시키는 방법, 안 쓸 거임
//			con = ds.getConnection();
//			sql = "update community set c_views = c_views - 1 where c_idx = ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, c_idx);
//			pstmt.executeQuery();
			
			//유저의 추천여부를 확인하기 위해 boardlike 테이블에 유저 추가
			con = ds.getConnection();
			sql = "insert into boardlike values (?, ?, 'yes')";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_idx);
			pstmt.setString(2, nickname);
			pstmt.executeQuery();
			
			//insert한 boardlike 테이블의 값을 받아 BoardLikeVO에 저장
			sql = "select * from boardlike where c_idx=? and m_nickname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_idx);
			pstmt.setString(2, nickname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardLikeVO = new BoardLikeVO(	rs.getInt("c_idx"),
												rs.getString("m_nickname"),
												rs.getString("likecheck"));
			}
			
			sql = "update community set c_like = c_like + 1 where c_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_idx);
			rs = pstmt.executeQuery();
			
			
		} catch(Exception e) {
			System.out.println("boardRead");
			e.printStackTrace();
		} finally {
			closeResource();
		}
		return boardLikeVO;
	}
	
	//좋아요 취소 기능
	//정태영
	public BoardLikeVO CancelLike(String c_idx, String nickname) {
		String sql = null;
		BoardLikeVO boardLikeVO = null;
		
		try {
			
			//유저의 추천여부를 확인하기 위해 boardlike 테이블에 유저 추가
			con = ds.getConnection();
			sql = "delete from boardlike where c_idx=? and m_nickname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_idx);
			pstmt.setString(2, nickname);
			pstmt.executeQuery();
			
			//insert한 boardlike 테이블의 값을 받아 BoardLikeVO에 저장
			sql = "select * from boardlike where c_idx=? and m_nickname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_idx);
			pstmt.setString(2, nickname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardLikeVO = new BoardLikeVO(	rs.getInt("c_idx"),
												rs.getString("m_nickname"),
												rs.getString("likecheck"));
			}
			
			sql = "update community set c_like = c_like - 1 where c_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_idx);
			rs = pstmt.executeQuery();
			
		} catch(Exception e) {
			System.out.println("boardRead");
			e.printStackTrace();
		} finally {
			closeResource();
		}
		return boardLikeVO;
	}
	
	
	//게시글을 vo로 얻는 기능
	//정태영
	public CommunityVO getComVO(String c_idx) {
		CommunityVO vo = null;
		try {
			con = ds.getConnection();
			String sql = "select * from community where c_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new CommunityVO(rs.getInt("c_idx"),
												rs.getString("c_title"),
												rs.getString("c_nickname"),
												rs.getString("c_password"),
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
	
	//답글 달기 기능
	//정태영
	public void replyInsertBoard(String super_c_idx, String title, String nickname, String content, String pass) {
		String sql = null;
		try {
			con = ds.getConnection();
			sql = "SELECT c_group, c_level from community where c_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, super_c_idx);
			rs = pstmt.executeQuery();
			rs.next();
			String c_group = rs.getString("c_group");
			String c_level = rs.getString("c_level");
			
			sql = "update community set c_group = c_group + 1 where c_group > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_group);
			pstmt.executeUpdate();
			
			sql = "insert into community values (COMMUNITY_IDX.nextval,"
												+ "?,"
												+ "?,"
												+ "?,"
												+ "?,"
												+ "sysdate,"
												+ "0,"
												+ "0,"
												+ "?,"
												+ "?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, nickname);
			pstmt.setString(3, pass);
			pstmt.setString(4, content);
			pstmt.setInt(5, Integer.parseInt(c_group)+1);
			pstmt.setInt(6, Integer.parseInt(c_level)+1);
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("replyInsertBoard");
			e.printStackTrace();
		} finally {
			closeResource();
		}
	}
	
	//새글 작성 메소드
	public int insertBoard(CommunityVO vo) {
		int result = 0;
		String sql = null;
		try {
			//DB접속
			con = ds.getConnection();
			
			//두번째 부터 입력되는 주글 들의 pos를 1증가 시킨다.
			sql = "update community set c_group = c_group +1";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			//insert SQL문 만들기 //c_group , c_level 0 0 으로 insert 규칙3
			
			sql = "insert into community (c_idx, c_title, c_nickname, c_password, c_content, "
					+ "c_date, c_views, c_like, c_group, c_level) "
					+ " values (community_idx.nextVal, ?, ?, ?, ?, sysdate, 0, 0, 0, 0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getC_title());
			pstmt.setString(2, vo.getC_nickname());
			pstmt.setString(3, vo.getC_password());
			pstmt.setString(4, vo.getC_content());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertBoard 메소드 내부에서 오류 !");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		return result;
	}
	

	//검색했을 때
	//정태영(?)
	public ArrayList boardList(String key, String word) {
		ArrayList list = new ArrayList();
		String sql = null;
		
		if(!word.equals("")) {//검색어를 입력했다면?
			
			if(key.equals("titleContent")) {//검색기준값  제목+내용을 선택했다면? 
			
				sql = "select * from community "
					+ " where c_title like '%"+ word + "%' or"
						  + " c_content like '%"+ word+"%' order by c_group asc";
			
			}else {//"name" 검색기준값 작성자를 선택했다면?
			
				sql = "select * from community "
					+ " where c_nickname like '%"+ word + "%' order by c_group asc";				
			}
			
		}else {//검색어를 입력하지 않았다면?
			//모든 글 조회   
			//조건-> b_dix열의 글번호 데이터들을 기준으로 해서 내림 차순으로 정렬 후 조회 !
			sql = "select * from community order by c_group asc";
			
			//참고. 정렬 조회 -> order by 정렬기준열명  desc또는asc
			// desc 내림 차순 정렬 
			// asc 오름 차순 정렬
			
		}
			
		try {
				con = ds.getConnection();
							
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				//조회된 Result의 정보를 한행 단위로 꺼내서
				//BoardVo객체에 한행씩 저장 후
				//BoardVo객체들을? ArrayList배열에 하나씩 추가해서 저장
				while(rs.next()) {
					
					CommunityVO vo = new CommunityVO(rs.getInt("c_idx"),
													rs.getString("c_title"),
													rs.getString("c_nickname"),
													rs.getString("c_password"),
													rs.getString("c_content"), 
													rs.getDate("c_date"),
													rs.getInt("c_views"),
													rs.getInt("c_like"),
													rs.getInt("c_group"),
													rs.getInt("c_level"));
					list.add(vo); 
				}					
		}catch(Exception e) {
			
			System.out.println("boardList메소드 내부에서 SQL오류");
			e.printStackTrace();	
			
		}finally {
			closeResource();
		}
		return list;
	}
	//검색했을 때의 글 갯수 조회
	//정태영(?)
	public int getTotalRecord(String key, String word) {
		//조회된 글의 글수 저장
		int total = 0;
		
		String sql = null;
		
		if(!word.equals("")) {//검색어를 입력했다면?
			
			if(key.equals("titleContent")) {//검색기준값  제목+내용을 선택했다면? 
			
				sql = "select count(*) as cnt from community "
					+ " where c_title like '%"+ word + "%' or"
						  + " c_content like '%"+ word+"%'";
				
				
			}else {//"name" 검색기준값 작성자를 선택했다면?
			
				sql = "select count(*) as cnt from community "
					+ " where c_nickname like '%"+ word + "%'";				
			}
			
		}else {//검색어 입력 안했다면?
			
			sql = "select count(*) as cnt from community";
		}
			
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt("cnt");
			 
		}catch (Exception e) {
			System.out.println("getTotalRecord메소드에서 오류");
			e.printStackTrace();
		}finally {
			closeResource();
		}
	
		return total;
	}
	
	//boardlikevo를 얻어오는 기능
	//정태영
	public BoardLikeVO getBoardlikeVO(String c_idx, HttpSession session) {
		String nickname = (String)session.getAttribute("nickname");
		BoardLikeVO boardLikeVO = null;
		String sql = null;
		
		try {
			
			con = ds.getConnection();
			sql = "select * from boardlike where c_idx=? and m_nickname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_idx);
			pstmt.setString(2, nickname);
			rs = pstmt.executeQuery();
			System.out.println("안녕");
			if(rs.next()) {
				boardLikeVO = new BoardLikeVO(	rs.getInt("c_idx"),
												rs.getString("m_nickname"),
												rs.getString("likecheck"));
			}
		} catch(Exception e) {
			
		} finally {
			closeResource();
		}
		
		return boardLikeVO;
	}	
	
}







