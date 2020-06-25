package hot.consulting.service;

import hot.member.domain.Consulting;

public interface ConsultingService {
	/**
	 * 맴버id와 채널no에 해당하는 상담 중 상담 종료가 되지 않은 상담만 가져오기
	 */
	Integer selectByIdNo(String memberId, int chNo);
}
