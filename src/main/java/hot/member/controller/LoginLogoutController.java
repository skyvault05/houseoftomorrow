package hot.member.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import hot.member.domain.Member;
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
