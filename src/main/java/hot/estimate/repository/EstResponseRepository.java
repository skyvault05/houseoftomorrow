package hot.estimate.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.estimate.domain.EstResponse;
import hot.estimate.domain.Estimate;

public interface EstResponseRepository extends JpaRepository<EstResponse, Integer> {

	List<EstResponse> findByEstimateOrderByEstRespRegdateDesc(Estimate estimate);

}
