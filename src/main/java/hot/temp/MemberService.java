package hot.temp;

import hot.member.domain.Member;

public interface MemberService {
	int memberUpdate(Member member);
	int memberDelete(int memberNo);
	String findId(String phoneNumber, String name);
	String findPwd(Member member);
	int memberInsert(Member member);
}
