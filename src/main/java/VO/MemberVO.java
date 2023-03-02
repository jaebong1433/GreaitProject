package VO;

import java.sql.Date;

//주소업데이트완료 3.2 재봉
public class MemberVO {
	private String email; //이메일
	private String pw; // 비밀번호
	private String name; // 이름
	private String phoneNum; //폰번호
	private String address1; //주소1
	private String address2; //주소2
	private String address3; //주소3
	private String address4; //주소4
	private String address5; //주소5
	
	private Date m_date; //회원가입 날짜	

	public MemberVO() {
	}

	public MemberVO(String email, String pw, String name, String phoneNum, String address1, String address2,
			String address3, String address4, String address5) {
		super();
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.phoneNum = phoneNum;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.address4 = address4;
		this.address5 = address5;
	}

	public MemberVO(String email, String pw, String name, String phoneNum, String address1, String address2,
			String address3, String address4, String address5, Date m_date) {
		super();
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.phoneNum = phoneNum;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.address4 = address4;
		this.address5 = address5;
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

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getAddress4() {
		return address4;
	}

	public void setAddress4(String address4) {
		this.address4 = address4;
	}

	public String getAddress5() {
		return address5;
	}

	public void setAddress5(String address5) {
		this.address5 = address5;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	
}
