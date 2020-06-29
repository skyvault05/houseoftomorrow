package hot.community.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hot.aws.S3Manager;
import hot.commComment.service.CommCommentService;
import hot.community.service.CommunityService;
import hot.member.domain.CommComment;
import hot.member.domain.Community;
import hot.member.repository.CommCategoryRepository;
import hot.member.repository.CommunityRepository;
import hot.member.repository.MemberRepository;

@Controller
@RequestMapping("/community")
public class CommunityController {
	@Autowired
	CommCategoryRepository commCategoryRepository;
	
	@Autowired
	CommunityRepository communityRepository;
	
	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	CommunityService communityService;
	
	@Autowired
	private CommCommentService commCommentService;
	
	@Autowired
	S3Manager s3Manager;

	@RequestMapping("/{url}")
	public void url1() {}
	
	@RequestMapping("/{url1}/{url2}")
	public void url2() {}
	
	@RequestMapping("/{url1}/{url2}/{url3}")
	public void url3() {}
	
	/**
	 * 실제 community  글 등록
	 * @throws IOException 
	 * */
	@PostMapping("/insert")
	public String insertCommunity(Community community, Integer commCategoryNo, Integer membNo, MultipartFile file ) throws IOException {
		community.setCommCategory(commCategoryRepository.findById(commCategoryNo).orElse(null));
		community.setMember(memberRepository.findById(membNo).orElse(null));
		
		String imgPath = s3Manager.saveUploadedFiles(file);
		community.setCommImg(imgPath);
		communityService.insertCommunity(community);
		
		return "redirect:list/"+commCategoryNo;
	}
	
	/**
	 * community 글 수정
	 * @throws IOException 
	 * */
	@RequestMapping("/update")
	public String updateCommunity(@ModelAttribute("community")Community community, MultipartFile file ) throws IOException {
		
		String imgPath = s3Manager.saveUploadedFiles(file);
		community.setCommImg(imgPath);
		communityService.updateCommunity(community);
		
		return "redirect:detail/"+community.getCommNo();
	} 
	
	/**
	 * community 글 수정 폼 - community/member/updateCommunity.jsp
	 * */
	@RequestMapping("/updateCommunity")
	public ModelAndView updateCommunityForm(@ModelAttribute("commNo")Integer commNo) {
		
		Community community = communityService.selectCommunity(commNo, false);
		
		return new ModelAndView("community/member/updateCommunity", "community", community);
	}
	
	/**
	 * community 글 삭제
	 * */
	@RequestMapping("/delete")
	public String deleteCommunity(int commNo, Integer commCategoryNo) {
		
		communityService.deleteCommunity(commNo);
		
		return "redirect:list/"+commCategoryNo;
	} 
	
	/**
	 * community 글 카테고리 별로 보기
	 * */
	@RequestMapping("/list/{commCategoryNo}")
	public ModelAndView selectCommunityCategory(@PathVariable(name = "commCategoryNo") Integer commCategoryNo) {
		
		List<Community> communityList = communityService.selectCommunityCategory(commCategoryNo);
		
		return new ModelAndView("community/guest/communityList", "list", communityList);
	}
	
	/**
	 * community 글 조회수 증가, 상세보기
	 * 글에 해당하는 덧글 목록도
	 * */
	@RequestMapping("/detail/{commNo}")
	public ModelAndView selectCommunity(HttpSession session,@PathVariable(name = "commNo") int commNo) {
		
		Community community = communityService.selectCommunity(commNo, true);
		List<CommComment> comment = commCommentService.selectCommComment(commNo);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("community/guest/communityDetail");
		mv.addObject("community", community);
		mv.addObject("comment", comment);
		return mv;
	} //조회수 증가 
	
	/**
	 * 내가 쓴 community 글 보기
	 * */
	@RequestMapping("/myCommunity/{memberNo}")
	public ModelAndView selectCommunityMember(@ModelAttribute("memberNo")Integer memberNo) {
		
		List<Community> community = communityService.selectCommunityMember(memberNo);
		
		return new ModelAndView("community/member/myCommunity", "community", community);
	}
	
	/**
	 * 덧글 등록
	 * */
	@RequestMapping("/insertComment")
	public String insertCommComment(CommComment comment, Integer membNo, Integer comNo) {
		comment.setCommunity(communityRepository.findById(comNo).orElse(null));
		comment.setMember(memberRepository.findById(membNo).orElse(null));
		
		commCommentService.insertCommComment(comment);
		
		int commNo = comment.getCommunity().getCommNo();
		
		return "redirect:detail/"+commNo;
	}
	
	/**
	 * 덧글 삭제
	 * */
	@RequestMapping("/deleteComment")
	public String deleteComment(int commentNo, Integer commNo) {
		
		commCommentService.deleteCommComment(commentNo);
		
		return "redirect:detail/"+commNo;
	}
	
}
