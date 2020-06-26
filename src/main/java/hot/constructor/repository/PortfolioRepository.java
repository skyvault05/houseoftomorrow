package hot.constructor.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.Portfolio;

public interface PortfolioRepository extends JpaRepository<Portfolio, Integer> {
	
}
