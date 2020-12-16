package hyunmyungsoo.petmeet.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Reservation {
	private int reservNum;
	private String userId;
	private LocalDate reservStart;
	private LocalDate reservFinish;
	private int reservPrice;
	private String reservAccept;
	private String reservPetType;
	private String reservPetSize;
	private int reservPetCount;
	private int sitterNum;
}