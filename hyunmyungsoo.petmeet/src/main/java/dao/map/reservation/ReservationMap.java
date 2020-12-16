package hyunmyungsoo.petmeet.dao.map.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import hyunmyungsoo.petmeet.domain.Reservation;
import hyunmyungsoo.petmeet.domain.ReviewForView;

@Repository
public interface ReservationMap {
	List<Reservation> selectReservations();
	List<Reservation> selectReservationsByCondition(@Param("userId") String userId,
			@Param("startRow") int startRow, @Param("endRow") int endRow);
	List<Reservation> selectGottenReservations(@Param("sitterNum") int sitterNum, 
			@Param("startRow") int startRow, @Param("endRow") int endRow);
	boolean insertReservation(Reservation reservation);
	
	List<ReviewForView> selectReviewForViews(int sitterNum);
	Integer selectCountById(String userId);
	Integer selectCountBySitterNum(int sitterNum);
	boolean updateReservation(@Param("reservAccept") String reservAccept,
			@Param("reservNum") int reservNum);
	boolean deleteReservation(int reservNum);
}