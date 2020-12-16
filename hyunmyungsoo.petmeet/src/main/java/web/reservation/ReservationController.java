package hyunmyungsoo.petmeet.web.reservation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hyunmyungsoo.petmeet.domain.Reservation;
import hyunmyungsoo.petmeet.service.reservation.ReservationService;
import hyunmyungsoo.petmeet.service.review.ReviewService;
import hyunmyungsoo.petmeet.service.sitter.SitterService;
import hyunmyungsoo.petmeet.service.user.UserService;

@Controller
public class ReservationController {
	@Autowired private ReservationService reservationService;
	@Autowired private UserService userService;
	@Autowired private SitterService sitterService;
	@Autowired private ReviewService reviewService;
	
	@GetMapping("/reservation/listReservation")
	public String listReservation(@RequestParam("sitterNum") int sitterNum, Model model) {
		model.addAttribute("sitter", sitterService.getSitterNum(sitterNum)); //파라미터 : 시터번호 (리퀘스트로 받아올 예정)
		model.addAttribute("reviewForViews", reservationService.getReviewForViews(sitterNum)); //파라미터 : 시터번호 (리퀘스트로 받아올 예정)
		model.addAttribute("sitterNick", reservationService.getNicknameForSitter(sitterNum));
		model.addAttribute("sitterNum", sitterNum);
		model.addAttribute("reviewList", reviewService.getReviews());
		model.addAttribute("revList", reservationService.getReservations());
		
		return "reservation/listReservation";
	}

	@GetMapping("/reservation/checkReservation")
	public String checkReservation(Model model,HttpSession session, HttpServletRequest request) {
		Object userId = session.getAttribute("userEmail");
		Object pageNum = request.getParameter("p");
		Object pageNum2 = request.getParameter("p2");
		
		if(pageNum == null) pageNum = 1;
		if(pageNum2 == null) pageNum2 = 1;
		
		model.addAttribute("sitters", sitterService.getSitters());
		model.addAttribute("users", userService.getUsers());
		model.addAttribute("reviews", reviewService.getReviews());
		model.addAttribute("reservations", 
				reservationService.getReservationsByCondition(userId.toString(),Integer.parseInt(pageNum.toString())));
		request.setAttribute("reservationSize", reservationService.getCountById(userId.toString()));
		
		if(sitterService.getSitter(userId.toString()) == null) {
			model.addAttribute("gottenReservations", new ArrayList<Reservation>());
			request.setAttribute("gottenReservationSize", 0);
		} else {
			model.addAttribute("gottenReservations", 
					reservationService.getGottenReservations(sitterService.getSitter(userId.toString()).getSitterNum(),Integer.parseInt(pageNum2.toString())));
			request.setAttribute("gottenReservationSize", reservationService.getCountBySitterNum(sitterService.getSitter(userId.toString()).getSitterNum()));
		}
		
		return "reservation/checkReservation";
	}	
	
	@GetMapping("/reservation/accept")
	public String acceptReservation(@RequestParam Object reservNum) {
		reservationService.acceptReservation("y", Integer.parseInt(reservNum.toString()));
		
		return "redirect:../reservation/checkReservation";
	}
	
	@GetMapping("/reservation/reject")
	public String rejectReservation(@RequestParam Object reservNum) {
		reservationService.rejectReservation(Integer.parseInt(reservNum.toString()));
		
		return "redirect:../reservation/checkReservation";
	}
}