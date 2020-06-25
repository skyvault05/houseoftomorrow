package hot.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import hot.member.domain.Channel;
import hot.member.domain.Constructor;
import hot.member.domain.Member;
import hot.member.domain.MemberRole;
import hot.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	/**
	 * 회원가입 폼으로
	 */
	@RequestMapping("/memberSignup")
	public String signupForm() {
		return "manage/guest/memberJoinForm";
	}
	
	
	/**
	 * 회원가입
	 */
	@PostMapping("/signup")
	public String memberInsert(Member member, MemberRole role) {
		member.setMemberRole(role);
		memberService.memberInsert(member);
		
		return "common/loginForm";
	}
	
	/**
	 * 시공사 회원가입 폼으로
	 */
	@RequestMapping("/constructorSignup")
	public String conSignup() {
		return "manage/guest/constructorJoinForm";
	}
	
	/**
	 * 시공사 회원가입
	 */
	@PostMapping("/conSignup")
	public String ConstructorInsert(Member member, Constructor constructor, Channel channel) {
		System.out.println(member);
		System.out.println(constructor);
		System.out.println(channel);
		return "common/loginForm";
	}
	
	/**
	 * 아이디 중복 체크
	 */
	@ResponseBody
	@RequestMapping("/idCheck")
	public String dupCheck(String memberId) {
		Member member = memberService.selectMember(memberId);
		if(member == null) {
			return "possible";
		}else {
			return "impossible";
		}
	}
	
	/**
	 * 폰번호 중복 체크
	 */
	@ResponseBody
	@RequestMapping("/phoneCheck")
	public String phoneDupCheck(String memberPhone) {
		Member member = memberService.selectMemberByPhone(memberPhone);
		if(member == null) {
			return "possible";
		}else {
			return "impossible";
		}
	}
}
