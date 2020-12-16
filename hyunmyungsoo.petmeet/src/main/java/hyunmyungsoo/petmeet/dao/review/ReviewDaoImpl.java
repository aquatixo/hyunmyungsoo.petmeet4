package hyunmyungsoo.petmeet.dao.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hyunmyungsoo.petmeet.dao.map.review.ReviewMap;
import hyunmyungsoo.petmeet.domain.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	private ReviewMap reviewMap;

	@Override
	public List<Review> selectReviews() {
		return reviewMap.selectReviews();
	}

	@Override
	public boolean insertReview(Review review) {
		return reviewMap.insertReview(review);
	}

	@Override
	public boolean updateReview(Review review) {
		return reviewMap.updateReview(review);
	}

	@Override
	public boolean deleteReview(int reservNum) {
		return reviewMap.deleteReview(reservNum);
	}

	@Override
	public Review selectReview(int reservNum) {
		return reviewMap.selectReview(reservNum);
	}
}