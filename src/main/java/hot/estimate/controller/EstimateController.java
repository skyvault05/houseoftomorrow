package hot.estimate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hot.estimate.domain.Bathroom;
import hot.estimate.domain.Estimate;
import hot.estimate.domain.Floor;
import hot.estimate.domain.Kitchen;
import hot.estimate.domain.Linoleum;
import hot.estimate.domain.Papering;
import hot.estimate.domain.Tile;
import hot.estimate.service.EstimateService;

@Controller
public class EstimateController {
	@Autowired
	private EstimateService estimateService;
	@RequestMapping("/estimate")
	public String estimate() {
		return "/estimate/member/requestForm";
	}
	
	@RequestMapping("/estimateResult")
	public String estimateResult(Estimate estimate, Papering papering, Linoleum linoleum ,Floor floor, Bathroom bathroom, Kitchen kitchen, Tile tile, Integer memberNo) {
		estimate.setPapering(papering);
		estimate.setLinoleum(linoleum);
		estimate.setFloor(floor);
		estimate.setBathroom(bathroom);
		estimate.setKitchen(kitchen);
		estimate.setTile(tile);
		
		System.out.println(estimate);
		estimateService.insertEstimate(estimate, memberNo);
		return "/estimate/member/requestForm";
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
		Estimate estimate = estimateService.selectByEstNo(estNo);
		estimate.setEstimateDetails();
		ModelAndView mv = new ModelAndView();
		mv.addObject("estimate", estimate);
		mv.setViewName("/estimate/member/requestDetail");
		return mv;
	}
	
	
}
