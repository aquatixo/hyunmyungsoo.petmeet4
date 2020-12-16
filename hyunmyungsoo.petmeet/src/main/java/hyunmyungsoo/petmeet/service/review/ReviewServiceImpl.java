package hyunmyungsoo.petmeet.service.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunmyungsoo.petmeet.dao.review.ReviewDao;
import hyunmyungsoo.petmeet.domain.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDao reviewDao;

	@Override
	public List<Review> getReviews() {
		return reviewDao.selectReviews();
	}
	
	@Override
	public List<Review> getRecentReviews() {
		List<Review> tmp = getReviews();
		List<Review> recent = new ArrayList<>();
		
		if(tmp != null && tmp.size() > 1) {
			Review r1 = tmp.get(tmp.size()-2);
			Review r2 = tmp.get(tmp.size()-1);
			recent.add(r2);recent.add(r1);
		}
		if(tmp != null && tmp.size() == 1) {
			Review r1 = tmp.get(0);
			recent.add(r1);
		}
		return recent;
	}
	
	@Override
	public boolean addReview(Review review) {
		return reviewDao.insertReview(review);
	}

	@Override
	public void addReviewHelper(String fileName, String reviewRating, String reviewContent, String userId, int reservNum,
			int sitterNum) {
		Review review = new Review();
		review.setReservNum(reservNum);
		review.setReviewFilename(fileName);
		review.setReviewRating(reviewRating);
		review.setReviewContent(reviewContent);
		review.setUserId(userId);
		review.setSitterNum(sitterNum);
				
		addReview(review);
		
	}

	@Override
	public boolean fixReview(Review review) {
		return reviewDao.updateReview(review);
	}

	@Override
	public void fixReviewHelper(String fileName, String reviewRating, String reviewContent, String userId,
			int reservNum, int sitterNum, int reviewNum) {
		Review review = new Review();
		review.setReviewNum(reviewNum);
		review.setReviewFilename(fileName);
		review.setReviewRating(reviewRating);
		review.setReviewContent(reviewContent);
		review.setUserId(userId);
		fixReview(review);
	}

	@Override
	public boolean delReview(int reviewNum) {
		return reviewDao.deleteReview(reviewNum);
	}
	
	@Override
	public void delReviewHelper(int reviewNum) {
		delReview(reviewNum);
	}

	@Override
	public Review getReview(int reviewNum) {
		return reviewDao.selectReview(reviewNum);
	}
}