package hot.admin.service;

import java.util.List;

import hot.channel.domain.Channel;

public interface AdminService {
	List<Channel> selectPendedChannel();
	void updateChannelStatus(Integer chNo);
}
