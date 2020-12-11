package hyunmyungsoo.petmeet.dao.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hyunmyungsoo.petmeet.dao.map.review.ReviewMap;
import hyunmyungsoo.petmeet.domain.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired private ReviewMap reviewMap;

	@Override
	public List<Review> selectReviews() {
		return reviewMap.selectReviews();
	}

}
