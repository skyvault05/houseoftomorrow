package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.CommComment;

public interface CommCommentRepository extends JpaRepository<CommComment, Integer> {

}
