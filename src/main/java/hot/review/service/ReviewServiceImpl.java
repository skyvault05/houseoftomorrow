package hot.review.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import hot.channel.domain.Channel;
import hot.channel.repository.ChannelRepository;
import hot.member.domain.Member;
import hot.member.repository.MemberRepository;
import hot.review.domain.Review;
import hot.review.repository.ReviewRepository;

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
		
		List<Review> reviewList = reviewRep.findByChannelNo(channel);
		int sum = 0;
		for(Review list : reviewList) {
			int grade = list.getReviewGrade();
			sum += grade;
		}
		double avg = (double)sum/(double)reviewList.size();
		double avg2 = Math.round(avg*100)/100.0;
		
		channel.setChGrades(avg2);
	}

	@Override
	@Transactional // 이 코드 잊으면 안돼 ~
	public void updateReview(Review review, Integer chaNo) {
		Channel channel = channelRep.findById(chaNo).orElse(null);
		List<Review> reviewList = reviewRep.findByChannelNo(channel);
		int sum = 0;
		for(Review list : reviewList) {
			int grade = list.getReviewGrade();
			sum += grade;
		}
		Review review2 = reviewRep.findById(review.getReviewNo()).orElse(null); 		
		
		int sumMiddle = sum - review2.getReviewGrade();
		
		review2.setReviewDescription(review.getReviewDescription());
		review2.setReviewGrade(review.getReviewGrade());
		review2.setChannel(channel);

		int sumFinal = sumMiddle + review2.getReviewGrade();

		double avg = (double)sumFinal/(double)reviewList.size();
		double avg2 = Math.round(avg*100)/100.0;
		
		channel.setChGrades(avg2);
	}

	@Override
	@Transactional
	public void deleteReview(Integer reviewNo) {
		Review review = reviewRep.findById(reviewNo).orElse(null);
		review.setReviewStatus(0);
		
		int chaNo = review.getChannel().getChNo();
		Channel channel = channelRep.findById(chaNo).orElse(null);
		List<Review> reviewList = reviewRep.findByChannelNoAndReviewStatus(channel,1);
		int sum = 0;
		for(Review list : reviewList) {
			int grade = list.getReviewGrade();
			sum += grade;
		}

		int minus = review.getReviewGrade();
		int sumFinal = sum-minus;
		double avg = (double)sumFinal/(double)reviewList.size();
		double avg2 = Math.round(avg*100)/100.0;
		
		channel.setChGrades(avg2);
	}

	@Override
	public List<Review> selectReviewChNo(Integer chNo) {
		Channel channel = channelRep.findById(chNo).orElse(null);
		
		List<Review> list = reviewRep.findByChNoAndreviewStatus(channel, 1);
		return list;
	}

	@Override
	public Review updateReviewForm(Integer reviewNo) {
		Review review = reviewRep.findById(reviewNo).orElse(null);
		return review;
	}

	@Override
	public Review readReview(Integer reviewNo) {
		return reviewRep.findById(reviewNo).orElse(null);
	}

	@Override
	public List<Review> myReview(Integer memberNo) {	
		Member member = memberRep.findById(memberNo).orElse(null);		
		List<Review> list = reviewRep.findByMemberAndReviewStatus(member, 1);
		return list;
	}
	
	@Override
	public Page<Review> selectAll(Pageable pageable, Channel channel) {		
		Page<Review> page = reviewRep.findByChannelNoAndReviewStatus(pageable, channel, 1);
		return page;
	}
}
