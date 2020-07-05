package hot.consulting.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hot.aws.S3Manager;
import hot.channel.domain.Channel;
import hot.channel.repository.ChannelRepository;
import hot.consulting.domain.Consulting;
import hot.consulting.domain.Contract;
import hot.consulting.dto.ContractDTO;
import hot.consulting.repository.ConsultingRepository;
import hot.consulting.repository.ContractRepository;
import hot.member.domain.Member;
import hot.member.repository.MemberRepository;

@Service
public class ConsultingServiceImpl implements ConsultingService {
	@Autowired
	private ConsultingRepository consultingRep;
	@Autowired
	private ContractRepository contractRep;
	@Autowired
	private MemberRepository memberRep;
	@Autowired
	private ChannelRepository channelRep;
	
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
	public List<ContractDTO> selectConContractComplete(int chNo) {
		List<ContractDTO> list = new ArrayList<ContractDTO>();
		List<Consulting> consultingList = consultingRep.findByChNoComConsulting(chNo);
		for(Consulting consult : consultingList) {
			ContractDTO conDTO = new ContractDTO();
			Contract contract = contractRep.findById(consult.getConsulNo()).orElse(null);
			Member member = memberRep.findById(consult.getMemberNo()).orElse(null);
			conDTO.setMemberName(member.getMemberName());
			conDTO.setConsulting(consult);
			conDTO.setContractTime(contract.getContractUpdateDate());
			list.add(conDTO);
		}
		return list;
	}
	
	@Override
	public List<ContractDTO> selectUserContractComplete(int memberNo) {
		List<ContractDTO> list = new ArrayList<ContractDTO>();
		List<Consulting> consultingList = consultingRep.findByMemberNoComConsulting(memberNo);
		for(Consulting consult : consultingList) {
			ContractDTO conDTO = new ContractDTO();
			Contract contract = contractRep.findById(consult.getConsulNo()).orElse(null);
			Channel channel = channelRep.findById(consult.getChNo()).orElse(null);
			conDTO.setConstructorName(channel.getConstructor().getConName());
			conDTO.setConsulting(consult);
			conDTO.setContractTime(contract.getContractUpdateDate());
			list.add(conDTO);
		}
		return list;
	}
}
