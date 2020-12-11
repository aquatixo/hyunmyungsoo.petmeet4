package hyunmyungsoo.petmeet.dao.map.board;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Board;


public interface BoardMap {
	List<Board> selectBoards();
	int insertBoard(Board board);
	
	Board selectBoard(int boardNum);
	
	int updateBoard(Board board);
	int deleteBoard(int boardNum);
}
