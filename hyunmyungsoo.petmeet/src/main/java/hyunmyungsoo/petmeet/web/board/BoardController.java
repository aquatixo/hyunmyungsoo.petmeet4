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

import hyunmyungsoo.petmeet.service.board.BoardService;


@Controller
public class BoardController {
	@Autowired private BoardService boardService;
	@Value("img")
	private String attachDir;
	
	//addBoard로
	@GetMapping("/board/addBoard")
	public String toBoardAdd() {
		return "board/addBoard";
	}
	
	@PostMapping("/board/addBoard")
	public String boardAdd(HttpSession session,HttpServletRequest request,
			@RequestParam MultipartFile attachFile,
			@RequestParam("boardTitle") String boardTitle,
			@RequestParam("boardContent") String boardContent,
			@RequestParam("userId") String userId) {
		
		String dir = request.getServletContext().getRealPath(attachDir);
		String fileName = "board" + userId + ".PNG";
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
	
	//listBoard
	@GetMapping("/board/listBoard")
	public String boardLookUp(Model model) {
		model.addAttribute("boardList", boardService.getBoards());
//		System.out.println(boardService.getBoards());
		return "board/listBoard";
	}
	
	//view 가져오기
	@RequestMapping("/board/view")
	public String boardView(@RequestParam("boardNum") int boardNum , Model model) throws Exception{
		model.addAttribute("board", boardService.getBoard(boardNum));
		//System.out.println(boardService.getBoard(boardNum));
		System.out.println("가져오기");
		 return "board/viewBoard";
	}
	
	//삭제
	@PostMapping("/board/view/del")
	public String delBoard(HttpSession session,HttpServletRequest request,
			@RequestParam("boardNum") int boardNum) {
		
		System.out.println(boardNum);
		System.out.println("삭제");

		boardService.deleteBoardHelper(boardNum);
		return "redirect:../listBoard";
	}
	
	
	//update 
	@RequestMapping("/board/upBoard")
	public String BoardUpdate(@RequestParam("boardNum") int boardNum , Model model) throws Exception{
		model.addAttribute("board", boardService.getBoard(boardNum));
		 return "board/updateBoard";
	}
	
	@PostMapping("/board/upBoard")
	public String boardAddd(HttpSession session,HttpServletRequest request,
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
	