package hot.constructor.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.Constructor;

public interface ConstructorRepository extends JpaRepository<Constructor, Integer>{
	
	
}
