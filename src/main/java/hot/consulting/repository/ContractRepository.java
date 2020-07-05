package hot.consulting.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.consulting.domain.Contract;

public interface ContractRepository extends JpaRepository<Contract, Integer> {
	
}
