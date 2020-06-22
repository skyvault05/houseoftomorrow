package hot.community.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hot.community.service.CommunityService;
import hot.member.domain.Community;
import hot.member.repository.CommCategoryRepository;

@Controller
@RequestMapping("/community")
public class CommunityController {
	@Autowired
	CommCategoryRepository commCategoryRepository;
	
	@Autowired
	CommunityService communityService;

	@RequestMapping("/{url}")
	public void url() {}
	
	/**
	 * 실제 community  글 등록
	 * */
	@PostMapping("/insert")
	public String insertCommunity(Community community, Integer commCategoryNo) {
		System.out.println("컨트롤러 들어옴");
		community.setCommCategory(commCategoryRepository.findById(commCategoryNo).orElse(null));
		communityService.insertCommunity(community);
		
		System.out.println("설명: " + community.getCommDescription());
		
		return "list";
	}
	
	/**
	 * community 글 수정
	 * */
	@RequestMapping("/update")
	public String updateCommunity(@ModelAttribute("community")Community community) {
		communityService.updateCommunity(community);
		
		return "community/detail";
	} 
	
	/**
	 * community 글 수정 폼 - community/updateCommunity.jsp
	 * */
	@RequestMapping("/updateCommunity")
	public ModelAndView updateCommunityForm(int commNo) {
		
		Community community = communityService.selectCommunity(commNo, false);
		
		return new ModelAndView("community/updateCommunity", "community", community);
	}
	
	/**
	 * community 글 삭제
	 * */
	@RequestMapping("/delete")
	public String deleteCommunity(int commNo) {
		
		communityService.deleteCommunity(commNo);
		
		return "redirect:list";
	} 
	
	/**
	 * community 글 카테고리 별로 보기
	 * */
	@RequestMapping("/list/{commCategoryNo}")
	public ModelAndView selectCommunityCategory(@PathVariable(name = "commCategoryNo") Integer commCategoryNo) {
		
		List<Community> communityList = communityService.selectCommunityCategory(commCategoryNo);
		
		return new ModelAndView("community/communityList", "list", communityList);
	}
	
	/**
	 * community 글 조회수 증가, 상세보기
	 * */
	@RequestMapping("/detail/{commNo}")
	public ModelAndView selectCommunity(HttpSession session,int commNo) {
		
		Community community = communityService.selectCommunity(commNo, true);
		
		return new ModelAndView("community/communityDetail", "community", community);
	} //조회수 증가 
	
	/**
	 * 내가 쓴 community 글 보기
	 * */
	public ModelAndView selectCommunityMember(Integer memberNo) {
		return null;
	}

	
}
