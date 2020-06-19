package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.ChCategory;

public interface ChCategoryRepository extends JpaRepository<ChCategory, Long> {

}
