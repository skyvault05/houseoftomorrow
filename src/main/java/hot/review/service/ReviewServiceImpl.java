package hot.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hot.member.domain.Channel;
import hot.member.domain.Review;
import hot.member.repository.ChannelRepository;
import hot.member.repository.MemberRepository;
import hot.member.repository.ReviewRepository;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewRepository reviewRep;
	
	@Autowired
	private ChannelRepository channelRep;
	
	@Autowired
	private MemberRepository memberRep;
	
	
	@Override
	public void insertReview(Review review) {
		reviewRep.save(review);
		
	}

	@Override
	public void updateReview(Review review) {
		Review review2 = reviewRep.findById(review.getReviewNo()).orElse(null); 
		if(!review2.getReviewDescription().equals(review.getReviewDescription())) {
			review2.setReviewDescription(review.getReviewDescription());
		}
	}

	@Override
	public void deleteReview(int reviewNo) {
		Review review = reviewRep.findById(reviewNo).orElse(null);
		if(review!=null) {
			review.setReviewStatus(1);
		}
		
	}

	@Override
	public List<Review> selectReview(int chNo) {
		List<Review> list = null;
		Channel channel = channelRep.findById(chNo).orElse(null);
		if(channel != null) {
			list = channel.getReviews();
		}
		return list;
	}

	@Override
	public Review updateReviewForm(int reviewNo) {
		Review review = reviewRep.findById(reviewNo).orElse(null);
		return review;
	}

}
