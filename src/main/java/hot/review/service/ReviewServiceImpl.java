package hot.review.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import hot.channel.domain.Channel;
import hot.channel.repository.ChannelRepository;
import hot.consulting.domain.Consulting;
import hot.consulting.repository.ConsultingRepository;
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
	
	@Autowired
	private ConsultingRepository consultingRep;
	
	
	@Override
	@Transactional
	public void insertReview(Review review, Integer chNo, Integer memberNo) {
		Member member = memberRep.findById(memberNo).orElse(null);
		review.setMember(member);
		Channel channel = channelRep.findById(chNo).orElse(null);
		System.out.println("channel이름: " + channel.getConstructor().getConName());
		review.setChannel(channel);
		reviewRep.save(review);
		
		List<Review> reviewList = reviewRep.findByChannelNo(channel);
		int sum = 0;
		for(Review list : reviewList) {
			int grade = list.getReviewGrade();
			sum += grade;
		}
		System.out.println("sum: " + sum);
		double avg = (double)sum/(double)reviewList.size();
		System.out.println("avg: " + avg);
		double avg2 = Math.round(avg*100)/100.0;
		System.out.println("avg2: " + avg2);
		
		channel.setChGrades(avg2);
	}

	@Override
	@Transactional // 이 코드 잊으면 안돼 ~
	public void updateReview(Review review, Integer chaNo) {
		System.out.println("review.grade: " + review.getReviewGrade());
		Channel channel = channelRep.findById(chaNo).orElse(null);
		List<Review> reviewList = reviewRep.findByChannelNo(channel);
		for(Review list : reviewList) {
			System.out.println("list.getReviewGrade(): " + list.getReviewGrade());
		}
		int sum = 0;
		for(Review list : reviewList) {
			int grade = list.getReviewGrade();
			sum += grade;
		}
		System.out.println("sum: " + sum);
		Review review2 = reviewRep.findById(review.getReviewNo()).orElse(null); 		
		System.out.println("review2.grade: " + review2.getReviewGrade());
		int sumMiddle = sum - review2.getReviewGrade();
		System.out.println("sumMiddle: " + sumMiddle);
		
		review2.setReviewDescription(review.getReviewDescription());
		review2.setReviewGrade(review.getReviewGrade());
		review2.setChannel(channel);

		int sumFinal = sumMiddle + review.getReviewGrade();
		System.out.println("sumFinal: " + sumFinal);
		
		double avg = (double)sumFinal/(double)reviewList.size();
		double avg2 = Math.round(avg*100)/100.0;
		System.out.println("avg2: " + avg2);
		
		channel.setChGrades(avg2);
	}

	@Override
	@Transactional
	public void deleteReview(Integer reviewNo) {
		Review review = reviewRep.findById(reviewNo).orElse(null);
		
		int chaNo = review.getChannel().getChNo();
		System.out.println("chaNo: " + chaNo);
		Channel channel = channelRep.findById(chaNo).orElse(null);
		List<Review> reviewList = reviewRep.findByChannelNoAndReviewStatus(channel,1);
		for(Review list : reviewList) {
			System.out.println(list.getReviewGrade());
		}
		int sum = 0;
		for(Review list : reviewList) {
			int grade = list.getReviewGrade();
			sum += grade;
		}
		System.out.println("sum: " + sum);
		int minus = review.getReviewGrade();
		System.out.println("review.getReviewGrade(): 5여야됨: " + minus);
		int sumFinal = sum-minus;
		System.out.println("sumFinal: " + sumFinal);
		double avg = (double)sumFinal/(double)reviewList.size();
		double avg2 = Math.round(avg*100)/100.0;
		System.out.println("avg2: " + avg2);
		
		review.setReviewStatus(0);
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

	@Override
	public boolean checkReviewRight(Integer chNo, Integer memberNo) {
		Member member = memberRep.findById(memberNo).orElse(null);		
		Channel channel = channelRep.findById(chNo).orElse(null);
		List<Consulting> consultingList = consultingRep.findByMemberNoAndChNoAndConsulStatus(memberNo, chNo, 2);
		System.out.println("consultingList.size(): " + consultingList.size());
		
		List<Review> reviewList = reviewRep.findByMemberAndChannelAndReviewStatus(member, channel, 1);
		System.out.println("reviewList.size(): " + reviewList.size());
		
		return consultingList.size()>reviewList.size();
	}
}
