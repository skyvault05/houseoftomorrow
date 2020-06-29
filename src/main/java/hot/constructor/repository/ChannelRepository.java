package hot.constructor.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.Channel;

public interface ChannelRepository extends JpaRepository<Channel, Integer> {

}
