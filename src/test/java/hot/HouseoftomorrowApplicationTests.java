package hot;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import hot.constructor.repository.ChannelRepository;
import hot.constructor.repository.ConstructorRepository;
import hot.member.repository.CommCategoryRepository;
import hot.member.repository.CommCommentRepository;
import hot.member.repository.CommunityRepository;
import hot.member.repository.ConstructorRegisterRequestRepository;
import hot.member.repository.ConsultingRepository;
import hot.member.repository.ContractRepository;
import hot.member.repository.EstResponseRepository;
import hot.member.repository.EstimateRepository;
import hot.member.repository.MemberRepository;
import hot.member.repository.MemberRoleRepository;
import hot.member.repository.NoticeRepository;
import hot.member.repository.NotificationRepository;
import hot.member.repository.ReviewRepository;

@SpringBootTest
@Commit
class HouseoftomorrowApplicationTests {
	@Autowired
	private MemberRoleRepository memberRole;
	
	@Autowired
	private MemberRepository memberRep;
	
	@Autowired
	private NotificationRepository notificationRep;
	
	@Autowired
	private ConstructorRepository contructorRep;
	
	@Autowired
	private EstimateRepository estimateRepository;
	
	@Autowired
	private ConstructorRepository constructorRepository;
	
	@Autowired
	private ChannelRepository channelRep;
	
	@Autowired
	private ConstructorRegisterRequestRepository ConRRRep;
	
	@Autowired
	private ReviewRepository reviewRep;
	
	@Autowired
	private EstResponseRepository estResponseRep;
	
	@Autowired
	private ConsultingRepository consultingRep;
	
	@Autowired
	private ContractRepository contractRep;
	
	@Autowired
	private NoticeRepository noticeRep;
	
	@Autowired
	private CommCommentRepository commCommentRep;
	
	@Autowired
	private CommunityRepository communityRep;

	@Autowired
	private CommCategoryRepository commCateRep;
	
	
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
		
		
//		priceRep.save(new Price(null, 0, "priceNa"));
		
		// chCategoryRep.save(new ChCategory(null, "채널"));
		

		///////////////////////////////////////////////////////
//		PasswordEncoder encoder = new BCryptPasswordEncoder();
//		Member member = new Member(null, "dddd", encoder.encode("1234"), "구급차", "000-0000-01217", null, memberRole.findById(2).orElse(null));
//		
//		Constructor con = new Constructor(null, member, "회사", "011-0000-0000", "11", "russia", 1, "no license");
//		
//		constructorRepository.save(con);
		//////////////////////////////////////////////////////
		
		
//		channelRep.save(new Channel(null, "이미지 널", "설명", null, contructorRep.findById(11).orElse(null), 0, 0));
		
	//	channelRep.save(new Channel(chNo, chImg, chDescription, chRegdate, constructor, chStatus, chGrades));
		
	//	ConRRRep.save(new ConstructorRegisterRequest(null, channelRep.findById(1).orElse(null), null));
		
	//	ConRRRep.save(new ConstructorRegisterRequest(conReqNo, channel, conReqRegdate);
		
	//	reviewRep.save(new Review(null, channelRep.findById(1).orElse(null), memberRep.findById(6).orElse(null), 0, null, 0));
		
	//	reviewRep.save(new Review(reviewNo, channel, member, reviewGrade, reviewRegdate));
		
		
	//	estResponseRep.save(new EstResponse(null, estimateRepository.findById(1).orElse(null), channelRep.findById(1).orElse(null), "설명", null));
		
	//	estResponseRep.save(new EstResponse(null, estNo, channel, estRespDescription, estRespRegdate))
		
	//	consultingRep.save(new Consulting(null, memberRep.findById(6).orElse(null), channelRep.findById(1).orElse(null), "consulDescription", null, "consulTitle", null, 0, 0, 0, null));
		
//		Consulting co =new Consulting(null, memberRep.findById(6).orElse(null), channelRep.findById(1).orElse(null), "consulDescription2", null, "consulTitle2", null, 0, 0, 0, null);
//		contractRep.save(new Contract(null, co, "이미지 없음", null));
		
//		CommCategory comCate = commCateRep.findById(5).orElse(null);
//		for(Community com : comCate.getCommList()) {
//			System.out.println(com.getCommNo());
//		}
		
		
//		noticeRep.save(new Notice(null, "타이틀", "설명", null));
		
//		commCommentRep.save(new CommComment(null, communityRep.findById(2).orElse(null), memberRep.findById(6).orElse(null), "설명", null, 1));
		
//		commCommentRep.save(new CommComment(commCommentNo, community, member, commCommentDescription, commCommentRegdate, commCommentStatus));
		
		
//		CommCategory commCategory = new CommCategory();
//		commCategory.setCommCategoryNo(4);
//		List<Community> list = communityRep.findByCommCategoryEnabled(commCategory, 0);
//		System.out.println(list);
//		for(Community com : list) {
//			System.out.println(com.getCommNo());
//		}
		System.out.println(channelRep.findById(1).orElse(null).getConstructor());
	}
	
}
	
