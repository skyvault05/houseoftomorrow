package hot.estimate.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hot.channel.repository.ChannelRepository;
import hot.estimate.domain.Bathroom;
import hot.estimate.domain.EstResponse;
import hot.estimate.domain.Estimate;
import hot.estimate.domain.Floor;
import hot.estimate.domain.Kitchen;
import hot.estimate.domain.Linoleum;
import hot.estimate.domain.Papering;
import hot.estimate.domain.Tile;
import hot.estimate.service.EstimateService;
import hot.member.domain.Member;
import hot.member.service.MemberService;
import hot.security.CustomUser;

@Controller
public class EstimateController {
	@Autowired
	private EstimateService estimateService;
	@Autowired
	private ChannelRepository chRep;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/estimate")
	public String estimate() {
		
		
		return "/estimate/member/requestForm";
	}
	
	@PostMapping("/estimateResult")
	public String estimateResult(Estimate estimate, Papering papering, Linoleum linoleum ,Floor floor, Bathroom bathroom, Kitchen kitchen, Tile tile, Integer memberNo) {
		estimate.setPapering(papering);
		estimate.setLinoleum(linoleum);
		estimate.setFloor(floor);
		estimate.setBathroom(bathroom);
		estimate.setKitchen(kitchen);
		estimate.setTile(tile);
		
		System.out.println(estimate.getEstDescription());
		Estimate newEst = estimateService.insertEstimate(estimate, memberNo);
		
		return "redirect:/viewEstimateDetail/"+newEst.getEstNo();
	}
	
	@RequestMapping("/myEstimateList/{memberNo}")
	public ModelAndView myEstimateList(@PathVariable Integer memberNo){
		List<Estimate> list = estimateService.estList(memberNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/estimate/member/requestList");
		return mv;
	}
	
	@RequestMapping("/viewEstimateDetail/{estNo}")
	public ModelAndView estiPapering(@PathVariable Integer estNo) {
		Boolean isConstructor = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Estimate estimate = estimateService.selectByEstNo(estNo);
		List<EstResponse> responseList = estimateService.selectResponseByEstNo(estNo);
		estimate.setEstimateDetails();
		ModelAndView mv = new ModelAndView();
		mv.addObject("estimate", estimate);
		mv.addObject("responseList", responseList);
		mv.setViewName("/estimate/member/requestDetail");
		
		if(!principal.equals("anonymousUser")) {
			CustomUser user = (CustomUser) principal;
			Member member = memberService.findMemberByMemberNo(user.getMemberNo());
			if(member.getMemberRole().getMemberRoleNo()==2 || member.getMemberRole().getMemberRoleNo()==3) isConstructor = true;
			mv.addObject("isConstructor", isConstructor);
		}
		return mv;
	}
	
	@PostMapping("/estimate/constructor/registerEstimateResponse")
	public String registerEstimateResponse(EstResponse estResponse, Integer estNo, Integer chNo) {		
		System.out.println(estNo+":"+chNo);
		estimateService.insertEstimateResponse(estResponse, estNo, chNo);
		return "redirect:/viewEstimateDetail/"+estResponse.getEstimate().getEstNo();
	}
	
	@RequestMapping("/estimate/guest/requestAll")
	public ModelAndView allEstimate() {
		List<Estimate> list = estimateService.selectAll();
		Collections.reverse(list);
//		list.forEach(item -> item.setEstimateDetails());
		return new ModelAndView("estimate/guest/requestAll", "list", list);
	}
}
