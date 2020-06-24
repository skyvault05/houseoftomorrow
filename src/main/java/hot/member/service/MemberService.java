package hot.member.service;

import hot.member.domain.Member;

public interface MemberService {
	/**
	 * 회원가입
	 */
	int memberInsert(Member member);
	
	/**
	 * id로 맴버 찾기
	 */
	Member selectMember(String memberId);
}
