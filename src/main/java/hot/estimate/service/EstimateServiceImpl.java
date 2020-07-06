package hot.estimate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hot.channel.repository.ChannelRepository;
import hot.estimate.domain.EstResponse;
import hot.estimate.domain.Estimate;
import hot.estimate.repository.EstResponseRepository;
import hot.estimate.repository.EstimateRepository;
import hot.member.domain.Member;
import hot.member.repository.MemberRepository;

@Service
public class EstimateServiceImpl implements EstimateService {
	@Autowired
	private EstimateRepository estimateRep;
	@Autowired
	private EstResponseRepository estRespRep;
	@Autowired
	private MemberRepository memberRepository;
	@Autowired
	private ChannelRepository chRep;
	@Override
	public void insertEstimate(Estimate estimate, Integer memberNo) {
		Member member = memberRepository.findById(memberNo).orElse(null);
		estimate.setMember(member);
		estimateRep.save(estimate);
	}
	@Override
	public List<Estimate> estList(Integer memberNo) {
		//디비에서 list 가져오기
		Member member = new Member();
		member.setMemberNo(memberNo);
		
		//리스트 리턴하기
		return estimateRep.findByMemberNo(member);
	}
	
	@Override
	public Estimate selectByEstNo(Integer estNo) {
		return estimateRep.findById(estNo).orElse(null);
	}
	@Override
	public void insertEstimateResponse(EstResponse estResponse, Integer estNo, Integer chNo) {
		estResponse.setEstimate(estimateRep.findById(estNo).orElse(null));
		estResponse.setChannel(chRep.findById(chNo).orElse(null));
		estRespRep.save(estResponse);
	}
	@Override
	public List<EstResponse> selectResponseByEstNo(Integer estNo) {
		Estimate estimate = estimateRep.findById(estNo).orElse(null);
		List<EstResponse> reponseList = estRespRep.findByEstimateOrderByEstRespRegdateDesc(estimate);
		return reponseList;
	}

		
	
	
}
