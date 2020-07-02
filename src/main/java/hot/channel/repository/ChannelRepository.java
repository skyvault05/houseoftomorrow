package hot.channel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.channel.domain.Channel;


public interface ChannelRepository extends JpaRepository<Channel, Integer> {
	@Query("SELECT c FROM Channel c WHERE c.constructor.memberNo = ?1")
	Channel selectByMemberNo(int memberNo);
}
