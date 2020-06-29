package hot.qna.repository;

import static hot.qna.domain.QQNA.qNA;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.amazonaws.transform.SimpleTypeUnmarshallers.IntegerUnmarshaller;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;

import hot.qna.domain.QNA;
import hot.qna.domain.QNACategory;

public class QNARepositoryImpl implements QNARepositoryCustom {

	@Autowired
	private JPAQueryFactory queryFactory;
	
	@Override
	public List<QNA> dynamicTest(QNACategory qnaCategoryNo) {
		return queryFactory
				.select(qNA)
				.from(qNA)
				.where(eqQnaCategoryNo(qnaCategoryNo))
				.fetch();
	}
	
	private BooleanExpression eqQnaCategoryNo(QNACategory qnaCategoryNo) {
		return qNA.qnaCategory.eq(qnaCategoryNo);
	}

}
