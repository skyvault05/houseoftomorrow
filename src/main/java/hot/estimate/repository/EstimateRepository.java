package hot.estimate.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.estimate.domain.Estimate;
import hot.member.domain.Member;

public interface EstimateRepository extends JpaRepository<Estimate, Integer> {
	@Query("SELECT e FROM Estimate e WHERE e.member.memberNo = :#{#member.memberNo}")
	List<Estimate> findByMemberNo(Member member);
}
