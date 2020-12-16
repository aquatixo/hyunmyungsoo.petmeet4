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
public class ReviewForView {
	private String reviewFileName;
	private String userNickname;
	private LocalDate reviewRegDate;
	private String reviewRating;
	private String reviewContent;
}