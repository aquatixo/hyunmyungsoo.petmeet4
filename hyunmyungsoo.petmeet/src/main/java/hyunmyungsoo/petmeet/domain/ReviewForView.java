package hyunmyungsoo.petmeet.domain;

import java.time.LocalDate;

public class ReviewForView {
	private String reviewFileName;
	private String userNickname;
	private LocalDate reviewRegDate;
	private String reviewRating;
	private String reviewContent;
		
	public ReviewForView() {}

	public ReviewForView(String reviewFileName, String userNickname, LocalDate reviewRegDate, String reviewRating,
			String reviewContent) {
		this.reviewFileName = reviewFileName;
		this.userNickname = userNickname;
		this.reviewRegDate = reviewRegDate;
		this.reviewRating = reviewRating;
		this.reviewContent = reviewContent;
	}
	
	public String getReviewFileName() {
		return reviewFileName;
	}
	public void setReviewFileName(String reviewFileName) {
		this.reviewFileName = reviewFileName;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public LocalDate getReviewRegDate() {
		return reviewRegDate;
	}
	public void setReviewRegDate(LocalDate reviewRegDate) {
		this.reviewRegDate = reviewRegDate;
	}
	public String getReviewRating() {
		return reviewRating;
	}
	public void setReviewRating(String reviewRating) {
		this.reviewRating = reviewRating;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	
	
}
