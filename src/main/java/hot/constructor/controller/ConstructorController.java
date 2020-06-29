package hot.constructor.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hot.aws.S3Manager;
import hot.channel.service.ChannelServiceImpl;
import hot.constructor.repository.ChannelRepository;
import hot.constructor.repository.PortfolioRepository;
import hot.constructor.service.portfolioServiceImpl;
import hot.member.domain.Channel;
import hot.member.domain.Portfolio;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ConstructorController {
	
	
	private final ChannelServiceImpl channelService;
	private final portfolioServiceImpl portfolioService;
	
	@Autowired
	S3Manager s3manager;
	
	
	@RequestMapping("/channel/constructor/portfolioForm")
	void portfolioForm() {
		System.out.println("폼 진입");
		
	};
	
	
	/* 
	 * 포트폴리오 등록
	 */
	
	@RequestMapping("/channel/constructor/insertPort")
	public ModelAndView insertPortfolio(String portTitle, String portDescription, MultipartFile file, 
			Date portStartDate, Date portEndDate, String portImg, String ChNo) throws IOException{
		//폼이랑 name명 잘 맞출 것
		
		System.out.println("등록하기 버튼 클릭");
		System.out.println(portTitle);
		System.out.println(portDescription);
		System.out.println(portStartDate);
		System.out.println(portEndDate);
		System.out.println(ChNo);
		
		int ChannelNo = Integer.parseInt(ChNo); 
		
		Long sd=portStartDate.getTime();
		Long ed=portEndDate.getTime();
		
		Timestamp startDate = new Timestamp(sd);
		Timestamp endDate = new Timestamp(ed);
		
		
		Portfolio portfolio = new Portfolio();
		
		Channel channel = channelService.selectChannel(ChannelNo);
		System.out.println(channel);
		String imgpath = s3manager.saveUploadedFiles(file);
		
		portfolio.setPortTitle(portTitle);
		portfolio.setPortDescription(portDescription);
		portfolio.setPortStartDate(startDate);
		portfolio.setPortEndDate(endDate);
		portfolio.setChannel(channel);
		portfolio.setPortImg(imgpath);
		
		portfolioService.insertPortfolio(portfolio);
		
		// 전체검색
		//List<Portfolio> portlist = portfolioService.selectPortfolio();
		
		// chNo 채널별 포트폴리오 검색
		
		List<Portfolio> portlist = portfolioService.selectPortfolioChNo(ChannelNo);
		
		System.out.println("포트폴리오 : " + portlist.size());
		
		return new ModelAndView("channel/constructor/myChannel", "portlist", portlist); 
	}
	
	@RequestMapping("/channel/constructor/myChannel")
	public ModelAndView myChannel(Model model) {
		
		int chNo =1;
		List<Portfolio> portlist = portfolioService.selectPortfolioChNo(chNo);
		
		return new ModelAndView("/channel/constructor/myChannel","portlist", portlist);
		
	}
	
		
	
	@RequestMapping("/channel/constructor/payment/inputForm")
	public void inputForm() {
		
		
		//return "channel/constructor/payment/inputForm";
	}
	
	
	
	@RequestMapping("/channel/constructor/payment/importApi")
	public String payment() {
		System.out.println("결제 api 들어옴");
		
		return "channel/constructor/payment/importApi";
	}
	
	
	
	@ResponseBody
	@RequestMapping("/payments/complete")
	public String paymentComplete() {
		System.out.println(11111);
		
		return "success";
	}
	
	@RequestMapping("/errormessage")
	public String error() {
		
		
		return "error/error";
	}
	
	
	
	
	
	
	
}
