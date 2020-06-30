package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.Member;

public interface MemberRepository extends JpaRepository<Member, Integer>, MemberRepositoryCustom {
	Member findByMemberId(String memberId);
	
	Member findByMemberPhone(String memberPhone);
}
