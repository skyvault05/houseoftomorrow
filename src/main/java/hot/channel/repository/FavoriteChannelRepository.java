package hot.channel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.channel.domain.FavoriteChannel;

public interface FavoriteChannelRepository extends JpaRepository<FavoriteChannel, Integer> {

}
