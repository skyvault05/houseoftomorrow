package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.channel.domain.Channel;

public interface ChannelRepository extends JpaRepository<Channel, Integer> {

}
