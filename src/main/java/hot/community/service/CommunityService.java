package hot.community.service;

import java.util.List;

import hot.member.domain.Community;

public interface CommunityService {

	int insertCommunity(Community community);
	
	int updateCommunity(Community community); 
	
	int deleteCommunity(int commNo); 
	
	List<Community> selectCommunityCategory(Integer commCategoryNo); 
	
	Community selectCommunity(int commNo, boolean state);
	
	List<Community> selectCommunityMember(Integer memberNo);

}
