package hot.community.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import hot.community.domain.CommCategory;
import hot.community.domain.Community;
import hot.member.domain.Member;

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

	@Query("SELECT c FROM Community c WHERE commCategory.commCategoryNo = :#{#commCategory.commCategoryNo} AND commStatus = :#{#commStatus}")
	List<Community> findByCommCategoryEnabled(CommCategory commCategory, Integer commStatus);
	
	@Query("SELECT c FROM Community c WHERE c.member.memberNo = :#{#member.memberNo} AND commStatus = :#{#commStatus}")
	List<Community> findByMemberEnabled(Member member, Integer commStatus);
	
	List<Community> findByCommStatusAndCommCategoryOrderByCommRegdateDesc(Integer commStatus, CommCategory CommCategoryNo, Pageable paging);

}
