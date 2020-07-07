package hot.consulting.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

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
import hot.consulting.domain.Consulting;
import hot.consulting.domain.Contract;
import hot.consulting.service.ConsultingService;
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
	@PostMapping("/member/preConsulting")
	public Consulting consultList(int memberNo, int chNo) {
		Consulting consulting = consultService.selectByIdNo(memberNo, chNo);
		
		return consulting;
	}
	
	/**
	 * 시공사의 상담내역 불러오기
	 */
	@ResponseBody
	@PostMapping("/constructor/preConsulting")
	public Consulting consultList(int consulNo) {
		Consulting consulting = consultService.selectByNoConsulting(consulNo);
		
		return consulting;
	}
	
	/**
	 * 유저의 상담하기
	 */
	@PostMapping("/member/consulting")
	public String consulting(Consulting consulting, RedirectAttributes redirect) throws Exception{
		redirect.addAttribute("chNo", consulting.getChNo());
		
		consultService.insertConsulting(consulting);
		return "redirect:consultingForm";
	}
	
	/**
	 * 시공사의 상담하기
	 */
	@PostMapping("/constructor/consulting")
	public String conConsulting(Consulting consulting, RedirectAttributes redirect) throws Exception{
		redirect.addAttribute("consulNo", consulting.getConsulParentNo());
		
		consultService.insertConsulting(consulting);
		return "redirect:consultingForm";
	}
	
	/**
	 * 시공사의 계약서 등록하기
	 */
	@PostMapping(value = {"/constructor/contractView", "/member/contractView"})
	public ModelAndView contract(int consulNo) {
		return new ModelAndView("channel/member/contractDetail", "consulNo", consulNo);
	}
	
	@Autowired
	S3Manager s3Manager;

	/**
	 * 계약서 등록하기
	 */
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
	
	/**
	 * 계약서 가져오기
	 */
	@ResponseBody
	@PostMapping(value= {"/member/contractImg","/constructor/contractImg"})
	public Contract imgUrl(Integer consulNo) {
		Contract contract = consultService.selectContractByNo(consulNo);
		
		return contract;
	}
	
	/**
	 * 계약 수락/취소 하기
	 */
	@PostMapping(value= {"/member/contractUpdate","/constructor/contractUpdate"})
	public String contract(Contract contract, RedirectAttributes redirect) {
		Contract preContract = consultService.selectContractByNo(contract.getConsulNo());
		if(contract.getConsulConDecide() == 2) {
			preContract.setConsulConDecide(preContract.getConsulConDecide() == 1 ? 2 : 1);
		}else {
			preContract.setConsulUserDecide(preContract.getConsulUserDecide() == 1 ? 2 : 1);
		}
		consultService.insertContract(preContract);

		redirect.addAttribute("consulNo", contract.getConsulNo());
		return "redirect:contractView";
	}
	
	/**
	 * 계약 완료된 상담 내용 페이지 가기
	 */
	@PostMapping(value= {"/member/consultingView","/constructor/consultingView"})
	public ModelAndView completeConsulting(Integer consulNo) {
		return new ModelAndView("channel/member/preConsultDetail", "consulNo", consulNo);
	}
	
	/**
	 * 계약 완료된 상담 내용 보기
	 */
	@ResponseBody
	@PostMapping(value= {"/constructor/completeConsulting", "/member/completeConsulting"})
	public Consulting consultCom(int consulNo) {
		Consulting consulting = consultService.selectByNo(consulNo);
		return consulting;
	}
	
	/**
	 * 상담 목록 페이지
	 */
	@RequestMapping("/member/consultingAllPage")
	public String consultingAllPage() {
		return "channel/member/consultUserAll";
	}
	
	/**
	 * 유저 상담 목록 보기
	 */
	@ResponseBody
	@PostMapping("/member/consultingAll")
	public List<Consulting> consultingAll(Integer memberNo) {
		List<Consulting> list = consultService.selectUserConsulting(memberNo);
		return list;
	}
	
	/**
	 * 시공사 상담 목록 보기
	 */
	@ResponseBody
	@PostMapping("/constructor/consultingAll")
	public List<Consulting> consultingConAll(Integer chNo){
		List<Consulting> list = consultService.selectConConsulting(chNo);
		return list;
	}
	
	/**
	 * 완료된 계약 목록 페이지
	 */
	@RequestMapping("/member/contractAll")
	public String contractAll() {
		return "channel/member/contractAll";
	}
	
	/**
	 * 완료된 계약 목록 보기
	 */
	@ResponseBody
	@PostMapping("/member/contractDate")
	public Timestamp contractDate(Integer consulNo){

		return null;
	}
}
