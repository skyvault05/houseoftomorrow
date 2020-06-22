package hot.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hot.member.repository.MemberRepository;

@Controller
public class LoginLogoutController {
	@Autowired
	MemberRepository rep;
	
	@RequestMapping("/{url}")
	public void url() {}
	
	@RequestMapping("/{url1}/{url2}")
	public void url2() {}
	
	@RequestMapping("/member/test")
	public String test() {
		System.out.println("d");
		return "manage/member/testPage";
	}
}
