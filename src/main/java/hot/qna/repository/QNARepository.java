package hot.qna.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.community.domain.CommCategory;
import hot.community.domain.Community;
import hot.member.domain.Member;
import hot.qna.domain.QNA;
import hot.qna.domain.QNACategory;

public interface QNARepository extends JpaRepository<QNA, Integer>, QNARepositoryCustom {

	@Query("SELECT q FROM QNA q WHERE qnaCategory.qnaCategoryNo = :#{#qnaCategory.qnaCategoryNo} AND qnaStatus = :#{#qnaStatus}")
	List<QNA> findByQnaCategoryEnabled(QNACategory qnaCategory, Integer qnaStatus);
	
	@Query("SELECT c FROM QNA c WHERE c.member.memberNo = :#{#member.memberNo} AND qnaStatus = :#{#qnaStatus}")
	List<QNA> findByMemberEnabled(Member member, Integer qnaStatus);
	
	@Query("SELECT c FROM QNA c WHERE c.qnaParentNo = :#{#qnaParentNo}")
	List<QNA> findByQnaParentNoEnabled(QNA qnaParentNo);
}
