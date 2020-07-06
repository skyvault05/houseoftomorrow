package hot.consulting.service;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import hot.aws.S3Manager;
import hot.consulting.domain.Consulting;
import hot.consulting.domain.Contract;
import hot.consulting.repository.ConsultingRepository;
import hot.consulting.repository.ContractRepository;

@Service
public class ConsultingServiceImpl implements ConsultingService {
	@Autowired
	private ConsultingRepository consultingRep;
	@Autowired
	private ContractRepository contractRep;
	
	@Override
	public Consulting selectByIdNo(int memberNo, int chNo) {
		Consulting consulting = consultingRep.findConsultingParent(memberNo, chNo);
		
		return consulting;
	}
	
	@Override
	public Consulting selectByNo(int consulNo) {
		Consulting consulting = consultingRep.findById(consulNo).orElse(null);
		
		return consulting;
	}
	
	@Override
	public Consulting selectByNoConsulting(int consulNo) {
		Consulting consulting = consultingRep.findByIdConsulting(consulNo);
		
		return consulting;
	}
	
	@Autowired
	S3Manager s3Manager;
	
	@Override
	public int insertConsulting(Consulting consulting) throws IOException {
		consultingRep.save(consulting);
		return 0;
	}

	@Transactional
	@Override
	public int insertContract(Contract contract) {
		contractRep.save(contract);
		if(contract.getConsulUserDecide() == 2 && contract.getConsulConDecide() == 2) {
			Consulting consulting = consultingRep.findById(contract.getConsulNo()).orElse(null);
			consulting.setConsulStatus(2);
			consultingRep.save(consulting);
		}
		return 0;
	}
	
	@Override
	public Contract selectContractByNo(int consulNo) {
		return contractRep.findById(consulNo).orElse(null);
	}
	
	@Override
	public List<Consulting> selectUserConsulting(int memberNo) {
		return consultingRep.findBymemberNoConsulting(memberNo);
	}
	
	@Override
	public List<Consulting> selectConConsulting(int chNo) {
		return consultingRep.findByConNoConsulting(chNo);
	}
	
	@Override
	public Contract contractComplete(int consulNo) {
		return contractRep.findContractComplete(consulNo);
	}
}
