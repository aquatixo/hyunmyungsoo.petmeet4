package hyunmyungsoo.petmeet.web.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import hyunmyungsoo.petmeet.domain.Paging;
import hyunmyungsoo.petmeet.service.board.BoardService;
import hyunmyungsoo.petmeet.service.comment.CommentService;
import hyunmyungsoo.petmeet.service.user.UserService;

@Controller
public class BoardController {
	@Autowired private BoardService boardService;
	@Autowired private CommentService commentService;
	@Autowired private UserService userService;
	
	@Value("img")
	private String attachDir;
	
	@GetMapping("/board/insertBoard")
	public String toBoardAdd() {
		return "board/insertBoard";
	}
	
	@PostMapping("/board/insertBoard")
	public String addboard(HttpSession session,HttpServletRequest request,
			@RequestParam MultipartFile attachFile,
			@RequestParam("boardTitle") String boardTitle,
			@RequestParam("boardContent") String boardContent,
			@RequestParam("userId") String userId) {
		
		String dir = request.getServletContext().getRealPath(attachDir);
		String fileName = "board" + userId + boardTitle + ".PNG";
		save(dir + "/" + fileName, attachFile);

		boardService.addBoardHelper(boardTitle, boardContent, fileName, userId);
		return "redirect:../board/listBoard";
	}
	
	private void save(String fileName, MultipartFile attachFile) {
		try {
			attachFile.transferTo(new File(fileName));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/board/listBoard")
	public String listBoard(Paging page, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = boardService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", page);
		
		model.addAttribute("userList", userService.getUsers());
		model.addAttribute("boardList", boardService.getBoards(page));
		
		return "board/listBoard";
	}
	
	@GetMapping("/board/view")
	public String viewBoard(@RequestParam("boardNum") int boardNum , Model model, HttpSession session) throws Exception{
		model.addAttribute("board", boardService.getBoard(boardNum));
		model.addAttribute("commentList", commentService.getComments(boardNum));
		model.addAttribute("idForDel", session.getAttribute("userEmail"));
		model.addAttribute("userList", userService.getUsers());

		 return "board/viewBoard";
	}
	
	@PostMapping("/board/view/del")
	public String delBoard(HttpSession session,HttpServletRequest request,
			@RequestParam("boardNum") int boardNum) {
		
		boardService.deleteBoardHelper(boardNum);
		return "redirect:../listBoard";
	}
	
	@RequestMapping("/board/upBoard")
	public String toUpdateBoard(@RequestParam("boardNum") int boardNum , Model model) throws Exception{
		model.addAttribute("board", boardService.getBoard(boardNum));
		 return "board/updateBoard";
	}
	
	@PostMapping("/board/upBoard")
	public String updateBoard(HttpSession session,HttpServletRequest request,
			@RequestParam("boardNum") int boardNum,
			@RequestParam MultipartFile attachFile,
			@RequestParam("boardTitle") String boardTitle,
			@RequestParam("boardContent") String boardContent,
			@RequestParam("userId") String userId) {
		
		String dir = request.getServletContext().getRealPath(attachDir);
		
		String fileName = "board" + userId + boardTitle + ".PNG";
		
		if(!attachFile.isEmpty()) {
			save(dir + "/" + fileName, attachFile);
		}
		boardService.updateBoardHelper(boardNum, boardTitle, boardContent, fileName, userId);
		return "redirect:../board/listBoard";
	}
}