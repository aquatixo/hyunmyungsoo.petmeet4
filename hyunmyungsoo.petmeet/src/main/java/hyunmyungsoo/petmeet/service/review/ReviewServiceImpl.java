package hyunmyungsoo.petmeet.service.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunmyungsoo.petmeet.dao.review.ReviewDao;
import hyunmyungsoo.petmeet.domain.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired private ReviewDao reviewDao;

	@Override
	public List<Review> getReviews() {
		return reviewDao.selectReviews();
	}

}
