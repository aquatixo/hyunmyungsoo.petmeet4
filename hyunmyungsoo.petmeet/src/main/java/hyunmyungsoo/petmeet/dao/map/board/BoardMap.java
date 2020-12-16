package hyunmyungsoo.petmeet.dao.map.board;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Board;
import hyunmyungsoo.petmeet.domain.Paging;

public interface BoardMap {
	List<Board> selectBoards(Paging page);
	int insertBoard(Board board);
	
	Board selectBoard(int boardNum);
	
	int updateBoard(Board board);
	int deleteBoard(int boardNum);
	
	int countBoard();
}