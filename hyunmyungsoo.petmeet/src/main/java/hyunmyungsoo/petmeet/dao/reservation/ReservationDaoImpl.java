package hyunmyungsoo.petmeet.dao.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hyunmyungsoo.petmeet.dao.map.reservation.ReservationMap;
import hyunmyungsoo.petmeet.domain.Reservation;
import hyunmyungsoo.petmeet.domain.ReviewForView;


@Repository
public class ReservationDaoImpl implements ReservationDao {
	@Autowired private ReservationMap reservationMap;
	
	@Override
	public boolean insertReservation(Reservation reservation) {
		return reservationMap.insertReservation(reservation);
	}

	@Override
	public List<Reservation> selectReservations() {
		return reservationMap.selectReservations();
	}

	@Override
	public List<ReviewForView> selectReviewForViews(int sitterNum) {
		return reservationMap.selectReviewForViews(sitterNum);
	}
}