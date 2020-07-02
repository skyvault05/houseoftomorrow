package hot.channel.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import hot.channel.domain.Channel;
import hot.channel.domain.FavoriteChannel;
import hot.channel.domain.FavoritePortfolio;

public interface ChannelService {


	
	Channel selectChannel(int ChNo);

	void insertChannel(Channel channel, MultipartFile chImg);
	

	void updateGrade(Integer chNo);

	void insertFavoriteChannel(Integer membNo, Integer chaNo);
	
	void deleteFavoriteChannel(int membNo, int chaNo);
	
	List<FavoriteChannel> myFavoriteChannel(int membNo);
	
	void insertFavoritePortfolio(Integer membNo, Integer portNo);
	
	void deleteFavoritePortfolio(int membNo, int portNo);
	
	List<FavoritePortfolio> myFavoritePortfolio(int membNo);
}
