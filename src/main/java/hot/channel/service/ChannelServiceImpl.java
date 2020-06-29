package hot.channel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hot.constructor.repository.ChannelRepository;
import hot.constructor.repository.ConstructorRepository;
import hot.member.domain.Channel;

@Service
public class ChannelServiceImpl implements ChannelService {
	@Autowired
	private ChannelRepository channelRepository;
	@Autowired
	private ConstructorRepository constructorRepository;
	/**
	 * 채널등록
	 */
	@Override
	@Transactional
	public void insertChannel(Channel channel) {
		constructorRepository.save(channel.getConstructor());
		channelRepository.save(channel);
	}
	
	
	/**
	 * 채널조회
	 */
	@Override
	public Channel selectChannel(int ChNo) {
		
		
		return channelRepository.findById(ChNo).orElse(null);
		
	}
}
