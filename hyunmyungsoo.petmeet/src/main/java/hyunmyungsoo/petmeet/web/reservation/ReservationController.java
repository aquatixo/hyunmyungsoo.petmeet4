package hyunmyungsoo.petmeet.web.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hyunmyungsoo.petmeet.service.reservation.ReservationService;
import hyunmyungsoo.petmeet.service.sitter.SitterService;
import hyunmyungsoo.petmeet.service.user.UserService;

@Controller
public class ReservationController {
	@Autowired private ReservationService reservationService;
	@Autowired private UserService userService;
	@Autowired private SitterService sitterService;
	
	@GetMapping("/reservation/sitterMain")
	public String toReservation(@RequestParam("sitterNum") int sitterNum, Model model) {
		model.addAttribute("sitter", sitterService.getSitterNum(sitterNum)); //파라미터 : 시터번호 (리퀘스트로 받아올 예정)
		model.addAttribute("reviewForViews", reservationService.getReviewForViews(sitterNum)); //파라미터 : 시터번호 (리퀘스트로 받아올 예정)
		model.addAttribute("sitterNick", reservationService.getNicknameForSitter(sitterNum));
		model.addAttribute("sitterNum", sitterNum);
		
		return "reservation/reservationMain";
	}

	@GetMapping("/reservation/reservationCheck")
	public String toReservation02(Model model) {
		model.addAttribute("reservations", reservationService.getReservations());
		model.addAttribute("sitters", sitterService.getSitters());
		model.addAttribute("users", userService.getUsers());
		
		return "reservation/reservationCheck";
	}
	
}
