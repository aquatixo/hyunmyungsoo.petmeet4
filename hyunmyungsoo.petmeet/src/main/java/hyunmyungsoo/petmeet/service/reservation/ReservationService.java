package hyunmyungsoo.petmeet.service.reservation;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Reservation;
import hyunmyungsoo.petmeet.domain.ReviewForView;

public interface ReservationService {
	List<Reservation> getReservations();
	List<Reservation> getReservationsByCondition(String userId, int page);
	List<Reservation> getGottenReservations(int sitterNum, int page);
	boolean reserve(Reservation reservation);
	List<ReviewForView> getReviewForViews(int sitterNum);
	String getNicknameForSitter(int sitterNum);
	Integer getCountById(String userId);
	Integer getCountBySitterNum(int sitterNum);
	boolean acceptReservation(String reservAccept, int reservNum);
	boolean rejectReservation(int reservNum);
}