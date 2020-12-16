package hyunmyungsoo.petmeet.domain;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Sitter {

	private int sitterNum;
	private String userId;

	private LocalDate sitterStart;
	private LocalDate sitterFinish;

	private String sitterPetType;
	private String sitterPetSize;

	private String sitterPostNum;
	private String sitterLocOrg;
	private String sitterLocSi;
	private String sitterLocGu;
	private String sitterLocDong;

	private double sitterRating;
	private String sitterTitle;
	private String sitterContent;
	private String sitterFileName;
}