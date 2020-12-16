package hyunmyungsoo.petmeet.domain;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("comment.info")
public class Comment {
	private int commentNum;
	private String commentContent;
	private LocalDate regDate;
	private String userId;
	private int boardNum;
}