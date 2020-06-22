package hot.temp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import hot.member.domain.Member;
import hot.member.repository.MemberRoleRepository;
import lombok.AllArgsConstructor;

/**
 * 일반회원가입
 * @author kosta
 *
 */

@Controller
public class MemberController {
	@Autowired
	MemberRoleRepository memberRoleRepository;
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/signup")
	public String memberInsert(Member member) {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println(member);
//		member = new Member(null, "id1", encoder.encode("1234"), "효정", "00-0242", null, memberRoleRepository.findById(1).orElse(null));
//		memberService.memberInsert(member);
	return "index";
	}

	@RequestMapping("/")
	public void url() {
		
	}
	
	@RequestMapping("/update")
	public String memberUpdate(Member member) {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println(member);
		member = new Member(null, "memberId", encoder.encode("1234"), "memberName", "memberPhone", null, memberRoleRepository.findById(1).orElse(null));
		memberService.memberUpdate(member);
	return "index";
	}
	
	
	
	
}
