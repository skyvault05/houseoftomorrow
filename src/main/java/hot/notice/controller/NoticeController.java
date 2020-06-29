package hot.notice.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hot.member.domain.Notice;
import hot.notice.service.NoticeService;
import hot.notice.service.NoticeServiceImpl;
import lombok.RequiredArgsConstructor;



@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class  NoticeController {
	
	
	private final NoticeServiceImpl noticeService;
	
	@RequestMapping("/{url}")
	public void url() {}
	
	
	/**
	 * 실제 notice  등록
	 * @throws IOException 
	 * */
	@PostMapping("/insert")
	public String insertNotice(Notice notice) throws IOException{
		System.out.println(notice.getNoticeDescription());
		noticeService.insertNotice(notice);
		
		return "redirect:noticeList";
	}
	
	/**
	 * notice 수정
	 * */
	@RequestMapping("/update")
	public String updateNotice(@ModelAttribute("notice")Notice notice) {
		
		//Integer no = notice.getNoticeNo();
		noticeService.updateNotice(notice);
		return "read";
	}
	
	
	
	/**
	 * notice 삭제
	 * */  
	@RequestMapping("/delete")
	public String deleteNotice(int noticeNo) {
		
		noticeService.deleteNotice(noticeNo);
		return null;
	}
	
	
	/**
	 * notice 상세보기
	 * */
	@RequestMapping("/read/{noticeNo}")
	public ModelAndView selectNotice(@PathVariable Integer noticeNo) {
		Notice notice = noticeService.selectNotice(noticeNo);
		
		return new ModelAndView("notice/noticeRead", "notice", notice);
	}  //noticeNo이 null이면 전체 조회

	
	@RequestMapping("/noticeList")
	public ModelAndView selectAll(){
		List<Notice> list = noticeService.selectAll();
		return new ModelAndView("notice/noticeList", "notice", list);
	}
	
	

	
	
	
	/** 
	 * notice 수정 폼 - community/updateCommunity.jsp
	 * */
	@RequestMapping("/noticeUpdate")
	public ModelAndView updateNoticeForm( Integer noticeNo) {
		
		Notice notice =	 noticeService.selectNotice(noticeNo);
		
		return new ModelAndView("notice/noticeUpdate", "notice", notice);
	}
	
	
	
	
	
}
