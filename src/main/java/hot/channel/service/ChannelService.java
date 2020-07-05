package hot.channel.service;


import java.io.IOException;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import hot.channel.domain.Channel;
import hot.channel.domain.FavoriteChannel;
import hot.channel.domain.FavoritePortfolio;
import hot.member.domain.Constructor;

public interface ChannelService {

	List<Channel> channelList();
	
	Channel selectChannel(int ChNo);

	void insertChannel(Channel channel, MultipartFile chImg);
	
	void updateGrade(Integer chNo);

	void insertFavoriteChannel(Integer membNo, Integer chaNo);
	
	void deleteFavoriteChannel(Integer membNo, Integer chaNo);
	
	List<FavoriteChannel> myFavoriteChannel(int membNo);
	
	void insertFavoritePortfolio(Integer membNo, Integer portNo);
	
	void deleteFavoritePortfolio(int membNo, int portNo);
	
	List<FavoritePortfolio> myFavoritePortfolio(int membNo);
	
	Channel myChannel(Integer memberNo);

	void updateChannel(Constructor constructor, Channel channel, Integer chaNo, MultipartFile file) throws IOException;
	
	Page<Channel> selectAllChannel(Pageable pageable);
}
