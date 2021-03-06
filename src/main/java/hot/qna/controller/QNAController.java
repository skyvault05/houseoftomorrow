package hot.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.glassfish.gmbal.ParameterNames;

import hot.member.repository.MemberRepository;
import hot.qna.domain.QNA;
import hot.qna.repository.QNACategoryRepository;
import hot.qna.repository.QNARepository;
import hot.qna.service.QNAService;

@Controller
@RequestMapping("/qna")
public class QNAController {
	
	@Autowired
	private QNAService qnaService;
	
	@Autowired
	private QNACategoryRepository qnaCateRep;
	
	@Autowired
	private MemberRepository memberRep;
	
	@Autowired
	private QNARepository qnaRep;
	
	@RequestMapping("/{url}")
	public void url1() {}
	
	@RequestMapping("/{url1}/{url2}")
	public void url2() {}
	
	@RequestMapping("/{url1}/{url2}/{url3}")
	public void url3() {}
	
	/**
	 * QNA 등록 입력 폼
	 * */
	@RequestMapping("/insertForm")
	public String insertQNAForm() {
		return "manage/member/QNAForm";
	}
	
	/**
	 * QNA 답글 입력 폼
	 * */
	@RequestMapping("/replyForm")
	public ModelAndView insertReplyForm(int qnaParentNo) {
		
		QNA qna = qnaService.detailQNA(qnaParentNo);
		
		return new ModelAndView("manage/admin/QNAReplyForm", "qna", qna);
	}
	
	/**
	 * QNA 문의글  등록
	 * */
	@RequestMapping("/insert")
	public String insertQNA(QNA qna, Integer qnaCateNo, Integer membNo) {
		
		qna.setQnaCategory(qnaCateRep.findById(qnaCateNo).orElse(null));
		qna.setMember(memberRep.findById(membNo).orElse(null));
		
		qnaService.insertQNA(qna);
		
		int qnaNo = qna.getQnaNo();
		return "redirect:detail/"+qnaNo;
	}
	
	/**
	 * QNA 답변글  등록
	 * */
	@RequestMapping("/insertReply")
	public String insertReply(QNA qna, Integer qnaCateNo, Integer membNo, @ModelAttribute(name = "parentNo")Integer parentNo) {
		
		qna.setQnaCategory(qnaCateRep.findById(qnaCateNo).orElse(null));
		qna.setMember(memberRep.findById(membNo).orElse(null));
		qna.setQnaParentNo(qnaRep.findById(parentNo).orElse(null));
		
		qnaService.insertQNA(qna);
		
		int qnaNo = qna.getQnaNo();
		return "redirect:detail/"+parentNo;
	}
	
	/**
	 * QNA 게시글 삭제
	 * */
	@RequestMapping("/delete")
	public String deleteQNA(int qnaNo) {
		QNA qna = qnaRep.findById(qnaNo).orElse(null);
		int memberNo = qna.getMember().getMemberNo();
		
		qnaService.deleteQNA(qnaNo);
		
		return "redirect:myQNA/"+memberNo;
	}
	
	/**
	 * QNA 게시글 조회
	 * qnaCategoryNo이 null이면 전체 게시글 조회, 값이 들어가면 각 카테고리에 맞는 게시글 조회
	 * 관리자만 볼 수 있는 화면이다.
	 * */
	@RequestMapping("list/{qnaCategoryNo}")
	public ModelAndView selectQNA(@ModelAttribute("qnaCategoryNo")Integer qnaCategoryNo) {
		
		List<QNA> list = qnaService.selectQNA(qnaCategoryNo);
		
		return new ModelAndView("manage/admin/QNAAll", "list", list);
	} 
	
	/**
	 * QNA 게시글 수정 폼
	 * 관리자만 가능
	 * */
	@RequestMapping("/updateForm")
	public ModelAndView updateQNAForm(int qnaNo) {
		
		QNA qna = qnaService.detailQNA(qnaNo);
		
		return new ModelAndView("manage/admin/QNAReplyUpdate", "qna", qna);
	}
	
	/**
	 * QNA 게시글 수정
	 * */
	@RequestMapping("/update")
	public String updateQNA(QNA qna) {
		
		qnaService.update(qna);
		int qnaNo = qna.getQnaNo();
		return "redirect:detail/"+qnaNo;
	}
	
	/**
	 * QNA 게시글 상세보기
	 * */
	@RequestMapping("/detail/{qnaNo}")
	public ModelAndView detailQNA(@PathVariable("qnaNo")int qnaNo){
	
		QNA qnaa = qnaRep.findById(qnaNo).orElse(null);
		List<QNA> qnaParent = qnaRep.findByQnaParentNoEnabled(qnaa);
		
		QNA qna = qnaService.detailQNA(qnaNo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("qnaParent", qnaParent);
		mv.addObject("qna", qna);
		mv.setViewName("manage/member/QNADetail");
		
		return mv;
	}
	
	/**
	 * 내가 쓴 QNA 글 목록
	 * */
	@RequestMapping("/myQNA/{memberNo}")
	public ModelAndView myQNA(@ModelAttribute("memberNo")Integer memberNo){
		
		List<QNA> myQNA = qnaService.myQNA(memberNo);
		
		return new ModelAndView("manage/member/myQNA", "myQNA", myQNA);
	}

}
