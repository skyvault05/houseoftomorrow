package hot.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hot.channel.domain.Channel;
import hot.channel.service.ChannelServiceImpl;
import hot.constructor.service.portfolioServiceImpl;
import hot.member.domain.Portfolio;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {

	private final portfolioServiceImpl portfolioService;
	private final ChannelServiceImpl channelService;
	
	
	@RequestMapping("/")
	public ModelAndView index(@RequestParam(defaultValue = "0")int nowPage ) {
		
		// 최신 포트폴리오 
		Pageable page =PageRequest.of(nowPage, 2, Direction.DESC, "portNo");
		//Page<Portfolio> portList = portfolioService.findAllPortfolio(page);
		
		List<Portfolio> portList = portfolioService.selectAllPortNoDesc();
		
		
		
		// 평점 높은 시공사 출력
		
		List<Channel> channelList = channelService.selectChannelByChstatusAndchGrades(1);
		
						
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/common/index");
		mv.addObject("portList", portList);
		mv.addObject("channelList", channelList);
		return mv;
	}
	
	
	
	
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/common/loginForm";
	}
}