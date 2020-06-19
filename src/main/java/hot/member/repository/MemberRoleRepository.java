package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.MemberRole;

public interface MemberRoleRepository extends JpaRepository<MemberRole, Integer> {

}
