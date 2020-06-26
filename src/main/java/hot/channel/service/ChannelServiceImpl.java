package hot.channel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hot.member.domain.Channel;
import hot.member.repository.ChannelRepository;
import hot.member.repository.ConstructorRepository;

@Service
public class ChannelServiceImpl implements ChannelService {
	@Autowired
	private ChannelRepository channelRepository;
	@Autowired
	private ConstructorRepository constructorRepository;
	/**
	 * 채널들록
	 */
	@Override
	@Transactional
	public void insertChannel(Channel channel) {
		constructorRepository.save(channel.getConstructor());
		channelRepository.save(channel);
	}

}
