package hyunmyungsoo.petmeet.service.reservation;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Reservation;
import hyunmyungsoo.petmeet.domain.ReviewForView;

public interface ReservationService {
	List<Reservation> getReservations();
	boolean reserve(Reservation reservation);
	List<ReviewForView> getReviewForViews(int sitterNum);
	String getNicknameForSitter(int sitterNum);
}
