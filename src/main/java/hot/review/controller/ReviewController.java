package hot.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hot.member.domain.Review;
import hot.member.repository.ChannelRepository;
import hot.member.repository.MemberRepository;
import hot.member.repository.ReviewRepository;
import hot.review.service.ReviewService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/review")
@RequiredArgsConstructor
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ChannelRepository channelRep;
	
	@Autowired
	private MemberRepository memberRep;
	
	@Autowired
	private ReviewRepository reviewRep;
	
	@PostMapping("/registerReview")
	public String insertReview(Review review, Integer chNo, Integer memberNo) {
		System.out.println(review);
		reviewService.insertReview(review, chNo, memberNo);
		return "redirect:readReview"+review.getReviewNo();
	}
	
	@RequestMapping("/updateReviewF")
	public String updateReview(Review review) {
		reviewService.updateReview(review);
		return "";
	}
	
	@RequestMapping("/readReviewF{reviewNo}")
	public ModelAndView updateReviewForm(int reviewNo) {
		Review review = reviewService.updateReviewForm(reviewNo);
		return new ModelAndView("readReviewF", "review", review);
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
