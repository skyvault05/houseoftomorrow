package hot.constructor.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hot.admin.service.OrderServiceImpl;
import hot.aws.S3Manager;
import hot.channel.domain.Channel;
import hot.channel.service.ChannelServiceImpl;
import hot.constructor.service.ConstructorServiceImpl;
import hot.constructor.service.portfolioServiceImpl;
import hot.member.domain.Constructor;
import hot.member.domain.Order;
import hot.member.domain.Portfolio;
import hot.security.CustomUser;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ConstructorController {
	
	
	private final ChannelServiceImpl channelService;
	private final portfolioServiceImpl portfolioService;
	private final ConstructorServiceImpl constructorService;
	private final OrderServiceImpl orderService;
	
	String orderMethod ;
	String orderStatus ;
	String orderPayment ;
	
	@Autowired
	S3Manager s3manager;
	
	
	@RequestMapping("/channel/constructor/portfolioForm")
	public ModelAndView portfolioForm() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		Integer chNo = ((CustomUser)principal).getChNo();
		List<Portfolio> portList = portfolioService.selectPortfolioChNo(chNo);
		return new ModelAndView("/channel/constructor/portfolioForm","portList", portList);
	}
	
	@RequestMapping("/channel/constructor/pttest")
	public ModelAndView test() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		Integer chNo = ((CustomUser)principal).getChNo();
		List<Portfolio> portlist = portfolioService.selectPortfolioChNo(chNo);
		
		return new ModelAndView("/channel/constructor/myChannel","portlist", portlist);
	}
	
	
	
	@PostMapping("/channel/constructor/payment/complete")
	@ResponseBody
	public String insertPortfolio(String pg, String pay_method , String status) throws IOException{
		System.out.println("pay_method = "+pay_method);
		System.out.println("status = "+status);
		System.out.println("String = " + pg);
		
		
		String orderMethod = pay_method;;
		String orderStatus = status;;
		String orderPayment = pg;   
		
		return "결제 완료"; 
	}
	

	/* 
	 * 포트폴리오 등록
	 */
	
	@PostMapping("/channel/constructor/insertPort")
	public ModelAndView insertPortfolio2(String portTitle, 
			String portDescription, MultipartFile file, 
			Date portStartDate, Date portEndDate, String portImg, String chNo) throws IOException{	
		int ChannelNo = Integer.parseInt(chNo); 
		
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
		
		
		Object principal  = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser customUser = (CustomUser)principal;
		
		Integer memberNo = customUser.getMemberNo();
		portfolioService.insertPortfolio(portfolio);
		Constructor constructor = constructorService.selectConstructor(memberNo);
		
		
		Order order = new Order();
		order.setConstructor(constructor);
		order.setPortfolio(portfolio);
		
		
		
		// ajax에서 받아올 정보들 
		
		
		//orderService.insertOrder(order);
		/* 전체검색
		List<Portfolio> portlist = portfolioService.selectPortfolio();
		*/
		
		
		// chNo 채널별 포트폴리오 검색
		
		List<Portfolio> portlist = portfolioService.selectPortfolioChNo(ChannelNo);
		
		System.out.println("포트폴리오 : " + portlist.size());
		
		return new ModelAndView("redirect:/channel/guest/channelDetail", "portlist", portlist); 
	}
	
	////////////////////////////////////////////////////////////
	
	@RequestMapping("/channel/guest/channelDetail/{chNo}")
	public ModelAndView myChannel(@PathVariable Integer chNo) {
		List<Portfolio> portList = portfolioService.selectPortfolioChNo(chNo);
		Channel channel = channelService.selectChannel(chNo);
		
		ModelAndView mv = new ModelAndView("/channel/guest/channelDetail","portList", portList);
		mv.addObject("channel", channel);
		return mv;
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
