package hot.estimate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

		
	
	
}
