package VO;

import java.sql.Date;

public class BoardVO {
	
	private int b_idx; //글번호(글순서값)
	private String b_email; //글 작성자 이메일(아이디)
	private String b_pw; //글 비밀번호
	private String b_name; //글 작성자 명
	private String b_title; //글 제목
	private String b_content; //글 내용
	private int b_group; //주글과 답글의 그룹값
	private int b_level; //답글의 들여쓰기 정도값
	private Date b_data; //글 작성날짜
	private int b_cnt; //글 조회수
	
	public BoardVO() {
		
	}

	public BoardVO(int b_idx, String b_email, String b_pw, 
			       String b_name, String b_title, String b_content, 
			       	int b_group, int b_level, Date b_data, int b_cnt) {
		
		this.b_idx = b_idx;
		this.b_email = b_email;
		this.b_pw = b_pw;
		this.b_name = b_name;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_group = b_group;
		this.b_level = b_level;
		this.b_data = b_data;
		this.b_cnt = b_cnt;
	}

	public BoardVO(int b_idx, String b_email, String b_pw, 
				   String b_name, String b_title, String b_content, 
				   int b_group, int b_level, int b_cnt) {
		
		this.b_idx = b_idx;
		this.b_email = b_email;
		this.b_pw = b_pw;
		this.b_name = b_name;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_group = b_group;
		this.b_level = b_level;
		this.b_cnt = b_cnt;
	}

	public int getB_idx() {
		return b_idx;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	public String getB_email() {
		return b_email;
	}

	public void setB_email(String b_email) {
		this.b_email = b_email;
	}

	public String getB_pw() {
		return b_pw;
	}

	public void setB_pw(String b_pw) {
		this.b_pw = b_pw;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public int getB_group() {
		return b_group;
	}

	public void setB_group(int b_group) {
		this.b_group = b_group;
	}

	public int getB_level() {
		return b_level;
	}

	public void setB_level(int b_level) {
		this.b_level = b_level;
	}

	public Date getB_data() {
		return b_data;
	}

	public void setB_data(Date b_data) {
		this.b_data = b_data;
	}

	public int getB_cnt() {
		return b_cnt;
	}

	public void setB_cnt(int b_cnt) {
		this.b_cnt = b_cnt;
	}
	
}
