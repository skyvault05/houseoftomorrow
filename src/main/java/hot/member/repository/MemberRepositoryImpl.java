package hot.member.repository;

import static hot.member.domain.QMember.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;

import hot.member.domain.Member;

public class MemberRepositoryImpl implements MemberRepositoryCustom {
	
	@Autowired
	private JPAQueryFactory queryFactory;

	@Override
	public List<Member> dynamicTest(String name, Integer status) {
		return queryFactory
				.select(member)
				.from(member)
				.where(eqStatus(status), eqName(name))
				.fetch();
	}
	
	private BooleanExpression eqStatus (Integer status) {
		if(status==null) {
			return null;
		}
		return member.memberStatus.eq(status);
	}
	
	private BooleanExpression eqName (String name) {
		if(StringUtils.isEmpty(name)) {
			return null;
		}
		return member.memberName.eq(name);
	}

}
