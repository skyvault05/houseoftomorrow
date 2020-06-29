package hot.member.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.member.domain.CommCategory;
import hot.member.domain.Community;
import hot.member.domain.Member;
import hot.member.domain.QNA;
import hot.member.domain.QNACategory;

public interface QNARepository extends JpaRepository<QNA, Integer> {

	@Query("SELECT q FROM QNA q WHERE qnaCategory.qnaCategoryNo = :#{#qnaCategory.qnaCategoryNo} AND qnaStatus = :#{#qnaStatus}")
	List<QNA> findByQnaCategoryEnabled(QNACategory qnaCategory, Integer qnaStatus);
	
	@Query("SELECT c FROM QNA c WHERE c.member.memberNo = :#{#member.memberNo} AND qnaStatus = :#{#qnaStatus}")
	List<QNA> findByMemberEnabled(Member member, Integer qnaStatus);
	
	@Query("SELECT c FROM QNA c WHERE c.qnaParentNo = :#{#qnaParentNo} AND qnaStatus = :#{#qnaStatus}")
	List<QNA> findByQnaParentNoEnabled(QNA qnaParentNo, Integer qnaStatus);
}
