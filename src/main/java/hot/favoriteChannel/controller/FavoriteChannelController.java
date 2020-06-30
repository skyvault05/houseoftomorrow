package hot.favoriteChannel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/favoriteChannel")
public class FavoriteChannelController {

	/**
	 * 관심채널 등록
	 * */
	@ResponseBody
	@RequestMapping("/insert")
	public void insertFavoriteCh(Integer membNo, Integer chaNo) {
		
	}
	
	/**
	 * 관심채널 삭제
	 * */
	@ResponseBody
	@RequestMapping("/delete")
	public void deleteFavoriteCh(int chaNo) {
		
	}
	
	/**
	 * 로그인한 회원의 관심채널 목록
	 * */
	public ModelAndView myFavoriteCh(int membNo) {
		return null;
	} 
}
