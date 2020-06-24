package hot.commComment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hot.member.domain.CommComment;
import hot.member.repository.CommCommentRepository;

@Service
public class CommCommentServiceImpl implements CommCommentService {

	@Autowired
	private CommCommentRepository commCommentRepository;
	
	@Override
	public int insertCommComment(CommComment commComment) {
		
		commCommentRepository.save(commComment);
		
		return 0;
	}

	@Override
	public int updateCommComment(CommComment commComment) {
		
		commComment.setCommCommentDescription(commComment.getCommCommentDescription());
		
		return 0;
	}

	@Override
	public int deleteCommComment(Integer commCommentNo) {
		
		commCommentRepository.deleteById(commCommentNo);
		
		return 0;
	}

	@Override
	public List<CommComment> selectCommComment(int commNo) {
		List<CommComment> list = commCommentRepository.findByCommunityCommNo(commNo);
//		for(CommComment comm : list) {
//			System.out.println("comm.getCommCommentDescription(): " + comm.getCommCommentDescription());
//		}
		return list;
	}

	/**
	 * 덧글 수정을 위해 필요함.
	 * */
	@Override
	public CommComment selectOneComment(int commentNo) {
		CommComment comment = commCommentRepository.findById(commentNo).orElse(null);
		return comment;
	}

}
