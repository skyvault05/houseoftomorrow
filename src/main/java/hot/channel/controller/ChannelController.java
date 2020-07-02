package hot.channel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hot.channel.domain.Channel;
import hot.channel.domain.FavoriteChannel;
import hot.channel.domain.FavoritePortfolio;
import hot.channel.repository.ChannelRepository;
import hot.channel.repository.FavoriteChannelRepository;
import hot.channel.repository.FavoritePortfolioRepository;
import hot.channel.service.ChannelService;
import hot.constructor.repository.PortfolioRepository;
import hot.member.domain.Member;
import hot.member.domain.Portfolio;
import hot.member.repository.MemberRepository;

@Controller
public class ChannelController {
	
	@Autowired
	private ChannelService channelService;
	
	@Autowired
	private FavoriteChannelRepository fcRep;
	
	@Autowired
	private FavoritePortfolioRepository fpRep;
	
	@Autowired
	private MemberRepository memberRep;
	
	@Autowired
	private ChannelRepository channelRep;
	
	@Autowired
	private PortfolioRepository portRep;
	
	@RequestMapping("/channelDetail")
	public String chDetail() {
		return "/channel/guest/channelDetail";
	}
	
	/**
	 * 관심채널 등록 / 삭제
	 * */
	@ResponseBody
	@RequestMapping("/favoriteChannel/check")
	public void favorateChannel(Integer membNo, Integer chaNo) {
		System.out.println("컨트롤러 들어옴");
		System.out.println("membNo: " + membNo);
		System.out.println("chaNo: " + chaNo);
		Channel channel= channelRep.findById(chaNo).orElse(null);
		Member member = memberRep.findById(membNo).orElse(null);
		
		FavoriteChannel favChannel = fcRep.findByMemberAndChannel(member, channel);
		
		if(favChannel == null) { // 등록한다.
			FavoriteChannel favoriteChannel = new FavoriteChannel();
			
			favoriteChannel.setChannel(channelRep.findById(chaNo).orElse(null));
			favoriteChannel.setMember(memberRep.findById(membNo).orElse(null));
			
			channelService.insertFavoriteChannel(membNo, chaNo);
		} else { // 삭제한다.
			channelService.deleteFavoriteChannel(membNo, chaNo);
		}
	}
	
	/**
	 * 로그인한 회원의 관심채널 목록
	 * */
	@RequestMapping("/myFavoriteChannel/{membNo}")
	public ModelAndView myFavoriteCh(@PathVariable(name="membNo")int membNo) {
		
		List<FavoriteChannel> fvChannel = channelService.myFavoriteChannel(membNo);
		
		return new ModelAndView("channel/member/favoriteChannel", "fvChannel", fvChannel);
	} 
	
	/**
	 * 관심 포트폴리오 등록 / 삭제
	 * */
	@ResponseBody
	@RequestMapping("/favoritePortfolio/check")
	public void favoritePortfolio(Integer membNo, Integer portfNo) {
		Member member = memberRep.findById(membNo).orElse(null);
		Portfolio portfolio = portRep.findById(portfNo).orElse(null);
		
		FavoritePortfolio favPort = fpRep.findByMemberAndPortfolio(member, portfolio);
		
		if(favPort==null) {
			channelService.insertFavoritePortfolio(membNo, portfNo);
		} else {
			channelService.deleteFavoritePortfolio(membNo, portfNo);
		}		
	}
	
	/**
	 * 로그인한 회원의 관심 포트폴리오 목록
	 * */
	@RequestMapping("/myFavoritePortfolio/{membNo}")
	public ModelAndView myPortfolio(@PathVariable(name="membNo")Integer membNo) {
		
		List<FavoritePortfolio> fport = channelService.myFavoritePortfolio(membNo);
		
		return new ModelAndView("channel/member/favoritePortfolio", "fport", fport);
	}
}
