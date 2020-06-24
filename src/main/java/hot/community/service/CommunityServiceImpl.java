package hot.community.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
		String fileName = community.getCommImg();

		communityRepository.save(community);
		
		return 0;
	}

	@Override
	@Transactional
	public int updateCommunity(Community community) {

		Community dbCommunity = communityRepository.findById(community.getCommNo()) .orElse(null);
		
		if(dbCommunity!=null) {
			dbCommunity.setCommTitle(community.getCommTitle());
			dbCommunity.setCommImg(community.getCommImg());
			dbCommunity.setCommDescription(community.getCommDescription());
		}
		
		return 0;
	}

	@Override
	@Transactional
	public int deleteCommunity(int commNo) {
		communityRepository.deleteCommunity(commNo);
		return 0;
	}

	@Override
	public List<Community> selectCommunityCategory(Integer commCategoryNo) {
		
		// 상태값 생각하지 않고 모든 내용을 출력하고자 했을 때
		// CommCategory comCate = commCateRep.findById(commCategoryNo).orElse(null);
		
		// return comCate.getCommList();
		
		CommCategory commCategory = new CommCategory();
		commCategory.setCommCategoryNo(commCategoryNo);
		List<Community> list = communityRepository.findByCommCategoryEnabled(commCategory, 1);
		
		return list;
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
		List<Community> commList = communityRepository.findByMemberMemberNo(memberNo);
		return commList;
	}

}
