package hot.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hot.member.domain.Channel;
import hot.member.domain.Member;
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
	public void insertReview(Review review, Integer chNo, Integer memberNo) {
		Member member = memberRep.findById(memberNo).orElse(null);
		review.setMember(member);
		Channel channel = channelRep.findById(chNo).orElse(null);
		review.setChannel(channel);
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
	public void deleteReview(Integer reviewNo) {
		Review review = reviewRep.findById(reviewNo).orElse(null);
		if(review!=null) {
			review.setReviewStatus(0);
		}
		
	}

	@Override
	public List<Review> selectReviewChNo(Integer chNo) {
		List<Review> list = null;
		Channel channel = channelRep.findById(chNo).orElse(null);
		if(channel != null) {
			list = channel.getReviews();
		}
		return list;
	}
	
	@Override
	public Review selectReviewRe(Integer reviewNo) {
		Review review = reviewRep.findById(reviewNo).orElse(null);
		
		return null;
	}

	@Override
	public Review updateReviewForm(Integer reviewNo) {
		Review review = reviewRep.findById(reviewNo).orElse(null);
		return review;
	}

	@Override
	public Review readReview(Integer reviewNo) {
		System.out.println(reviewNo);
		return reviewRep.findById(reviewNo).orElse(null);
	}

}
