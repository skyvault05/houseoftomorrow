package hot;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.annotation.Commit;

import hot.member.domain.Constructor;
import hot.member.domain.Member;
import hot.member.repository.ConstructorRepository;
import hot.member.repository.EstimateRepository;
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
	private EstimateRepository estimateRepository;
	
	@Autowired
	private ConstructorRepository constructorRepository;
	
	
	
	@Test
	void contextLoads() {
//		System.out.println(memberRole);
//		System.out.println(11);
//		memberRole.save(new MemberRole(null, "ROLE_CONSTRUCTOR"));
//		System.out.println(22);
//		PasswordEncoder encoder = new BCryptPasswordEncoder();
//		Member member = new Member(null, "dd", encoder.encode("dd"), "구급차", "000-0000-0112", null, memberRole.findById(1).orElse(null));
//		memberRep.save(member);
		
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
//		Kitchen kit = new Kitchen(1, 1, 1, 1, 1);
//		Estimate est = new Estimate(null, memberRep.findById(6L).orElse(null), "desc", null, 1, kit, null, null, null, null, null);
//		estimateRepository.save(est);
		
		///////////////////////////////////////////////////////
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		Member member = new Member(null, "dddd", encoder.encode("1234"), "구급차", "000-0000-01217", null, memberRole.findById(2).orElse(null));
		
		Constructor con = new Constructor(null, member, "회사", "011-0000-0000", "11", "russia", 1, "no license");
		
		constructorRepository.save(con);
		//////////////////////////////////////////////////////
	}
	
}
	
