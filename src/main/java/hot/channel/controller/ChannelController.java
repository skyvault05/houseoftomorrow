package hot.channel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChannelController {
	@RequestMapping("/channelDetail")
	public String chDetail() {
		return "/channel/guest/channelDetail";
	}
}
