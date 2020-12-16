package hyunmyungsoo.petmeet.domain;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("board.info")
public class Board {
	private int boardNum; 
	private String boardTitle;
	private String boardContent; 
	private LocalDate regDate; 
	private String boardFile; 
	private String userId;
}