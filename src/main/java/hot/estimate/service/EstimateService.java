package hot.estimate.service;

import java.util.List;

import hot.estimate.domain.Estimate;
import hot.member.domain.Member;

public interface EstimateService {
	void insertEstimate(Estimate estimate, Integer memberNo);
	List<Estimate> estList(Integer memberNo);
	
	Estimate selectByEstNo(Integer estNo);

}
