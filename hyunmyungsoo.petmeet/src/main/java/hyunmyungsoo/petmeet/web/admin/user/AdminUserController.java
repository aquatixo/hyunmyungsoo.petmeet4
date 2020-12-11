package hyunmyungsoo.petmeet.web.admin.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import hyunmyungsoo.petmeet.service.user.UserService;

@Controller
public class AdminUserController {
	@Autowired private UserService userService;
	
	@GetMapping("/admin/user/userList")
	public String toUserList(Model model) {
		model.addAttribute("userList", userService.getUsers());
		return "admin/user/userList";
	}
	
	
}