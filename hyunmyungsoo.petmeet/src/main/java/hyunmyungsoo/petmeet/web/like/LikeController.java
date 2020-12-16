package hyunmyungsoo.petmeet.web.like;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hyunmyungsoo.petmeet.service.like.LikeService;
import hyunmyungsoo.petmeet.service.sitter.SitterService;
import hyunmyungsoo.petmeet.service.user.UserService;

@Controller
public class LikeController {
	@Autowired private LikeService likeService;
	@Autowired private SitterService sitterService;
	@Autowired private UserService userService;
	
	@GetMapping("/like/listLike")
	public String toListLike(Model model, HttpSession session) {
		model.addAttribute("likeList", likeService.getLikes());
		model.addAttribute("userList", userService.getUsers());
		model.addAttribute("sitterList", sitterService.getSitters());
		model.addAttribute("userId", session.getAttribute("userEmail"));
		
		return "like/listLike";
	}
	
	@PostMapping("/like/addLike")
	public String addLike(@RequestParam("userId") String userId,
			@RequestParam("sitterNum") int sitterNum, Model model) {
		likeService.addLikeHelper(userId, sitterNum);
		return "redirect:../like/listLike";
	}
	
	@PostMapping("/like/listLike")
	public String delLike(@RequestParam("likeNumInput") String likeNum) {
		likeService.deleteLike(likeNum);
		return "redirect:../like/listLike";
	}
}