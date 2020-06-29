package hot.channel.service;

import org.springframework.web.multipart.MultipartFile;

import hot.member.domain.Channel;

public interface ChannelService {


	
	Channel selectChannel(int ChNo);

	void insertChannel(Channel channel, MultipartFile chImg);

}
