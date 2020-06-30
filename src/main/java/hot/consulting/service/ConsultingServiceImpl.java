package hot.consulting.service;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import hot.aws.S3Manager;
import hot.member.domain.Consulting;
import hot.member.domain.Contract;
import hot.member.repository.ConsultingRepository;
import hot.member.repository.ContractRepository;

@Service
public class ConsultingServiceImpl implements ConsultingService {
	@Autowired
	private ConsultingRepository consultingRep;
	@Autowired
	private ContractRepository contractRep;
	
	@Override
	public Consulting selectByIdNo(int memberNo, int chNo) {
		Consulting consulting = consultingRep.findConsultingParent(memberNo, chNo);
		if(consulting == null) {
			return null;
		}
		List<Consulting> list = consultingRep.findConsultingChild(consulting.getConsulNo());
		
		consulting.setConsultChild(list);
		
		return consulting;
	}
	
	@Override
	public Consulting selectByNo(int consulNo) {
		Consulting consulting = consultingRep.findById(consulNo).orElse(null);
		
		return consulting;
	}
	
	@Autowired
	S3Manager s3Manager;
	
	@Override
	public int insertConsulting(Consulting consulting) throws IOException {
		consultingRep.save(consulting);
		return 0;
	}

	@Override
	public int insertContract(Contract contract) {
		contractRep.save(contract);
		return 0;
	}
	
	@Override
	public Contract selectContractByNo(int consulNo) {
		return contractRep.findById(consulNo).orElse(null);
	}
}
