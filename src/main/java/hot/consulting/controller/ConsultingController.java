package hot.consulting.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import hot.aws.S3Manager;
import hot.channel.domain.Channel;
import hot.consulting.service.ConsultingService;
import hot.member.domain.Consulting;
import hot.member.domain.Contract;
import hot.member.domain.Member;

@Controller
public class ConsultingController {
	@Autowired
	private ConsultingService consultService;
	
	/**
	 * 유저의 상담하기 페이지
	 */
	@RequestMapping("/member/consultingForm")
	public ModelAndView consultForm(int chNo) {
		return new ModelAndView("channel/member/consultUserDetail", "chNo", chNo);
	}
	
	/**
	 * 시공사의 상담하기 페이지
	 */
	@RequestMapping("/constructor/consultingForm")
	public ModelAndView conConsultForm(Integer consulNo) {
		return new ModelAndView("channel/constructor/consultConDetail", "consulNo", consulNo);
	}
	
	/**
	 * 유저의 상담내역 불러오기
	 */
	@ResponseBody
	@RequestMapping("/member/preConsulting")
	public Consulting consultList(int memberNo, int chNo) {
		Consulting consulting = consultService.selectByIdNo(memberNo, chNo);
		
		return consulting;
	}
	
	/**
	 * 시공사의 상담내역 불러오기
	 */
	@ResponseBody
	@RequestMapping("constructor/preConsulting")
	public Consulting consultList(int consulNo) {
		Consulting consulting = consultService.selectByNo(consulNo);
		
		return consulting;
	}
	
	/**
	 * 유저의 상담하기
	 */
	@PostMapping("/member/consulting")
	public String consulting(Consulting consulting, int memberNo, int chNo, RedirectAttributes redirect) throws Exception{
		Member member = new Member();
		Channel channel = new Channel();
		member.setMemberNo(memberNo);
		channel.setChNo(chNo);
		
		redirect.addAttribute("chNo", chNo);
		consulting.setMember(member);
		consulting.setChannel(channel);
		
		consultService.insertConsulting(consulting);
		return "redirect:consultingForm";
	}
	
	/**
	 * 시공사의 상담하기
	 */
	@PostMapping("/constructor/consulting")
	public String conConsulting(Consulting consulting, int memberNo, int chNo, RedirectAttributes redirect) throws Exception{
		Member member = new Member();
		Channel channel = new Channel();
		member.setMemberNo(memberNo);
		channel.setChNo(chNo);
		
		consulting.setMember(member);
		consulting.setChannel(channel);
		redirect.addAttribute("consulNo", consulting.getConsulParentNo());
		
		consultService.insertConsulting(consulting);
		return "redirect:consultingForm";
	}
	
	/**
	 * 시공사의 계약서 등록하기
	 */
	@RequestMapping("/{every}/contractView")
	public ModelAndView contract(int consulNo) {
		return new ModelAndView("channel/member/contractDetail", "consulNo", consulNo);
	}
	
	/**
	 * 계약서 등록하기
	 */
	@Autowired
	S3Manager s3Manager;
	
	@PostMapping("/constructor/contractRegist")
	public String handleImageUpload(int consulNo, MultipartFile file, RedirectAttributes redirect) throws Exception {
		String fileName;
		try {
			if (file.isEmpty()) {
				throw new Exception("파일이 없다..?");
			}
			fileName = s3Manager.saveUploadedFiles(file);
		} catch (IOException e) {
			throw new Exception(e.getMessage());
		}
		Contract contract = consultService.selectContractByNo(consulNo);
		if(contract == null) {
			contract = new Contract();
		}
		Consulting consulting = consultService.selectByNo(consulNo);
		contract.setConsulting(consulting);
		contract.setContractImg(fileName);
		contract.setConsulUserDecide(1);
		contract.setConsulConDecide(1);
		consultService.insertContract(contract);
		redirect.addAttribute("consulNo", consulNo);
		
		return "redirect:contractView";
	}
}
