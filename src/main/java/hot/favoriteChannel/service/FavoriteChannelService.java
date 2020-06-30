package hot.favoriteChannel.service;

public interface FavoriteChannelService {

	void insertFavoriteChannel(Integer membNo, Integer chaNo);
	
	void deleteFavoriteChannel(int chaNo);
	
	//List<> myFavoriteChannel(int membNo);
}
