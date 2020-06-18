package hot;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.annotation.Commit;

import hot.member.domain.Member;
import hot.member.domain.Notification;
import hot.member.repository.MemberRepository;
import hot.member.repository.MemberRoleRepository;
import hot.member.repository.NotificationRepository;

@SpringBootTest
@Commit
class HouseoftomorrowApplicationTests {
	@Autowired
	private MemberRoleRepository memberRole;
	@Autowired
	private MemberRepository memberRep;
	
	@Autowired
	private NotificationRepository notificationRep;
	
//	@Autowired
//	private ConstructorRepository contructorRep;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Test
	void contextLoads() {
//		System.out.println(memberRole);
//		System.out.println(11);
//		memberRole.save(new MemberRole(null, "ROLE_CONSTRUCTOR"));
//		System.out.println(22);
		
		Member member = new Member(null, "mh", encoder.encode("1234"), "구급차", "000-0000-0119", null, memberRole.findById(2L).orElse(null));
		memberRep.save(member);
		
//		Member memberf = memberRep.findById(2L).orElse(null);
//		System.out.println(memberf);
		
//		Notification newNoti = new Notification(null, memberRep.getOne(6L), 6,5);
//		notificationRep.save(newNoti);
//		System.out.println(111111);
//		Member member = memberRep.findById(1L).orElse(null);
//		System.out.println(222222);
//		for(Notification noti : member.getList()) {
//			System.out.println("noti_No:"+noti.getNotificationNo());
//		}
		
//		notificationRep.save(new Notification(null, memberRep.getOne(6L), 6,5));
		

	}
	
}
	
