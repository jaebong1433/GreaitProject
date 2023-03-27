package VO;

public class GradeVO {
	private int m_level;
	private String m_nickname;
	private String m_uniqueid;
	private int m_exp;
	
	public GradeVO() {
		// TODO Auto-generated constructor stub
	}

	public GradeVO(int m_level, String m_nickname, String m_uniqueid, int m_exp) {
		super();
		this.m_level = m_level;
		this.m_nickname = m_nickname;
		this.m_uniqueid = m_uniqueid;
		this.m_exp = m_exp;
	}



	public int getM_level() {
		return m_level;
	}

	public void setM_level(int m_level) {
		this.m_level = m_level;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getM_uniqueid() {
		return m_uniqueid;
	}

	public void setM_uniqueid(String m_uniqueid) {
		this.m_uniqueid = m_uniqueid;
	}

	public int getM_exp() {
		return m_exp;
	}

	public void setM_exp(int m_exp) {
		this.m_exp = m_exp;
	}
	
	
	
	
	
}
