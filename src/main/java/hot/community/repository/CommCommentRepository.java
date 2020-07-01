package hot.community.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.community.domain.CommComment;
import hot.community.domain.Community;

public interface CommCommentRepository extends JpaRepository<CommComment, Integer> {

	List<CommComment> findByCommunityCommNo(int commNo);
}
