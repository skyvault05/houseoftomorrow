package hot.channel.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.channel.domain.Channel;


public interface ChannelRepository extends JpaRepository<Channel, Integer> {
	@Query("SELECT c FROM Channel c WHERE c.constructor.memberNo = ?1")
	Channel selectByMemberNo(int memberNo);
	
	List<Channel> findByChStatus(Integer chStatus);

		
	Page<Channel> findByChStatus(Pageable pageable, Integer chStatus);
		
	@Query("SELECT c FROM Channel c WHERE c.chStatus=?1 Order by c.chGrades DESC")
	List<Channel> findAllOrderBychGradesDesc(Integer chStatus);


}
