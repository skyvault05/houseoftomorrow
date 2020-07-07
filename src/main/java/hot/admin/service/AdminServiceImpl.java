package hot.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hot.channel.domain.Channel;
import hot.channel.repository.ChannelRepository;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	ChannelRepository channelRep;

	@Override
	public List<Channel> selectPendedChannel() {
		List<Channel> channelList = channelRep.findByChStatus(0);
		return channelList;
	}

	@Override
	public void updateChannelStatus(Integer chNo) {
		Channel channel = channelRep.findById(chNo).orElse(null);
		channel.setChStatus(1);
		channelRep.save(channel);		
	}

}
