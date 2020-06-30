package hot.consulting.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.consulting.domain.Contract;

public interface ContractRepository extends JpaRepository<Contract, Integer> {

}
