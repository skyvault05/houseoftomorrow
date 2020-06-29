package hot.channel.service;

import hot.member.domain.Channel;

public interface ChannelService {
	void insertChannel(Channel channel);
	
	Channel selectChannel(int ChNo);
}
