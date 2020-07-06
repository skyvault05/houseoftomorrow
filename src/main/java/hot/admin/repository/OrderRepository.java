package hot.admin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.member.domain.Order;
import hot.member.domain.Portfolio;

public interface OrderRepository extends JpaRepository<Order, Integer> {
	
	@Query("SELECT o FROM Order o WHERE o.Portfolio.portNo = ?1")
	Order selectByPortfolioNo(Integer portNo);
}	
	
	
