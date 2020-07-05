package hot.admin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.member.domain.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {

}	
	
	
