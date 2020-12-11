package hyunmyungsoo.petmeet.web.sitter;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import hyunmyungsoo.petmeet.service.sitter.SitterService;
import hyunmyungsoo.petmeet.service.user.UserService;

@Controller
public class SitterController {
	@Autowired private SitterService sitterService;
	@Autowired private UserService userService;
	@Value("img")
	private String attachDir;
	
	@GetMapping("/sitter/sitterMain")
	public String listSitterPage(Model model) {
		model.addAttribute("sitterList", sitterService.getSitters());
		model.addAttribute("userList", userService.getUsers());
		return "sitter/sitterMain";
	}
	
	@GetMapping("/sitter/insertSitter")
	public String insertSitterPage() {
		return "sitter/insertSitter";
	}
	
	@PostMapping("/sitter/insertSitter")
	public String insertSitterPage(@RequestParam("sitterTitle") String sitterTitle,
			@RequestParam("sitterContent") String sitterContent, @RequestParam("sitterPetType") String sitterPetType,
			@RequestParam(value = "sitterPetSize", required=false) String sitterPetSize, @RequestParam("sitterLocSi") String sitterLocSi, @RequestParam("sitterLocGu") String sitterLocGu,
			@RequestParam("sitterLocDong") String sitterLocDong, @RequestParam("daterange") String daterange, 
			HttpSession session, HttpServletRequest request,
			@RequestParam MultipartFile attachFile,
			@RequestParam("userId") String userId) throws ParseException {
		String dir = request.getServletContext().getRealPath(attachDir);
		
		String sitterFileName = "sitter" + userId + ".PNG";
		if(!attachFile.isEmpty()) {
		save(dir + "/" + sitterFileName, attachFile);
		}
		sitterService.assignSitter(session, sitterTitle, sitterContent, sitterPetType, sitterPetSize, sitterLocSi, sitterLocGu, sitterLocDong, daterange, sitterFileName);
		return "redirect:../common/mypage";
	}
	
	private void save(String sitterFileName, MultipartFile attachFile) {
		try {
			attachFile.transferTo(new File(sitterFileName));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	@GetMapping("/sitter/upDelSitter")
	public String updDelSitterPage(Model model, HttpSession session) {
		String userId = session.getAttribute("userEmail").toString();
		model.addAttribute("sitter", sitterService.getSitter(userId));
		return "sitter/upDelSitter";
	}
	
	@PostMapping("/sitter/upDelSitter")
	public String fixSitter(String sitterFileName, @RequestParam("sitterTitle") String sitterTitle,
			@RequestParam("sitterContent") String sitterContent, @RequestParam("sitterPetType") String sitterPetType, @RequestParam(value = "sitterPetSize", required=false) String sitterPetSize,
			@RequestParam("sitterLocSi") String sitterLocSi, @RequestParam("sitterLocGu") String sitterLocGu, @RequestParam("sitterLocDong") String sitterLocDong, @RequestParam("daterange") String daterange,
			HttpSession session,HttpServletRequest request, @RequestParam("userId") String userId, @RequestParam MultipartFile attachFile ) throws ParseException {
		
			String dir = request.getServletContext().getRealPath(attachDir);
		
		sitterFileName = "sitter" + userId + ".PNG";
		if(!attachFile.isEmpty()) {
			save(dir + "/" + sitterFileName, attachFile);
			}
		
		sitterService.fixSitter(session, sitterTitle, sitterContent, sitterPetType, sitterPetSize, sitterLocSi, sitterLocGu, sitterLocDong, daterange, sitterFileName);
		return "redirect:../common/mypage";
	}
	
	@PostMapping("/sitter/upDelSitter/del")
	public String delSitter(@RequestParam("userId") String userId) {
		sitterService.delSitter(userId);
		return "redirect:../../common/mypage";
	}
}

