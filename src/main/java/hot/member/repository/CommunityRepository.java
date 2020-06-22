package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.Community;

public interface CommunityRepository extends JpaRepository<Community, Long> {

}
