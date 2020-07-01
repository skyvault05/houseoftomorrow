package hot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import hot.constructor.service.portfolioServiceImpl;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {

	private final portfolioServiceImpl portfolioService;
	
	@RequestMapping("/")
	public String index() {
		
		
		
		return "/common/index";
	}
}