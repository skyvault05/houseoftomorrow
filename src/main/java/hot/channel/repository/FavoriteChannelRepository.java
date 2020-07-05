package hot.channel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.channel.domain.Channel;
import hot.channel.domain.FavoriteChannel;
import hot.member.domain.Member;

public interface FavoriteChannelRepository extends JpaRepository<FavoriteChannel, Integer> {

	@Query("SELECT f FROM FavoriteChannel f WHERE f.member =?1 and f.channel=?2")
	FavoriteChannel findByMemberAndChannel(Member member, Channel channel);
	
	List<FavoriteChannel> findByMember(Member member);
	
	void deleteByMemberAndChannel(Member member, Channel channel);
	
	List<FavoriteChannel> findByChannel(Channel channel);
}
