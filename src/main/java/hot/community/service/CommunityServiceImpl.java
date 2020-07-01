package hot.community.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hot.aws.S3Manager;
import hot.community.domain.CommCategory;
import hot.community.domain.Community;
import hot.community.repository.CommCategoryRepository;
import hot.community.repository.CommunityRepository;
import hot.member.domain.Member;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityRepository communityRepository;
	
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
		
		// 상태값 생각하지 않고 모든 내용을 출력하고자 했을 때
//		List<Community> commList = communityRepository.findByMemberMemberNo(memberNo);
//		return commList;

		Member member = new Member();
		member.setMemberNo(memberNo);
		List<Community> list = communityRepository.findByMemberEnabled(member, 1);
		
		return list;
	}

}
