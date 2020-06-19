package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.Price;

public interface PriceRepository extends JpaRepository<Price, Long> {

}
