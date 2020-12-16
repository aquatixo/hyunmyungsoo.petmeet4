  package hyunmyungsoo.petmeet.web.review;

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

import hyunmyungsoo.petmeet.service.reservation.ReservationService;
import hyunmyungsoo.petmeet.service.review.ReviewService;
import hyunmyungsoo.petmeet.service.sitter.SitterService;
import hyunmyungsoo.petmeet.service.user.UserService;

@Controller
public class ReviewController {
	@Autowired private ReviewService reviewService;
	@Autowired private SitterService sitterService;
	@Autowired private UserService userService;
	@Autowired private ReservationService reservationService;
	
	@Value("img")
	private String attachDir;
	
	@GetMapping("/review/listReview")
	public String listReview(Model model, HttpSession session) {
		model.addAttribute("reviewList", reviewService.getReviews());
		model.addAttribute("sitterList", sitterService.getSitters());
		model.addAttribute("userList", userService.getUsers());
		model.addAttribute("reservationList", reservationService.getReservations());
		model.addAttribute("userId", session.getAttribute("userEmail"));
		return "review/listReview";
	}

	
	@GetMapping("/review/insertReview")
	public String insertReview(@RequestParam("reservNum") int reservNum, Model model) {
		model.addAttribute("reviewList", reviewService.getReviews());
		model.addAttribute("sitterList", sitterService.getSitters());
		model.addAttribute("userList", userService.getUsers());
		model.addAttribute("reservationList", reservationService.getReservations());
		model.addAttribute("review", reviewService.getReview(reservNum));
		
		model.addAttribute("reservNumber", reservNum);
		return "review/insertReview";
	}
	
	@PostMapping("/review/insertReview")
	public String insertReview(HttpServletRequest request,
			@RequestParam MultipartFile attachFile,
			@RequestParam("userId") String userId, 
			@RequestParam("reviewRating") String reviewRating,
			@RequestParam("reviewContent") String reviewContent,
			@RequestParam("reservNum") int reservNum,
			@RequestParam("sitterNum") int sitterNum
			)throws Exception{
		
		String dir = request.getServletContext().getRealPath(attachDir);
		String fileName = "review" + userId + reservNum +".PNG";
		save(dir + "/" + fileName, attachFile);
		
		reviewService.addReviewHelper(fileName, reviewRating, reviewContent, userId, reservNum, sitterNum);
		return "redirect:../review/listReview";
	}
	
	private void save(String fileName, MultipartFile attachFile) {
		try {
			attachFile.transferTo(new File(fileName));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/review/updateReview")
	public String updateReview(@RequestParam("reviewNum") int reviewNum, Model model) throws Exception{
		model.addAttribute("reviewList", reviewService.getReviews());
		model.addAttribute("sitterList", sitterService.getSitters());
		model.addAttribute("userList", userService.getUsers());
		model.addAttribute("reservationList", reservationService.getReservations());
		model.addAttribute("review", reviewService.getReview(reviewNum));
		return "review/updateReview";
	}
	
	@PostMapping("/review/updateReview")
	public String updateReview(HttpServletRequest request,
			@RequestParam MultipartFile attachFile,
			@RequestParam("userId") String userId, 
			@RequestParam("reviewRating") String reviewRating,
			@RequestParam("reviewContent") String reviewContent,
			@RequestParam("reservNum") int reservNum,
			@RequestParam("sitterNum") int sitterNum,
			@RequestParam("reviewNum") int reviewNum
			)throws Exception{
		
		String dir = request.getServletContext().getRealPath(attachDir);
		String fileName = "review" + userId + reservNum + ".PNG";
		
		if(!attachFile.isEmpty()) {
			save(dir + "/" + fileName, attachFile);
		}
		
		reviewService.fixReviewHelper(fileName, reviewRating, reviewContent, userId, reservNum, sitterNum, reviewNum);
		
		return "redirect:../review/listReview";
	}
		
	@PostMapping("/review/listReview")
	public String deleteReview(HttpSession session,HttpServletRequest request,
			@RequestParam("reviewNum") int reviewNum) {
		reviewService.delReviewHelper(reviewNum);
		return "redirect:../review/listReview";
	}
}