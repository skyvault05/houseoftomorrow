package hot;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import hot.member.domain.MemberRole;
import hot.member.repository.MemberRoleRepository;

@SpringBootTest
@Commit
class HouseoftomorrowApplicationTests {
	@Autowired
	private MemberRoleRepository rep;

	@Test
	void contextLoads() {
		System.out.println(rep);
		System.out.println(11);
		rep.save(new MemberRole(null, "ROLE_USER"));
		System.out.println(22);
	}

}
