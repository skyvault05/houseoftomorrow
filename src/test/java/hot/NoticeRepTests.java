package hot;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import hot.member.domain.Notice;
import hot.member.repository.NoticeRepository;
import hot.notice.service.NoticeService;
import hot.notice.service.NoticeServiceImpl;

@SpringBootTest
@Commit
public class NoticeRepTests {
	
	@Autowired
	private NoticeRepository noticeRep;
	@Autowired
	private NoticeService noticeService; 
	
	//@Test
	public void noticeSelectAll() {
		
		List<Notice> noticeList=noticeRep.findAll();
		noticeList.forEach(m->System.out.println(m));
	}
	
	
	//@Test
	public void noticeUpdate() {
		Notice dbmember=noticeRep.findById(1).orElse(null);
		noticeRep.save(dbmember);
	}
	
	
	//@Test
	public void noticeDelete() {
		Notice dbalert=noticeRep.findById(1).orElse(null);
		noticeService.deleteNotice(1);
		}
	
	@Test
	public void noticeInsert() {
		noticeService.insertNotice(new Notice(null, "공지입니다", "무슨 설명이 필요한가요", null));
	}
	

}
