package hot.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hot.admin.service.AdminService;
import hot.channel.domain.Channel;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/manage/admin/channelRegisterRequest")
	public ModelAndView channelRequestList() {
		List<Channel> channelList = adminService.selectPendedChannel();
		return new ModelAndView("/manage/admin/channelRegisterRequest", "channelList", channelList);
	}
	
	@RequestMapping("/manage/admin/updateChannelStatus/{chNo}")
	public ModelAndView updateChannelStatus(@PathVariable Integer chNo) {
		adminService.updateChannelStatus(chNo);
		return new ModelAndView("redirect:/manage/admin/channelRegisterRequest");
	}
}
