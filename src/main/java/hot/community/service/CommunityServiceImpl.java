package hot.community.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import hot.aws.S3Manager;
import hot.member.domain.CommCategory;
import hot.member.domain.Community;
import hot.member.repository.CommCategoryRepository;
import hot.member.repository.CommunityRepository;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityRepository communityRepository;
	
	@Autowired
	private CommCategoryRepository commCateRep;
	
	@Autowired
	S3Manager s3Manager;
	
	@Override
	public int insertCommunity(Community community) {
		System.out.println("서비스 들어옴");
		String fileName = community.getCommImg();



		communityRepository.save(community);
		
		return 0;
	}

	@Override
	@Transactional
	public int updateCommunity(Community community) {

		Community dbCommunity = communityRepository.findById(community.getCommNo()) .orElse(null);
		
		if(dbCommunity!=null) {
			dbCommunity.getCommTitle().equals(community.getCommTitle());
			dbCommunity.getCommImg().equals(community.getCommImg());
			dbCommunity.getCommDescription().equals(community.getCommDescription());
		}
		
		return 0;
	}

	@Override
	public int deleteCommunity(int commNo) {
		communityRepository.deleteById(commNo);
		return 0;
	}

	@Override
	public List<Community> selectCommunityCategory(Integer commCategoryNo) {
		
		CommCategory comCate = commCateRep.findById(commCategoryNo).orElse(null);
		for(Community com : comCate.getCommList()) {
			System.out.println(com.getCommNo());
		}
		
		return comCate.getCommList();
	}
	
	/**
	 * state가 true이면 조회수 증가
	 * */
	@Override
	@Transactional
	public Community selectCommunity(int commNo, boolean state) {
		if(state) {
			communityRepository.updateReadnum(commNo);
		}
		
		Community community = communityRepository.findById(commNo).orElse(null);
		
		return community;
	}

	@Override
	public List<Community> selectCommunityMember(Integer memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
