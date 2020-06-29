package hot.qna.service;

import java.util.List;

import hot.member.domain.QNA;

public interface QNAService {
	
	int insertQNA(QNA qna); //등록, 답변 등록 : 관리자한테 notification 추가, 답변 : 유저한테 notification 추가 
	
	int deleteQNA(int qnaNo); 
	
	int update(QNA qna);
	
	List<QNA> selectQNA(Integer qnaCategoryNo); // null이면 전체 게시글 조회
	
	QNA detailQNA(int qnaNo);
	
	List<QNA> myQNA(Integer memberNo);

}
