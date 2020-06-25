package hot.consulting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hot.member.domain.Consulting;
import hot.member.repository.ConsultingRepository;

@Service
public class ConsultingServiceImpl implements ConsultingService {
	@Autowired
	private ConsultingRepository consultingRep;
	
	@Override
	public Integer selectByIdNo(String memberId, int chNo) {
		Integer consulNo = consultingRep.findConsultingParent(memberId, chNo);
		return consulNo;
	}

}
