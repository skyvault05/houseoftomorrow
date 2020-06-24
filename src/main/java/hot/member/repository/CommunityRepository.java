package hot.member.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import hot.member.domain.Community;

public interface CommunityRepository extends JpaRepository<Community, Integer> {

//	@Query("select * from Community c where c.commStatus = 1")
//	List<Community> selectAll();
	
	@Query("update Community c set c.commReadnum = c.commReadnum+1 where c.commNo =?1")
	@Modifying
	int updateReadnum(int commNo);
	
	@Query("update Community c set c.commStatus = 0 where c.commNo=?1")
	@Modifying
	int deleteCommunity(int commNo);
	
	List<Community> findByMemberMemberNo(int memberNo);

}
