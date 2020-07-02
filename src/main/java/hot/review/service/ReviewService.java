package hot.review.service;

import java.util.List;

import hot.member.domain.Review;

public interface ReviewService {
	
	void insertReview(Review review, Integer chNo, Integer memberNo);  //시공사한테 notification알림, 채널 평점 재평가
	void updateReview(Review review); //평점 재평가
	void deleteReview(Integer reviewNo); //평점 재평가
	List<Review> selectReviewChNo(Integer chNo); 
	Review updateReviewForm(Integer reviewNo);
	Review selectReviewRe(Integer reviewNo);
	Review readReview(Integer reviewNo);
	
}
