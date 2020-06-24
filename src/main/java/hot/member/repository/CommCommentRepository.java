package hot.member.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.CommComment;
import hot.member.domain.Community;

public interface CommCommentRepository extends JpaRepository<CommComment, Integer> {

	List<CommComment> findByCommunityCommNo(int commNo);
}
