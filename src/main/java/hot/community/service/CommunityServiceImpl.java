package hot.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hot.member.domain.Community;
import hot.member.repository.CommunityRepository;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityRepository communityRepository;
	
	@Override
	public int insertCommunity(Community community) {
		
		communityRepository.save(community);
		
		return 0;
	}

	@Override
	public int updateCommunity(Community community) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCommunity(int commNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Community> selectCommunityCategory(Integer commCategoryNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Community selectCommunity(int commNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Community> selectCommunityMember(Integer memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
