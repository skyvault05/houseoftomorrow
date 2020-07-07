package hot.consulting.service;

import java.io.IOException;
import java.util.List;

import hot.consulting.domain.Consulting;
import hot.consulting.domain.Contract;
import hot.consulting.dto.ContractDTO;

public interface ConsultingService {
	/**
	 * 맴버id와 채널no에 해당하는 상담 중 상담 종료가 되지 않은 상담만 가져오기
	 */
	Consulting selectByIdNo(int memberNo, int chNo);
	
	/**
	 * 상담 no로 가져오기
	 */
	Consulting selectByNo(int consulNo);
	
	/**
	 * 시공사의 상담 내역 가져오기
	 */
	Consulting selectByNoConsulting(int consulNo);
	
	/**
	 * 상담 내역 추가하기
	 */
	int insertConsulting(Consulting consulting) throws IOException;
	
	/**
	 * 계약서 등록하기
	 */
	int insertContract(Contract contract);
	
	/**
	 * 계약서 가져오기
	 */
	Contract selectContractByNo(int consulNo);
	
	/**
	 * 유저 상담 목록 가져오기
	 */
	List<Consulting> selectUserConsulting(int memberNo);
	
	/**
	 * 시공사 상담 목록 가져오기
	 */
	List<Consulting> selectConConsulting(int chNo);
	
	/**
	 * 완료된 계약 목록 가져오기
	 */
	List<ContractDTO> selectUserContractComplete(int memberNo);

	/**
	 * 시공사 완료된 상담 가져오기
	 */
	List<ContractDTO> selectConContractComplete(int chNo);
}
