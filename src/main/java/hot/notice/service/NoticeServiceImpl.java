package hot.notice.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hot.member.domain.Notice;
import hot.member.repository.NoticeRepository;


@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeRepository noticeRep;

	
	/**
	 * 공지사항 등록하기
	 * */
	@Transactional
	@Override
	public int insertNotice(Notice notice) {
		
		if(notice.getNoticeTitle()!="" || notice.getNoticeDescription()!="") {
		noticeRep.save(notice);
		}
		return 0;
	}

	
	/**
	 * 공지사항 수정하기
	 * */
	@Transactional
	@Override
	public int updateNotice(Notice notice) {
		Notice dbNotice = noticeRep.findById(notice.getNoticeNo()).orElse(null);
		
		
		if(notice.getNoticeDescription()=="") {
			dbNotice.setNoticeDescription(dbNotice.getNoticeDescription());
		}else {
			dbNotice.setNoticeDescription(notice.getNoticeDescription());
			  }
		
		
		if(notice.getNoticeTitle()=="") {
			dbNotice.setNoticeTitle(dbNotice.getNoticeTitle());
		}else {
			dbNotice.setNoticeTitle(notice.getNoticeTitle());
			  
			
		}
		return 0;
	}


	
	
	/**
	 * 공지사항 삭제하기
	 * */
	@Transactional
	@Override
	public int deleteNotice(int noticeNo) {
		
		noticeRep.deleteById(noticeNo);
		return 0;
	}

	
	/**
	 * 공지사항 조회하기
	 * */
	@Override
	public Notice selectNotice(Integer noticeNo) {
		
		Notice notice =noticeRep.findById(noticeNo).orElse(null);
		 
		return notice;
	}
	
	@Override
	public List<Notice> selectAll() {
		
		return noticeRep.findAll();
	}

}
