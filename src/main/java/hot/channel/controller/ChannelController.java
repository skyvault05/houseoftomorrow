package hot.channel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hot.channel.service.ChannelService;
import hot.member.domain.Channel;
import hot.member.domain.Review;
import hot.member.repository.ChannelRepository;
import hot.member.repository.MemberRepository;
import hot.member.repository.ReviewRepository;
import hot.review.service.ReviewService;

@Controller
@RequestMapping("/channel")
public class ChannelController {

	@Autowired
	private ChannelService channelService;
	
	@Autowired
	private MemberRepository memberRep;
	
	@RequestMapping("/update")
	public ModelAndView updateChannel(Integer chNo) {
		channelService.updateGrade(chNo);
		return null;
	}
	
}
