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
	

	int memberUpdate(Member member);
	int memberDelete(int memberNo);
	String findId(String phoneNumber, String name);
	String findPwd(Member member);

	/**
	 * phone번호 인증 (중복 불가)
	 */
	Member selectMemberByPhone(String phone);
	
	/**
	 * 상담하기의 유저 이름 가져오기
	 */
	String findMemberName(int memberNo);
}
