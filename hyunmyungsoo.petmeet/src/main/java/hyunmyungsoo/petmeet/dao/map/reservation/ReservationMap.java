package hyunmyungsoo.petmeet.dao.map.reservation;

import java.util.List;

import org.springframework.stereotype.Repository;

import hyunmyungsoo.petmeet.domain.Reservation;
import hyunmyungsoo.petmeet.domain.ReviewForView;

@Repository
public interface ReservationMap {
	List<Reservation> selectReservations();
	boolean insertReservation(Reservation reservation);
	List<ReviewForView> selectReviewForViews(int sitterNum);
}
