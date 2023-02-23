package VO;

import java.sql.Date;

public class MemberVO {
	private String email; //이메일
	private String pw; // 비밀번호
	private String name; // 이름
	private String phoneNum; //폰번호
	private String address; //주소
	private Date m_date; //회원가입 날짜	
	
	public MemberVO() {
	}

	public MemberVO(String email, String pw, String name, String phonenum, String address) {
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.phoneNum = phonenum;
		this.address = address;
	}

	public MemberVO(String email, String pw, String name, String phonenum, String address, Date m_date) {
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.phoneNum = phonenum;
		this.address = address;
		this.m_date = m_date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhonenum() {
		return phoneNum;
	}

	public void setPhonenum(String phonenum) {
		this.phoneNum = phonenum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	
}
