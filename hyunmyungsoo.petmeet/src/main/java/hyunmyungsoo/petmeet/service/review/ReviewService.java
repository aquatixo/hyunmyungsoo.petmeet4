package hyunmyungsoo.petmeet.service.review;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Review;

public interface ReviewService {
	List<Review> getReviews();
	List<Review> getRecentReviews();
	boolean addReview(Review review);
	void addReviewHelper(String fileName, String reviewRating, String reviewContent, String userId, int reservNum,
			int sitterNum);
	
	boolean fixReview(Review review);
	void fixReviewHelper(String fileName, String reviewRating, String reviewContent, String userId, int reservNum,
			int sitterNum, int reviewNum);
	
	boolean delReview(int reviewNum);
	void delReviewHelper(int reviewNum);
	
	Review getReview(int reservNum);
}