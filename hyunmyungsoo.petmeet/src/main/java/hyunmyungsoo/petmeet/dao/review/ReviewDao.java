package hyunmyungsoo.petmeet.dao.review;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Review;

public interface ReviewDao {
	
	List<Review> selectReviews();
}
