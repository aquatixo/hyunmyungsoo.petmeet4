package hyunmyungsoo.petmeet.dao.reservation;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Reservation;
import hyunmyungsoo.petmeet.domain.ReviewForView;

public interface ReservationDao {
	List<Reservation> selectReservations();
	boolean insertReservation(Reservation reservation);
	List<ReviewForView> selectReviewForViews(int sitterNum);
}
