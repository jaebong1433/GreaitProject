package VO;

public class OrderVO {
//    idx number primary key, -- 글번호 
//    itemname varchar2(30) not null, -- 상품명
//    image varchar2(300), -- 이미지명
//    info varchar2(1000), -- 상품 설명
//    managername varchar2(10),
//    price number not null, -- 가격
//    paymentmethod varchar2(20) not null
	
	private int idx; //글번호
	private String itemname; //상품명
	private String image; //이미지명
	private String info; //상품 설명
	private String managername; //담당자명
	private int price; //가격
	
	public OrderVO() {
		// TODO Auto-generated constructor stub
	}
	
	public OrderVO(int idx, String itemname, String image, String info, String managername, int price) {
		super();
		this.idx = idx;
		this.itemname = itemname;
		this.image = image;
		this.info = info;
		this.managername = managername;
		this.price = price;
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
	
	
	
	
	
	
	
	
	
}
