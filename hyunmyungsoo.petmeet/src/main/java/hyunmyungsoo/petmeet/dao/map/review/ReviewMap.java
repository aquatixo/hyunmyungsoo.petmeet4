package hyunmyungsoo.petmeet.dao.map.review;

import java.util.List;

import org.springframework.stereotype.Repository;

import hyunmyungsoo.petmeet.domain.Review;

@Repository
public interface ReviewMap {
	List<Review> selectReviews();

	boolean insertReview(Review review);

	boolean updateReview(Review review);

	boolean deleteReview(int reservNum);
	
	Review selectReview(int reservNum);
}