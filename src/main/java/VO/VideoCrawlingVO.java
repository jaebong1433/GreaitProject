package VO;
// 3.16 재봉 VO 자체수정 

public class VideoCrawlingVO {
	private String imgSrc; 
	private String title; 
	private String playCnt , src;
	
	
	
	 public VideoCrawlingVO() {
	
	 }

	public VideoCrawlingVO(String imgSrc, String title) {
		this.imgSrc = imgSrc;
		this.title = title;
	}

	public VideoCrawlingVO(String imgSrc, String title, String playCnt) {
		this.imgSrc = imgSrc;
		this.title = title;
		this.playCnt = playCnt;
	}
	

	public VideoCrawlingVO(String imgSrc, String title, String playCnt, String src) {
		this.imgSrc = imgSrc;
		this.title = title;
		this.playCnt = playCnt;
		this.src = src;
	}

	public String getImgSrc() {
		return imgSrc;
	}

	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPlayCnt() {
		return playCnt;
	}

	public void setPlayCnt(String playCnt) {
		this.playCnt = playCnt;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}
    
}