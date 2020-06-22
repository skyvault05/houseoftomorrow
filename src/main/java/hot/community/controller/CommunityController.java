package hot.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hot.community.service.CommunityService;
import hot.member.domain.Community;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	CommunityService communityService;

	@RequestMapping("/{url}")
	public void url() {}
	
	/**
	 * 실제 community  글 등록
	 * */
	@RequestMapping("/insert")
	public String insertCommunity(Community community) {
		System.out.println("컨트롤러 들어옴");
		System.out.println("community.getCommCategory().getCommCategoryNo()" + community.getCommCategory().getCommCategoryNo());
		communityService.insertCommunity(community);
		
		System.out.println("설명: " + community.getCommDescription());
		
		return "redirect:list";
	}
	
	/**
	 * community 글 수정
	 * */
	public String updateCommunity(Community community) {
		return "";
	} 
	
	/**
	 * community 글 수정 폼 - community/updateCommunity.jsp
	 * */
	public ModelAndView updateCommunityForm(int commNo) {
		return null;
	}
	
	/**
	 * community 글 삭제
	 * */
	public String deleteCommunity(int commNo) {
		return "";
	} 
	
	/**
	 * community 글 카테고리 별로 보기
	 * */
	@RequestMapping("/list")
	public ModelAndView selectCommunityCategory(Integer commCategoryNo) {
		return null;
	}
	
	/**
	 * community 글 조회수 증가
	 * */
	public ModelAndView selectCommunity(int commNo) {
		return null;
	} //조회수 증가 
	
	/**
	 * 내가 쓴 community 글 보기
	 * */
	public ModelAndView selectCommunityMember(Integer memberNo) {
		return null;
	}

	
}
