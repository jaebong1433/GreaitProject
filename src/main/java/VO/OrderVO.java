package VO;

public class OrderVO {
//    idx number primary key, -- 글번호 
//    itemname varchar2(30) not null, -- 상품명
//    image varchar2(300), -- 이미지명
//    info varchar2(1000), -- 상품 설명
//    managername varchar2(10),
//    price number not null, -- 가격
//    quentity number not null, -- 수량
//    paymentmethod varchar2(20) not null
	
	private int idx;
	private String itemname;
	private String image;
	private String info;
	private String managername;
	private int price;
	private int quentity;
	private String paymentmethod;
	
	public OrderVO() {
	}
	
	public OrderVO(int idx, String itemnam, String image, String info, String managername, int price, int quentity,
			String paymentmethod) {
		super();
		this.idx = idx;
		this.itemname = itemname;
		this.image = image;
		this.info = info;
		this.managername = managername;
		this.price = price;
		this.quentity = quentity;
		this.paymentmethod = paymentmethod;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getItemnam() {
		return itemname;
	}
	public void setItemnam(String itemnam) {
		this.itemname = itemnam;
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
	public int getQuentity() {
		return quentity;
	}
	public void setQuentity(int quentity) {
		this.quentity = quentity;
	}
	public String getPaymentmethod() {
		return paymentmethod;
	}
	public void setPaymentmethod(String paymentmethod) {
		this.paymentmethod = paymentmethod;
	}
	
	
	
}
