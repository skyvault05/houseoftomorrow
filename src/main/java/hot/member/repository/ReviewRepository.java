package hot.member.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.member.domain.Channel;
import hot.member.domain.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer> {
	@Query("SELECT r FROM Review r WHERE channel.chNo = :#{#channel.chNo}")
	List<Review> findByChNo(Channel channel);
}
