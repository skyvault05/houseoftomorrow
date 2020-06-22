package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.Contract;

public interface ContractRepository extends JpaRepository<Contract, Integer> {

}
