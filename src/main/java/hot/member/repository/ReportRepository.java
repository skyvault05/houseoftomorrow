package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.Report;

public interface ReportRepository extends JpaRepository<Report, Integer> {

}
