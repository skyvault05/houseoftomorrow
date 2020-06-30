package hot.channel.service;

import org.springframework.web.multipart.MultipartFile;

import hot.channel.domain.Channel;

public interface ChannelService {
	void insertChannel(Channel channel, MultipartFile chImg);
}
