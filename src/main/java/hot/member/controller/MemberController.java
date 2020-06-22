package hot.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hot.member.domain.Member;

@Controller
public class MemberController {
	@RequestMapping("/memberSignup")
	public String signupForm() {
		return "manage/guest/memberJoinForm";
	}
	
	@PostMapping("/signup")
	public String signup(Member member) {
		System.out.println(member.getMemberId());
		System.out.println(member.getMemberPhone());
		System.out.println(member.getMemberPwd());
		System.out.println(member.getMemberName());
		return "common/loginForm";
	}
}
