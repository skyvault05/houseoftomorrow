package hot;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import hot.member.domain.Member;
import hot.member.domain.MemberRole;
import hot.member.repository.MemberRepository;
import hot.member.repository.MemberRoleRepository;

@SpringBootTest
@Commit
class HouseoftomorrowApplicationTests {
	@Autowired
	private MemberRoleRepository memberRole;
	@Autowired
	private MemberRepository memberRep;

	@Test
	void contextLoads() {
//		System.out.println(memberRole);
//		System.out.println(11);
//		memberRole.save(new MemberRole(null, "ROLE_CONSTRUCTOR"));
//		System.out.println(22);
		
//		Member member = new Member(null, "hj", "hj", "hj", "000-0000-0000", null, memberRole.findById(2L).orElse(null));
//		memberRep.save(member);
		
//		Member memberf = memberRep.findById(2L).orElse(null);
//		System.out.println(memberf);
	}
}
