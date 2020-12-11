package hyunmyungsoo.petmeet.web.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSendException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hyunmyungsoo.petmeet.domain.Email;
import hyunmyungsoo.petmeet.domain.User;
import hyunmyungsoo.petmeet.service.email.MyMailService;
import hyunmyungsoo.petmeet.service.user.UserService;

@Controller
public class MyMailController {
	@Autowired private MyMailService mailService;
	@Autowired private UserService userService;
	
	@PostMapping("/user/signUp")
	public String send(Email msg, Model model,
			@RequestParam("to") String userEmail) {
		String link = "";
		
		String signUpChecker = userService.signUpCheck(userEmail);
		if(signUpChecker.equals("ALREADY")) {
			model.addAttribute("error", "이미 회원가입한 이메일입니다. 다른 이메일 입력해세요");
			link = "user/signUp";
		}
		
		if(signUpChecker.equals("DELUSER")) {
			model.addAttribute("error", "탈퇴이력이 있는 이메일입니다. 다른 이메일 입력해세요");
			link = "user/signUp";
		}
		
		if(signUpChecker.equals("SEND")) {
			model.addAttribute("email", userEmail);
			mailService.send(msg);
			link = "user/signUp2";
		}
		
		return link;
	}
	
	@PostMapping("/user/findPw")
	public String send2(Email msg, Model model,
			@RequestParam("to") String userId, 
			@RequestParam("checkCode") String checkCode) {
		String link = "";

		String hasUser = userService.fixPwHelper(userId);
		if(hasUser.equals("EMPTY")) {
			model.addAttribute("error", "일치하는 정보가 없습니다.");
			link = "user/findPw";
		}
		if(hasUser.equals("SUCCESS")) {
			model.addAttribute("email", userId);
			model.addAttribute("checkCode", checkCode);
			mailService.send(msg);
			link = "user/findPw2";
		}
		
		return link;
	}
	
	@ExceptionHandler(MailSendException.class) //for a MailSend type of exception
	public String handleError() {
		return "";
	}//원래는 LOG 남긴다
}
