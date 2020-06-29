package hot.qna.repository;

import java.util.List;

import hot.qna.domain.QNA;
import hot.qna.domain.QNACategory;

public interface QNARepositoryCustom {

	List<QNA> dynamicTest(QNACategory qnaCategoryNo);
}
