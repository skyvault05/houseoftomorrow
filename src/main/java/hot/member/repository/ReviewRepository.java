package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer> {

}
