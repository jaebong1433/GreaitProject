package VO;
// 3.16 재봉 VO 자체수정 

public class VideoCrawlingVO {
	private String imgSrc; 
	private String title; 
	
	 public VideoCrawlingVO() {
	
	 }

	public VideoCrawlingVO(String imgSrc, String title) {
		this.imgSrc = imgSrc;
		this.title = title;
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
    
}