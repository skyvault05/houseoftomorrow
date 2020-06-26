package hot.member.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.CommCategory;
import hot.member.domain.Community;

public interface CommCategoryRepository extends JpaRepository<CommCategory, Integer> {
	
}
