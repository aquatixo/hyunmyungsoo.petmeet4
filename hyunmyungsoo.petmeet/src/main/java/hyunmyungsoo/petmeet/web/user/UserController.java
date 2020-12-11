package hyunmyungsoo.petmeet.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hyunmyungsoo.petmeet.service.user.UserService;

@Controller
public class UserController {
	@Autowired private UserService userService;

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		   session.invalidate();
		   return "redirect:main";
	}
	
	@GetMapping("/user/login")
	public String toLoginInPage() {
		return "user/login";
	}
	
	@PostMapping("/user/login")
	public String login(@RequestParam("userEmail") String userEmail,
						@RequestParam("userPw") String userPw, Model model, HttpSession session) {
		String link = "";
		String loginChecker = userService.loginCheck(userEmail, userPw);
		
		if(loginChecker.equals("ID")) {
			model.addAttribute("errorMsg", "일치하는 아이디가 없습니다.");
			link = "user/login";
		}
		if(loginChecker.equals("PW")) {
			model.addAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
			link = "user/login";
		}
		if(loginChecker.equals("SUCCESS")) {
			session.setAttribute("userEmail", userEmail);
			link = "redirect:../main";
		}
		if(loginChecker.equals("ADMIN")) {
			link = "redirect:../admin/main";
		}
		
		return link;
	}
	
	@GetMapping("/user/signUp")
	public String toSignUpPage(Model model) {
		return "user/signUp";
	}
	
	@GetMapping("/user/signUp3")
	public String toSignUp3Page() {
		return "user/signUp3";
	}
	
	@PostMapping("/user/signUp3")
	public String insertUser(@RequestParam("userId") String userId,
		@RequestParam("userPw") String userPw, @RequestParam("userName") String userName,
		@RequestParam("userNick") String userNick, @RequestParam("userBirth") String userBirth,
		@RequestParam("userPhone") String userPhone,
		@RequestParam("userAddressSi") String userSi,
		@RequestParam("userAddressGu") String userGu,
		@RequestParam("userAddressDong") String userDong
			) {
		
		userService.addUserHelper(userId, userPw, userName, userNick, userBirth, userPhone, userSi, userGu, userDong);
		
		return "redirect:../user/login";
	}
	
	@GetMapping("/user/findId")
	public String toFindId() {
		return "user/findId";
	}
	
	@PostMapping("/user/findId")
	public String findId(@RequestParam("userName") String userName,
			@RequestParam("userPhone") String userPhone, Model model, HttpSession session) {
		String link = "";
		String hasId = userService.findIdHelper(userName, userPhone);
		if(hasId.equals("empty")) {
			model.addAttribute("error", "일치하는 정보가 없습니다.");
			link = "user/findId";
		}else {
			session.setAttribute("findUserId", hasId);
			link = "user/findId2";
		}
		
		return link;
	}
	
	@GetMapping("/user/findPw")
	public String toFindPw() {
		return "user/findPw";
	}
	
	@GetMapping("/user/changePw")
	public String toFindPw2() {
		return "user/changePw";
	}
	
	@PostMapping("/user/changePw")
	public String changePw(@RequestParam("userPw") String userPw,
			@RequestParam("userId") String userId) {
		userService.changePwHelper(userId, userPw);
		
		return "redirect:../main";
	}
	
	@GetMapping("/user/userInformation")
	public String toUserInfo(Model model) {
		model.addAttribute(userService.getUsers());
		return "user/userInformation";
	}
	
	@PostMapping("user/userInformation/del")
	public String delUser(@RequestParam("userId") String userId) {
		userService.delUserHelper(userId);
		return "redirect:../../logout";
	}
	
	@PostMapping("user/userInformation/fix")
	public String fixUser(@RequestParam("userId") String userId,
			@RequestParam("userName") String userName,
			@RequestParam("userNick") String userNick,
			@RequestParam("userAddressSi") String si,
			@RequestParam("userAddressGu") String gu,
			@RequestParam("userAddressDong") String dong,
			@RequestParam("userPhone") String userPhone,
			@RequestParam("userBirth") String userBirth) {

		userService.fixUserInfoHelper(userId, userName, userNick, userBirth, userPhone, si, gu, dong);

		return "redirect:../../common/mypage";
	}
	
	
	
	
	
	
	
	
	
	
	
}