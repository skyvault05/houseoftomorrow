package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.CommCategory;

public interface CommCategoryRepository extends JpaRepository<CommCategory, Long> {

}
