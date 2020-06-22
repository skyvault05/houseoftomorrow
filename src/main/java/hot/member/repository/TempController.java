package hot.member.repository;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TempController {
	@RequestMapping("/dd")
	public String dd() {
		System.out.println(112);
		return "/";
	}
}
