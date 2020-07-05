package hot.consulting.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.consulting.domain.Contract;

public interface ContractRepository extends JpaRepository<Contract, Integer> {
	@Query("select c from Contract c where c.consulNo = ?1 and c.consulUserDecide = 2 and c.consulConDecide = 2")
	Contract findContractComplete(int consulNo);
}
