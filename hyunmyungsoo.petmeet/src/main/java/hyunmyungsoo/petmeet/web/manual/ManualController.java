package hyunmyungsoo.petmeet.web.manual;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManualController {
	@GetMapping("/manual/manualList")
	public String toManual() {
		return "manual/manualList";
	}
}
