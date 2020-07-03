package hot.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hot.channel.domain.Channel;
import hot.channel.repository.ChannelRepository;
import hot.member.repository.MemberRepository;
import hot.review.domain.Review;
import hot.review.repository.ReviewRepository;
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
	
	/**
	 * 리뷰 등록 기능
	 * */
	@PostMapping("/registerReview")
	public String insertReview(Review review, Integer chNo, Integer memberNo) {
		reviewService.insertReview(review, chNo, memberNo);
		return "redirect:readReview/"+review.getReviewNo();
	}
	
	
	/**
	 * 리뷰 수정폼
	 * */
	@RequestMapping("/updateReviewform")
	public ModelAndView  updateReviewForm(int reviewNo) {
		
		Review review = reviewService.readReview(reviewNo);
		return new ModelAndView("review/member/updateReviewform", "review", review);
	}
	
	/**
	 * 리뷰 수정 기능
	 * */
	@RequestMapping("/updateReview")
	public String updateReview(Review review, Integer chaNo) {
		reviewService.updateReview(review, chaNo);
		
		int reviewNo = review.getReviewNo();
		
		return "redirect:readReview/"+reviewNo;
	}
	
	/**
	 * 리뷰 상세 페이지
	 * */
	@RequestMapping("/readReview/{reviewNo}")
	public ModelAndView readReview(@PathVariable("reviewNo") Integer reviewNo) {
		Review review = reviewService.readReview(reviewNo);
		return new ModelAndView("/review/guest/readReview", "review", review);
	}
	
	/**
	 * 리뷰 삭제 기능
	 * */
	@RequestMapping("/deleteReview")
	public String deleteReview(Integer reviewNo) {
		reviewService.deleteReview(reviewNo);
		
		Review review = reviewRep.findById(reviewNo).orElse(null);
		int memberNo = review.getMember().getMemberNo();
		return "redirect:myReview/"+memberNo; // 내 리뷰 페이지로
	}
	
	/**
	 * 리뷰 목록 페이지
	 * */
	@RequestMapping("/reviewList/{chNo}")
	public ModelAndView selectReview(@ModelAttribute(name="chNo")Integer chNo) {
		List<Review> list = reviewService.selectReviewChNo(chNo);
		
		return new ModelAndView("review/guest/reviewList", "review", list);

	}
	
	/**
	 * 내가 쓴 리뷰
	 * */
	@RequestMapping("/myReview/{memberNo}")
	public ModelAndView myReview(@ModelAttribute(name="memberNo")Integer memberNo) {
		List<Review> list = reviewService.myReview(memberNo);
		
		return new ModelAndView("review/member/myReview", "list", list);
	}
	
}
