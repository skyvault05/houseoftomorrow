package hot.admin.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.Price;

public interface PriceRepository extends JpaRepository<Price, Integer> {
	
}
