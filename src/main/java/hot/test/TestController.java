package hot.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import hot.constructor.repository.PortfolioRepository;

@Controller
public class TestController {
	@Autowired
	private PortfolioRepository portRep;
	@RequestMapping("/test")
	public String test() {
		portRep.findAll();
		return "/member/test";
	}
	
	@RequestMapping("/logintest")
	public String logintest() {
		return "/estimate/member/requestForm";
	}
}
