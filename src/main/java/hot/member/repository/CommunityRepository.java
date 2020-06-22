package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.member.domain.Community;

public interface CommunityRepository extends JpaRepository<Community, Integer> {

}
