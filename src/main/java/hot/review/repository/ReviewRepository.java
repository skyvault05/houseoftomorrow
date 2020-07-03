package hot.review.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.channel.domain.Channel;
import hot.member.domain.Member;
import hot.review.domain.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer> {
	@Query("SELECT r FROM Review r WHERE channel.chNo = :#{#channel.chNo} AND r.reviewStatus =:#{#reviewStatus}")
	List<Review> findByChNoAndreviewStatus(Channel channel, Integer reviewStatus);
	
	@Query("select count(r) from Review r where r.member.memberNo = ?1 and r.channel.chNo = ?2")
	int findCountByMemberNoAndChNo(int memberNo, int chNo);
	
	List<Review> findByMemberAndReviewStatus(Member member, Integer reviewStatus);
	
	@Query("SELECT r FROM Review r WHERE channel.chNo = :#{#channel.chNo}")
	List<Review> findByChannelNo(Channel channel);
	
	@Query("SELECT r FROM Review r WHERE channel.chNo = :#{#channel.chNo} AND r.reviewStatus =:#{#reviewStatus}")
	List<Review> findByChannelNoAndReviewStatus(Channel channel, Integer reviewStatus);
	
	@Query("SELECT r FROM Review r WHERE channel.chNo = :#{#channel.chNo} AND r.reviewStatus =:#{#reviewStatus}")
	List<Review> findTop2ByChannelNoAndReviewStatusByOrderBySeqDesc(Channel channel, Integer reviewStatus);

}
