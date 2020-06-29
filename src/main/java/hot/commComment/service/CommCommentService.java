package hot.commComment.service;

import java.util.List;

import hot.member.domain.CommComment;

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
	 * 수정
	 * */
	int updateCommComment(CommComment commComment);
	
	/**
	 * 삭제
	 * */
	int deleteCommComment(Integer commCommentNo);
	
	/**
	 * 목록
	 * */
	List<CommComment> selectCommComment(int commNo);
}
