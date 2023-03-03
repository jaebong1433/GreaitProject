package VO;

import java.sql.Timestamp;

public class InquiryHistoryVO {
//	  idx number primary key, -- 글번호
//    itemname varchar2(30) not null, -- 상품명
//    image varchar2(300), -- 이미지명
//    info varchar2(1000), -- 상품정보
//    managername varchar2(10), -- 담당자
//    price number, -- 최소가격
//    name varchar2(30) not null, -- 구매자 이름
//    email varchar2(100) not null, -- 이메일
//    phonenumber varchar2(100) not null, -- 전화번호
//    address varchar2(1000) not null, -- 주소
//    paymentmethod varchar2(20) not null, -- 결제수단
//    paytime timestamp not null -- 문의시각  
	
	private int idx;
	private String itemname;
	private String image;
	private String info;
	private String managername;
	private int price;
	private String name;
	private String email;
	private String phonenumber;
	private String address;
	private Timestamp paytime;
	
	public InquiryHistoryVO(int idx, String itemname, String image, String info, String managername, int price,
			String name, String email, String phonenumber, String address, Timestamp paytime) {
		super();
		this.idx = idx;
		this.itemname = itemname;
		this.image = image;
		this.info = info;
		this.managername = managername;
		this.price = price;
		this.name = name;
		this.email = email;
		this.phonenumber = phonenumber;
		this.address = address;
		this.paytime = paytime;
	}
	
	
	public InquiryHistoryVO(int idx, String itemname, String image, String info, String managername, int price,
			String name, String email, String phonenumber, String address) {
		super();
		this.idx = idx;
		this.itemname = itemname;
		this.image = image;
		this.info = info;
		this.managername = managername;
		this.price = price;
		this.name = name;
		this.email = email;
		this.phonenumber = phonenumber;
		this.address = address;
	}



	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getManagername() {
		return managername;
	}
	public void setManagername(String managername) {
		this.managername = managername;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Timestamp getPaytime() {
		return paytime;
	}
	public void setPaytime(Timestamp paytime) {
		this.paytime = paytime;
	}
	
	
}
