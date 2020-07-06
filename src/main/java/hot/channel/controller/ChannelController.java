package hot.channel.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hot.channel.domain.Channel;
import hot.channel.domain.FavoriteChannel;
import hot.channel.domain.FavoritePortfolio;
import hot.channel.repository.ChannelRepository;
import hot.channel.repository.FavoriteChannelRepository;
import hot.channel.repository.FavoritePortfolioRepository;
import hot.channel.service.ChannelService;
import hot.constructor.repository.PortfolioRepository;
import hot.constructor.service.PortfolioService;
import hot.consulting.domain.Consulting;
import hot.consulting.domain.Contract;
import hot.consulting.repository.ConsultingRepository;
import hot.consulting.repository.ContractRepository;
import hot.member.domain.Constructor;
import hot.member.domain.Member;
import hot.member.domain.Portfolio;
import hot.member.repository.MemberRepository;
import hot.review.domain.Review;
import hot.review.repository.ReviewRepository;
import hot.review.service.ReviewService;

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
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private PortfolioService portfolioService;
	
	/**
	 * 채널 목록
	 * */
	@RequestMapping("/channelAll")
	public ModelAndView channelAll(@RequestParam(defaultValue = "0")int nowPage) {
		
		
		Pageable page =PageRequest.of(nowPage, 12, Direction.DESC, "chNo");
		
		Page<Channel> list = channelService.selectAllChannel(page);
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("channel/guest/channelAll");
		mv.addObject("list", list.getContent());
		mv.addObject("totalPage", list.getTotalPages());
		mv.addObject("nowPageNum", list.getNumber());
		return mv;
	}
	
	/**
	 * 채널 상세 페이지
	 * 
	 * + 채널 상세에 두 개만 나오는 리뷰
	 * 
	 * + 포트폴리오
	 * */
	@RequestMapping("/guest/channelDetail/{chNo}")
	public ModelAndView chDetail(@PathVariable(name="chNo")int chNo, @RequestParam(defaultValue = "0")int nowPage, Model model) {

		Channel channel = channelService.selectChannel(chNo);
		List<Review> realReviewList = reviewService.selectReviewChNo(chNo);
		List<Portfolio> realPortList = portfolioService.selectPortfolioChNo(chNo);
		
		Pageable page =PageRequest.of(nowPage, 2, Direction.DESC, "reviewNo");
		Page<Review> pageReview = reviewService.selectAll(page, channel);

		model.addAttribute("list", pageReview.getContent());
		
		Portfolio port = portfolioService.portfolioDetail(chNo);
		
		Pageable portPage = PageRequest.of(nowPage, 8, Direction.DESC, "portNo");
		Page<Portfolio> pagePort = portfolioService.selectAll(portPage, channel);
		
		model.addAttribute("portList", pagePort.getContent());
		
		List<FavoriteChannel> favCh = fcRep.findByChannel(channel);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/channel/guest/channelDetail");
		mv.addObject("channel", channel);
		mv.addObject("realPortList", realPortList);
		mv.addObject("favCh", favCh);
		mv.addObject("realReviewList", realReviewList);
		return mv;
	}

	/**
	 * 채널 수정 폼
	 * */
	@RequestMapping("/constructor/channelUpdate/{chNo}")
	public ModelAndView updateChannelForm(@ModelAttribute(name="chNo")Integer chNo) {
		Channel channel = channelService.selectChannel(chNo);
		return new ModelAndView("channel/constructor/channelUpdate", "channel", channel);
	}
	

	/**
	 * 채널 수정
	 * @throws IOException 
	 * */
	@RequestMapping("/update")
	public String updateChannel(Constructor constructor, Channel channel, Integer chaNo, Integer membNo, MultipartFile file) throws IOException {
		channelService.updateChannel(constructor, channel, chaNo, file);
		return "redirect:guest/channelDetail/"+chaNo;
	}
	
	/**
	 * 내 채널
	 * */
	@RequestMapping("/constructor/myChannel/{memberNo}")
	public ModelAndView myChannel(@ModelAttribute(name="memberNo")Integer memberNo, Model model, @RequestParam(defaultValue = "0")int nowPage) {
		
		Channel channel = channelService.myChannel(memberNo);
		List<Review> realReviewList = reviewService.selectReviewChNo(channel.getChNo());
		List<Portfolio> realPortList = portfolioService.selectPortfolioChNo(channel.getChNo());
		
		Pageable page =PageRequest.of(nowPage, 2, Direction.DESC, "reviewNo");
		Page<Review> pageReview = reviewService.selectAll(page, channel);

		model.addAttribute("list", pageReview.getContent());
		
		Portfolio port = portfolioService.portfolioDetail(channel.getChNo());
		
		Pageable portPage = PageRequest.of(nowPage, 8, Direction.DESC, "portNo");
		Page<Portfolio> pagePort = portfolioService.selectAll(portPage, channel);
		
		model.addAttribute("portList", pagePort.getContent());
		
		List<FavoriteChannel> favCh = fcRep.findByChannel(channel);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/channel/constructor/myChannel");
		mv.addObject("channel", channel);
		mv.addObject("realPortList", realPortList);
		mv.addObject("favCh", favCh);
		mv.addObject("realReviewList", realReviewList);
		return mv;
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
	 * 채널 상세 페이지 새로고침할 때 하트 값 설정
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
	public Integer favoritePortfolio(Integer membNo, Integer portfNo) {
		Member member = memberRep.findById(membNo).orElse(null);
		Portfolio portfolio = portRep.findById(portfNo).orElse(null);
		
		FavoritePortfolio favPort = fpRep.findByMemberAndPortfolio(member, portfolio);
		
		if(favPort==null) {
			channelService.insertFavoritePortfolio(membNo, portfNo);
			return 1; // 등록하고 1 반환
		} else {
			channelService.deleteFavoritePortfolio(membNo, portfNo);
			return 2;
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
	 * 포트폴리오 상세 페이지 새로고침할 때 하트 값 설정
	 * */
	@ResponseBody
	@RequestMapping("/favoritePortfolio/checkHeart")
	public Integer favoratePortfolioCheck(Integer membNo, Integer portfNo) {
		Portfolio portfolio = portRep.findById(portfNo).orElse(null);
		Member member = memberRep.findById(membNo).orElse(null);
		
		FavoritePortfolio favPort = fpRep.findByMemberAndPortfolio(member, portfolio);
		
		if(favPort == null) { // 빈하트
			return 1;
		} else { // 꽉찬하트
			return 2;
		}
	}
	
	/**
	 * 채널 리뷰 등록 가능 여부 확인
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
			return new ModelAndView("redirect:../guest/channelDetail/"+chNo);
			// ../를 사용하지 않으면 channel/check/channelDetail로 간다.
		}
	}

	/**
	 * 시공사 상호명 가져오기
	 */
	@ResponseBody
	@PostMapping("/member/contrcutorName")
	public String conName(Integer chNo) {
		String name = channelService.findConName(chNo);
		return name;
	}
}