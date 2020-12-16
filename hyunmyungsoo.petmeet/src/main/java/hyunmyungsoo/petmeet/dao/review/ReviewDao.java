package hyunmyungsoo.petmeet.dao.review;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Review;

public interface ReviewDao {
	List<Review> selectReviews();

	boolean insertReview(Review review);

	boolean updateReview(Review review);

	boolean deleteReview(int reservNum);

	Review selectReview(int reservNum);
}