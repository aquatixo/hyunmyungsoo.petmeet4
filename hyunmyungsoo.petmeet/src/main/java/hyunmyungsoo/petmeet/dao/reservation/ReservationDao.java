package hyunmyungsoo.petmeet.dao.reservation;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Reservation;
import hyunmyungsoo.petmeet.domain.ReviewForView;

public interface ReservationDao {
	List<Reservation> selectReservations();
	List<Reservation> selectReservationsByCondition(String userId, int startRow, int endRow);
	List<Reservation> selectGottenReservations(int sitterNum, int startRow, int endRow);
	boolean insertReservation(Reservation reservation);
	List<ReviewForView> selectReviewForViews(int sitterNum);
	Integer selectCountById(String userId);
	Integer selectCountBySitterNum(int sitterNum);
	boolean updateReservation(String reservAccept ,int reservNum);
	boolean deleteReservation(int reservNum);
}