package hot.channel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import hot.consulting.domain.Consulting;
import hot.consulting.domain.Contract;
import hot.consulting.repository.ConsultingRepository;
import hot.consulting.repository.ContractRepository;
import hot.member.domain.Member;
import hot.member.domain.Portfolio;
import hot.member.repository.MemberRepository;
import hot.review.domain.Review;
import hot.review.repository.ReviewRepository;

@Controller
@RequestMapping("/channel")
public class ChannelController {

	@Autowired
	private ChannelService channelService;
	
	@Autowired
	private MemberRepository memberRep;
		
	@Autowired
	private FavoriteChannelRepository fcRep;
	
	@Autowired
	private FavoritePortfolioRepository fpRep;
	
	@Autowired
	private ChannelRepository channelRep;
	
	@Autowired
	private PortfolioRepository portRep;
	
	@Autowired
	private ConsultingRepository consultingRep;
	
	@Autowired
	private ReviewRepository reviewRep;
	
	/**
	 * 채널 목록
	 * */
	@RequestMapping("/channelAll")
	public ModelAndView channelAll() {
		System.out.println("컨트롤러");
		List<Channel> list = channelService.channelList();
		
		return new ModelAndView("channel/guest/channelAll", "list", list);
	}
	
	/**
	 * 채널 상세 페이지
	 * 
	 * + 채널 상세에 두 개만 나오는 리뷰
	 * */
	@RequestMapping("/channelDetail/{chNo}")
	public ModelAndView chDetail(@PathVariable(name="chNo")int chNo) {

		Channel channel = channelService.selectChannel(chNo);
		List<Review> list = reviewRep.findByChannelNoAndReviewStatusTop2ByOrderBySeqDesc(channel, 1);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/channel/guest/channelDetail");
		mv.addObject("channel", channel);
		mv.addObject("list", list);
		return mv;
	}


	@RequestMapping("/update")
	public ModelAndView updateChannel(Integer chNo) {
		channelService.updateGrade(chNo);
		return null;
	}

	
	/**
	 * 관심채널 등록 / 삭제
	 * */
	@ResponseBody
	@RequestMapping("/favoriteChannel/check")
	public Integer favorateChannel(Integer membNo, Integer chaNo) {
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
		return 1;
	}
	
	/**
	 * 새로고침할 때 하트 값 설정
	 * */
	@ResponseBody
	@RequestMapping("/favoriteChannel/checkHeart")
	public Integer favorateChannelCheck(Integer membNo, Integer chaNo) {
		Channel channel= channelRep.findById(chaNo).orElse(null);
		Member member = memberRep.findById(membNo).orElse(null);
		
		FavoriteChannel favChannel = fcRep.findByMemberAndChannel(member, channel);
		
		if(favChannel == null) { // 빈하트
			return 1;
		} else { // 꽉찬하트
			return 2;
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
	
	/**
	 * 리뷰 등록 가능 여부 확인
	 * */
	@RequestMapping("/check/impossibleReview")
	public ModelAndView checkReview(Integer memberNo, Integer chNo) {

		int consultingCount = consultingRep.findCountByMemberNoAndChNo(memberNo, chNo);
		int reviewCount = reviewRep.findCountByMemberNoAndChNo(memberNo, chNo);
		
		System.out.println("consultingCount: "  + consultingCount);
		System.out.println("reviewCount: "  + reviewCount);
		
		//Consulting consulting = consultingRep.findByMemberNoAndChNo(memberNo, chNo);
		Channel channel = channelRep.findById(chNo).orElse(null);
		
		if(consultingCount != reviewCount) { // 상담 후, 시공이 확정된 수만큼 리뷰가 없다는 뜻(더 많을 수는 없잖아 원래)
			return new ModelAndView("review/member/reviewform", "channel", channel); 
		} else { // 상담 후, 시공이 확정된 수만큼 리뷰가 있다는 것이기 때문에 모든 리뷰 다 등록됨
			return new ModelAndView("redirect:../channelDetail/"+chNo);
			// ../를 사용하지 않으면 channel/check/channelDetail로 간다.
			// 여기 뒤에 chNo 들어가야된다. 안그러면 엄한 페이지로 넘어감 !!!!
		}
	}

}
