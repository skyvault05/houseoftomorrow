package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import hot.member.domain.Community;

public interface CommunityRepository extends JpaRepository<Community, Integer> {

	@Query("update Community c set c.commReadnum = c.commReadnum+1 where c.commNo =?1")
	@Modifying
	int updateReadnum(int commNo);

}
