package VO;

public class CrawlingVO {
	 private String rating2;
     private String movie; 
     private String imgSrc; 
     private Double naverScore;
     private String clipTitle;
     private String clipImg;
     private String photo;
     
     public CrawlingVO() {
	
     }

	public CrawlingVO(String rating2, String movie, String imgSrc, Double naverScore) {
		this.rating2 = rating2;
		this.movie = movie;
		this.imgSrc = imgSrc;
		this.naverScore = naverScore;
	}
	
	public CrawlingVO(String clipTitle, String clipImg) {
		this.clipTitle = clipTitle;
		this.clipImg = clipImg;
	}
	
	public CrawlingVO(String photo) {
		this.photo = photo;
	}
	
	public CrawlingVO(String rating2, String movie, String imgSrc, Double naverScore, String clipTitle, String clipImg,
			String photo) {
		this.rating2 = rating2;
		this.movie = movie;
		this.imgSrc = imgSrc;
		this.naverScore = naverScore;
		this.clipTitle = clipTitle;
		this.clipImg = clipImg;
		this.photo = photo;
	}

	public String getClipTitle() {
		return clipTitle;
	}

	public void setClipTitle(String clipTitle) {
		this.clipTitle = clipTitle;
	}

	public String getClipImg() {
		return clipImg;
	}

	public void setClipImg(String clipImg) {
		this.clipImg = clipImg;
	}

	public String getRating2() {
		return rating2;
	}

	public void setRating2(String rating2) {
		this.rating2 = rating2;
	}

	public String getMovie() {
		return movie;
	}

	public void setMovie(String movie) {
		this.movie = movie;
	}

	public String getImgSrc() {
		return imgSrc;
	}

	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}

	public Double getNaverScore() {
		return naverScore;
	}

	public void setNaverScore(Double naverScore) {
		this.naverScore = naverScore;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
    
}
