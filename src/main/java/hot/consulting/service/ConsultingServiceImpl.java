package hot.consulting.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import hot.aws.S3Manager;
import hot.member.domain.Consulting;
import hot.member.repository.ConsultingRepository;

@Service
public class ConsultingServiceImpl implements ConsultingService {
	@Autowired
	private ConsultingRepository consultingRep;
	
	@Override
	public Consulting selectByIdNo(String memberId, int chNo) {
		Consulting consulting = consultingRep.findConsultingParent(memberId, chNo);
		List<Consulting> list = consultingRep.findConsultingChild(consulting.getConsulNo());
		consulting.setConsultChildNo(list);
		
		return consulting;
	}
	
	@Autowired
	S3Manager s3Manager;
	
	@Override
	public int insertConsulting(Consulting consulting) {
		File file = new File("");
		consultingRep.save(consulting);
		return 0;
	}

}
