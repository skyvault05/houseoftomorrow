package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.ConstructorRegisterRequest;

public interface ConstructorRegisterRequestRepository extends JpaRepository<ConstructorRegisterRequest, Integer> {

}
