package hot.commComment.service;

import java.util.List;

import hot.community.domain.CommComment;

public interface CommCommentService {

	/**
	 * 등록
	 * */
	int insertCommComment(CommComment commComment);
	
	/**
	 * 상세
	 * */
	CommComment selectOneComment(int commentNo);
	
	/**
	 * 삭제
	 * */
	int deleteCommComment(Integer commCommentNo);
	
	/**
	 * 목록
	 * */
	List<CommComment> selectCommComment(int commNo);
}
