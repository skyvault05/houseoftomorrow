package hot.qna.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.qna.domain.QNACategory;

public interface QNACategoryRepository extends JpaRepository<QNACategory, Integer> {

}
