package hyunmyungsoo.petmeet.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
public class Review {
	private int reviewNum;
	private String reviewFilename;
	private LocalDate reviewRegdate;
	private String reviewState;
	private String reviewContent;
	private int reviewRating;
	
	private String userId;
	private int sitterNum;
	private int reservationNum;
	
}
