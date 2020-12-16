package hyunmyungsoo.petmeet.service.board;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Board;
import hyunmyungsoo.petmeet.domain.Paging;

public interface BoardService {
	List<Board> getBoards(Paging page);
	
	boolean addBoard(Board board);
	
	void addBoardHelper(String boardTitle, String boardContent, String fileName, String userId);
	void updateBoardHelper(int boardNum, String boardTitle, String boardContent, String fileName, String userId);
	void deleteBoardHelper(int boardNum);
	
	Board getBoard(int boardNum);
	
	boolean fixBoard(Board board);
	boolean delBoard(int boardNum);
	
	int countBoard();
}