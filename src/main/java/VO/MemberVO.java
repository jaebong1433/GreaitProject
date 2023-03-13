package VO;

import java.sql.Date;

public class MemberVO {
	
	private String m_nickname, m_id, m_pw, m_name, m_email;
	private Date m_date;
	
	public MemberVO() {
	}

	public MemberVO(String m_nickname, String m_id, String m_pw, String m_name, String m_email) {
		this.m_nickname = m_nickname;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_email = m_email;
	}

	public MemberVO(String m_nickname, String m_id, String m_pw, String m_name, String m_email, Date m_date) {
		this.m_nickname = m_nickname;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_date = m_date;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	
	
	
}
