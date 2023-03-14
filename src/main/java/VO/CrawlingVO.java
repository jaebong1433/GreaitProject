package VO;

public class CrawlingVO {
	 private String rating2;
     private String movie; 
     private String imgSrc; 
     private Double naverScore;
  
     public CrawlingVO() {
	
     }

	public CrawlingVO(String rating2, String movie, String imgSrc, Double naverScore) {
		this.rating2 = rating2;
		this.movie = movie;
		this.imgSrc = imgSrc;
		this.naverScore = naverScore;
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
    
}
