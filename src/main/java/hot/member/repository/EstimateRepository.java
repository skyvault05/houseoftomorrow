package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.Estimate;

public interface EstimateRepository extends JpaRepository<Estimate, Integer> {

}
