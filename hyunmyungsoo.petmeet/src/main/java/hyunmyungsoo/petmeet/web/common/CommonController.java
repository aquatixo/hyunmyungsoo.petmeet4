package hyunmyungsoo.petmeet.web.common;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import hyunmyungsoo.petmeet.service.review.ReviewService;
import hyunmyungsoo.petmeet.service.sitter.SitterService;

@Controller
public class CommonController {
	@Autowired ReviewService reviewService;
	@Autowired private SitterService sitterService;

	@GetMapping("/common/mypage")
	public String toMyPage(Model model, HttpSession session) {
		String userId = session.getAttribute("userEmail").toString();
		model.addAttribute("sitter", sitterService.getSitter(userId));
		return "common/mypage";
	}
	
	@GetMapping("/")
	public String whenAppStarts(Model model) {
		model.addAttribute("reviewList", reviewService.getRecentReviews());
		return "main";
	}
	
	@GetMapping("/main")
	public String toMain(Model model) {
		model.addAttribute("reviewList", reviewService.getRecentReviews());
		return "main";
	}
}