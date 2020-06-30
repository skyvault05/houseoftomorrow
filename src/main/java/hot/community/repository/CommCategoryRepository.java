package hot.community.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.community.domain.CommCategory;
import hot.community.domain.Community;

public interface CommCategoryRepository extends JpaRepository<CommCategory, Integer> {
	
}
