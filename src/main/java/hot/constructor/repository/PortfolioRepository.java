package hot.constructor.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.member.domain.Portfolio;

public interface PortfolioRepository extends JpaRepository<Portfolio, Integer> {
	
	@Query("select p from Portfolio p where p.channel.chNo = ?1")
	List<Portfolio> findPortfolioByChNo(int chNo);
	
}
