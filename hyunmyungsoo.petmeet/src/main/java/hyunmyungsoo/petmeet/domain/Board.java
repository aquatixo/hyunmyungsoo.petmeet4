package hyunmyungsoo.petmeet.domain;

import java.util.Date;

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
	private Date regDate; 
	private String boardFile; 
	private String userId;
}
