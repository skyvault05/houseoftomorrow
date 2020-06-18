package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.ReportCategory;

public interface ReportCategoryRepository extends JpaRepository<ReportCategory, Long> {

}
