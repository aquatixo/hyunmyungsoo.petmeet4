package hyunmyungsoo.petmeet.web.admin.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hyunmyungsoo.petmeet.service.user.UserService;

@Controller
public class AdminUserController {
	@Autowired private UserService userService;
	
	@GetMapping("/admin/user/listUser")
	public String toUserList(Model model) {
		model.addAttribute("userList", userService.getUsers());
		return "admin/user/listUser";
	}
	
	@PostMapping("/admin/user/listUser/del")
	public String delUser(@RequestParam("userId") String userId) {
		userService.delUserHelper(userId);
		return "redirect:../../../admin/user/listUser";
	}
	
	@PostMapping("/admin/user/listUser")
	public String toUpdateUser(@RequestParam("userId") String userId, Model model) {
		model.addAttribute("user", userService.getUser(userId));
		return "admin/user/viewUser";
	}
	
	@PostMapping("/admin/user/listUser/update")
	public String updateUser(@RequestParam("userId") String userId,
			@RequestParam("userPw") String userPw,
			@RequestParam("userName") String userName,
			@RequestParam("userNick") String userNick,
			@RequestParam("userBirth") String userBirth,
			@RequestParam("userPhone") String userPhone){
		userService.adminFixUserInfoHelper(userId, userName, userPw, userNick, userBirth, userPhone);
		
		return "redirect:../../../admin/user/listUser";
	}
}