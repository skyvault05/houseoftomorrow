package hot.estimate.service;

import java.util.List;

import hot.estimate.domain.EstResponse;
import hot.estimate.domain.Estimate;
import hot.member.domain.Member;

public interface EstimateService {
	Estimate insertEstimate(Estimate estimate, Integer memberNo);
	List<Estimate> estList(Integer memberNo);
	
	Estimate selectByEstNo(Integer estNo);
	void insertEstimateResponse(EstResponse estResponse, Integer estNo, Integer chNo);
	List<EstResponse> selectResponseByEstNo(Integer estNo);
	List<Estimate> selectAll();

}
