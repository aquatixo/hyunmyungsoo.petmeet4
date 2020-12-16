package hyunmyungsoo.petmeet.web.admin.sitter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hyunmyungsoo.petmeet.domain.Sitter;
import hyunmyungsoo.petmeet.domain.User;
import hyunmyungsoo.petmeet.service.sitter.SitterService;
import hyunmyungsoo.petmeet.service.user.UserService;

@Controller
public class AdminSitterController {
	@Autowired private SitterService sitterService;
	@Autowired private UserService userService;
	
	@GetMapping("/admin/sitter/listSitter")
	public String toSitterList(Model model) {
		model.addAttribute("sitterList", sitterService.getSitters());
		model.addAttribute("userList", userService.getUsers());
		return "admin/sitter/listSitter";
	}
	
	@GetMapping("/admin/sitter/viewSitter")
	public String toReservation(@RequestParam("sitterNum") int sitterNum, Model model) {
		List<Sitter> sitterList = sitterService.getSitters();
		Sitter thisSitter = null;
		for(Sitter sitter: sitterList) {
			if(sitter.getSitterNum() == sitterNum)
				thisSitter = sitter;
		}
		
		List<User> userList = userService.getUsers();
		User thisUser = null;
		for(User user: userList) {
			if(user.getUserId().equals(thisSitter.getUserId())) {
				thisUser = user;
			}
		}
		
		model.addAttribute("sitter", thisSitter);
		model.addAttribute("user", thisUser);
		return "admin/sitter/viewSitter";
	}
	
	@PostMapping("/admin/sitter/viewSitter/del")
	public String adminDelSitter(@RequestParam("userId") String userId) {
		sitterService.delSitter(userId);
		return "redirect:../../../admin/sitter/listSitter";
	}
}