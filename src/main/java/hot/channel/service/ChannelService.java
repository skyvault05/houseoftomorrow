package hot.channel.service;

import org.springframework.web.multipart.MultipartFile;

import hot.member.domain.Channel;

public interface ChannelService {
	void insertChannel(Channel channel, MultipartFile chImg);
}
