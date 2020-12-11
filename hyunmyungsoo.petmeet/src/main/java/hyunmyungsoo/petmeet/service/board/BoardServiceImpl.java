package hyunmyungsoo.petmeet.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunmyungsoo.petmeet.dao.board.BoardDao;
import hyunmyungsoo.petmeet.domain.Board;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired private BoardDao boardDao;
	
	@Override
	public List<Board> getBoards() {
		return boardDao.selectBoards();
	}

	@Override
	public boolean addBoard(Board board) {
		return boardDao.insertBoard(board) > 0;
	}

	@Override
	public void addBoardHelper(String boardTitle, String boardContent, String fileName, String userId) {
		Board board = new Board();
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		board.setUserId(userId);
		board.setBoardFile(fileName);
		addBoard(board);
	}

	@Override
	public Board getBoard(int boardNum) {
		return boardDao.selectBoard(boardNum);
	}

	@Override
	public boolean fixBoard(Board board) {
		return boardDao.updateBoard(board) > 0;
	}

	@Override
	public boolean delBoard(int boardNum) {
		return boardDao.deleteBoard(boardNum) > 0;
	}

	@Override
	public void updateBoardHelper(int boardNum, String boardTitle, String boardContent,  String fileName, String userId) {
		Board board = new Board();
		board.setBoardNum(boardNum);
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		board.setUserId(userId);
		board.setBoardFile(fileName);
		
		fixBoard(board);
		
	}
	
	@Override
	public void deleteBoardHelper(int boardNum) {
		delBoard(boardNum);
	}

	
	
	/*
	@Override
	public void assignSitter(HttpSession session, String boardTitle, String boardContent, Date regDate, String boardFile) {
	      Board board = new Board();
	      
	      String userId = session.getAttribute("userEmail").toString();
	      
	      board.setBoardContent(boardContent);
	      board.setBoardFile(boardFile);
	      board.setBoardTitle(boardTitle);
	      board.setRegDate(regDate);
	      board.setUserId(userId);

	      addBoard(board);

	}*/

}
