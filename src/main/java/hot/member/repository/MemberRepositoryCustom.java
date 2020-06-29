package hot.member.repository;

import java.util.List;

import hot.member.domain.Member;

public interface MemberRepositoryCustom {
	List<Member> dynamicTest(String name, Integer status);
}
