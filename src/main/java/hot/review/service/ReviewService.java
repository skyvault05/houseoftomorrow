package hot.review.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import hot.review.domain.Review;

public interface ReviewService {
	
	void insertReview(Review review, Integer chNo, Integer memberNo);  //시공사한테 notification알림, 채널 평점 재평가
	void updateReview(Review review, Integer chaNo); //평점 재평가
	void deleteReview(Integer reviewNo); //평점 재평가
	List<Review> selectReviewChNo(Integer chNo); 
	Review updateReviewForm(Integer reviewNo);
	Review readReview(Integer reviewNo);
	List<Review> myReview(Integer memberNo);
	Page<Review> selectAll(Pageable pageable);
}
