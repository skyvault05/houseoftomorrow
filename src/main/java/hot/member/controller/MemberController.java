package hot.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hot.channel.domain.Channel;
import hot.channel.service.ChannelService;
import hot.member.domain.Constructor;
import hot.member.domain.Member;
import hot.member.domain.MemberRole;
import hot.member.repository.MemberRoleRepository;
import hot.member.service.MemberService;
import hot.security.CustomUser;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberRoleRepository memberRoleRepository;
	@Autowired
	private ChannelService channelService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	/**
	 * 
	 * */
	@RequestMapping("/choiceJoin")
	public String choiceJoin() {
		return "manage/guest/choiceJoinForm";
	}
	
	
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
	public String ConstructorInsert(Member member, Constructor constructor, Channel channel, MultipartFile chImgFile) {
		member.setMemberRole(memberRoleRepository.findById(2).orElse(null));
		member.setMemberPwd(passwordEncoder.encode(member.getMemberPwd()));
		constructor.setMember(member);
		channel.setChImg("sample.jpg");
		channel.setConstructor(constructor);
		
		channelService.insertChannel(channel, chImgFile);		
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
	
	@RequestMapping("/update")
	public String memberUpdate(Member member) {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println(member);
		member = new Member(null, "memberId", encoder.encode("1234"), "memberName", "memberPhone", null, memberRoleRepository.findById(1).orElse(null));
		memberService.memberUpdate(member, "1");
	return "index";
	}
	
	@RequestMapping("/requestDetail")
	public String requestDetail() {
		return "/estimate/member/requestDetail";
	}
	
	/**
	 * 유저 이름 가져오기
	 */
	@ResponseBody
	@RequestMapping("/constructor/memberId")
	public String findMemberName(Integer memberNo) {
		String name = memberService.findMemberName(memberNo);
		return name;
	}
	
	@RequestMapping("/manage/member/memberUpdateForm")
	public ModelAndView memberUpdateForm() {
		CustomUser principal = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Member member = memberService.findMemberByMemberNo(principal.getMemberNo());
		return new ModelAndView("/manage/member/memberUpdateForm", "member", member);
	}
	
	@PostMapping("/manage/member/memberUpdate")
	public String memberUpdate(Member member, String currentPassword) {
		memberService.memberUpdate(member, currentPassword);
		return "redirect:/";
	}
}
