package hot.estimate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EstimateController {
	@RequestMapping("/estimate")
	public String estimate() {
		return "/estimate/member/estimateForm";
	}

}
