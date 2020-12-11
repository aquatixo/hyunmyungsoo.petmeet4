package hyunmyungsoo.petmeet.dao.board;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Board;

public interface BoardDao {
	List<Board> selectBoards();
	int insertBoard(Board board);

	Board selectBoard(int boardNum);
	
	int updateBoard(Board board);
	int deleteBoard(int boardNum);
}