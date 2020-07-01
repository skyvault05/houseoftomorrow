package hot.qna.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hot.member.domain.Member;
import hot.qna.domain.QNA;
import hot.qna.domain.QNACategory;
import hot.qna.repository.QNARepository;

@Service
public class QNAServiceImpl implements QNAService {

	@Autowired
	QNARepository qnaRepository;
	
	/**
	 * 질문글 등록 : 관리자한테 notification 추가, 
	 * 답변글 등록 : 유저한테 notification 추가
	 * */
	@Override
	public int insertQNA(QNA qna) {
		
		qnaRepository.save(qna);
		
		return 0;
	}

	@Override
	public int deleteQNA(int qnaNo) {
		
		qnaRepository.deleteById(qnaNo);
		
		return 0;
	}

	@Override
	@Transactional
	public int update(QNA qna) {
		
		QNA dbQNA = qnaRepository.findById(qna.getQnaNo()).orElse(null);
		dbQNA.setQnaTitle(qna.getQnaTitle());
		dbQNA.setQnaDescription(qna.getQnaDescription());
		
		return 0;
	}

	@Override
	public List<QNA> selectQNA(Integer qnaCategoryNo) {
		
		if(qnaCategoryNo != null) {
			QNACategory category = new QNACategory();
			category.setQnaCategoryNo(qnaCategoryNo);
			
			List<QNA> list = qnaRepository.findByQnaCategoryEnabled(category, 1);
			
			return list;
		} else {		
			List<QNA> allList = qnaRepository.findAll();
			
			return allList;
		}
	}

	@Override
	public QNA detailQNA(int qnaNo) {
		
		QNA qna = qnaRepository.findById(qnaNo).orElse(null);
		
		return qna;
	}

	@Override
	public List<QNA> myQNA(Integer memberNo) {
		
		Member member = new Member();
		member.setMemberNo(memberNo);
		List<QNA> qna = qnaRepository.findByMemberEnabled(member, 1);
		
		return qna;
	}

}
