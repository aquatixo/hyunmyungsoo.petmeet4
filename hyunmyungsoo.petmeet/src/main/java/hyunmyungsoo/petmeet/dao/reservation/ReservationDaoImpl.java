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

	@Override
	public List<Reservation> selectReservationsByCondition(String userId, int startRow, int endRow) {
		return reservationMap.selectReservationsByCondition(userId, startRow, endRow);
	}

	@Override
	public Integer selectCountById(String userId) {
		return reservationMap.selectCountById(userId);
	}

	@Override
	public List<Reservation> selectGottenReservations(int sitterNum, int startRow, int endRow) {
		return reservationMap.selectGottenReservations(sitterNum, startRow, endRow);
	}

	@Override
	public Integer selectCountBySitterNum(int sitterNum) {
		return reservationMap.selectCountBySitterNum(sitterNum);
	}

	@Override
	public boolean updateReservation(String reservAccept, int reservNum) {
		return reservationMap.updateReservation(reservAccept, reservNum);
	}

	@Override
	public boolean deleteReservation(int reservNum) {
		return reservationMap.deleteReservation(reservNum);
	}
}