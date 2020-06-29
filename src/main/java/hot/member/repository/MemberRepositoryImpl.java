package hot.member.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;

import hot.member.domain.Member;
import hot.member.domain.QMember;
@Transactional(readOnly = true)
public class MemberRepositoryImpl extends QuerydslRepositorySupport implements MemberRepositoryCustom {
	@Autowired
	private JPAQueryFactory queryFactory;
	
	private QMember member = QMember.member;

	public MemberRepositoryImpl() {
		super(Member.class);
	}

	@Override
	public List<Member> findByNameAndStatus(String name, String status) {
		return queryFactory
				.selectFrom(member)
				.where(eqStatus("1"), eqName(name))
				.fetch();
	}
	
	private BooleanExpression eqStatus (String status) {
		if(StringUtils.isEmpty(status)) {
			return null;
		}
		return member.memberStatus.eq(Integer.parseInt(status));
	}
	
	private BooleanExpression eqName (String name) {
		if(StringUtils.isEmpty(name)) {
			return null;
		}
		return member.memberName.eq(name);
	}

}
