package hot.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hot.member.domain.Review;
import hot.member.repository.ChannelRepository;
import hot.member.repository.MemberRepository;
import hot.review.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ChannelRepository channelRep;
	
	@Autowired
	private MemberRepository memberRep;
	
	@RequestMapping("/review/reviewform")
	public String insertReview(Review review) {
		reviewService.insertReview(review);
		return "";
	}
	
	@RequestMapping("/update")
	public String updateReview(Review review) {
		reviewService.updateReview(review);
		return "";
	}
	
	@RequestMapping("/")
	public ModelAndView updateReviewForm(int reviewNo) {
		Review review = reviewService.updateReviewForm(reviewNo);
		return new ModelAndView("", "review", review);

	}
	
	@RequestMapping("/delete")
	public String deleteReview(int reviewNo) {
		reviewService.deleteReview(reviewNo);		
		return "index";
	}
	
	@RequestMapping("/select")
	public ModelAndView selectReview(int chNo) {
		List<Review> list = reviewService.selectReview(chNo);
		
		return new ModelAndView("channel", "list", list);

	}
	
	
}
