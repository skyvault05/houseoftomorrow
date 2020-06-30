package hot.consulting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hot.channel.domain.Channel;
import hot.consulting.service.ConsultingService;
import hot.member.domain.Consulting;
import hot.member.domain.Member;

@Controller
public class ConsultingController {
	@Autowired
	private ConsultingService consultService;
	
	@RequestMapping("/member/consultingForm")
	public String consultForm() {
		return "channel/member/consultUserDetail";
	}
	
	@ResponseBody
	@RequestMapping("/member/preConsulting")
	public Consulting consultList(String memberId, int chNo) {
		Consulting consulting = consultService.selectByIdNo(memberId, chNo);
		
		return consulting;
	}
	
	@PostMapping("/member/consulting")
	public String consulting(Consulting consulting, int memberNo, int chNo) {
		System.out.println(consulting.getConsulParentNo());
		System.out.println(consulting.getConsulDescription());
		System.out.println(memberNo);
		System.out.println(chNo);
		Member member = new Member();
		Channel channel = new Channel();
		member.setMemberNo(memberNo);
		channel.setChNo(chNo);
		
		consulting.setMember(member);
		consulting.setChannel(channel);
		
		consultService.insertConsulting(consulting);
		return "redirect:consultingForm";
	}
}
