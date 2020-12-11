package hyunmyungsoo.petmeet.service.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunmyungsoo.petmeet.dao.reservation.ReservationDao;
import hyunmyungsoo.petmeet.dao.sitter.SitterDao;
import hyunmyungsoo.petmeet.dao.user.UserDao;
import hyunmyungsoo.petmeet.domain.Reservation;
import hyunmyungsoo.petmeet.domain.ReviewForView;
import hyunmyungsoo.petmeet.domain.Sitter;
import hyunmyungsoo.petmeet.domain.User;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Autowired private ReservationDao reservationDao;
	@Autowired private UserDao userDao;
	@Autowired private SitterDao sitterDao;
	
	@Override
	public boolean reserve(Reservation reservation) {
		return reservationDao.insertReservation(reservation);
	}

	@Override
	public List<Reservation> getReservations() {
		return reservationDao.selectReservations();
	}

	@Override
	public List<ReviewForView> getReviewForViews(int sitterNum) {
		List<ReviewForView> reviewForViews = reservationDao.selectReviewForViews(sitterNum);
		
		for(ReviewForView reviewForView : reviewForViews)
			reviewForView.setUserNickname(getNicknameForSitter(sitterNum));
		
		return reviewForViews;
	}

	@Override
	public String getNicknameForSitter(int sitterNum) {
		List<User> users = userDao.selectUsers();
		Sitter sitter = sitterDao.selectSitterNum(sitterNum);
		String nickName = "";
		
		for(User user: users) {
			if(user.getUserId().equals(sitter.getUserId())) {
				nickName = user.getUserNickname();
				break;
			}
		}
		return nickName;
	}
}
