package VO;

import java.sql.Timestamp;

public class OrderHistoryVO {
	private String image;
	private String info;
	private int quentity;
	private int price;
	private String name;
	private String phonenumber;
	private String address;
	private String paymentmethod;
	private Timestamp paytime;
	private int idx;
	
	public OrderHistoryVO(String image, String info, int quentity, int price, String name, String phonenumber,
			String address, String paymentmethod, Timestamp paytime, int idx) {
		super();
		this.image = image;
		this.info = info;
		this.quentity = quentity;
		this.price = price;
		this.name = name;
		this.phonenumber = phonenumber;
		this.address = address;
		this.paymentmethod = paymentmethod;
		this.paytime = paytime;
		this.idx = idx;
	}
	
	public OrderHistoryVO(String image, String info, int quentity, int price, String name, String phonenumber,
			String address, String paymentmethod, int idx) {
		super();
		this.image = image;
		this.info = info;
		this.quentity = quentity;
		this.price = price;
		this.name = name;
		this.phonenumber = phonenumber;
		this.address = address;
		this.paymentmethod = paymentmethod;
		this.idx = idx;
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
	public int getQuentity() {
		return quentity;
	}
	public void setQuentity(int quentity) {
		this.quentity = quentity;
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
	public String getPaymentmethod() {
		return paymentmethod;
	}
	public void setPaymentmethod(String paymentmethod) {
		this.paymentmethod = paymentmethod;
	}
	public Timestamp getPaytime() {
		return paytime;
	}
	public void setPaytime(Timestamp paytime) {
		this.paytime = paytime;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	
}
