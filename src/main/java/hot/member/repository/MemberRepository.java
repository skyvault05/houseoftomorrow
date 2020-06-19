package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {
	Member findByMemberId(String memberId);
}
