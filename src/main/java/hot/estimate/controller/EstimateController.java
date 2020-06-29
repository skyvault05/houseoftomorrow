package hot.estimate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import hot.estimate.domain.Bathroom;
import hot.estimate.domain.Estimate;
import hot.estimate.domain.Floor;
import hot.estimate.domain.Kitchen;
import hot.estimate.domain.Linoleum;
import hot.estimate.domain.Papering;
import hot.estimate.domain.Tile;

@Controller
public class EstimateController {
	@RequestMapping("/estimate")
	public String estimate() {
		return "/estimate/member/estimateForm";
	}
	
	@RequestMapping("/estimateResult")
	public String estimateResult(Estimate estimate, Papering papering, Linoleum linoleum ,Floor floor, Bathroom bathroom, Kitchen kitchen, Tile tile) {
		estimate.setPapering(papering);
		estimate.setLinoleum(linoleum);
		estimate.setFloor(floor);
		estimate.setBathroom(bathroom);
		estimate.setKitchen(kitchen);
		estimate.setTile(tile);
		
		System.out.println(estimate);
		return "/estimate/member/estimateResult";
	}
	
}
