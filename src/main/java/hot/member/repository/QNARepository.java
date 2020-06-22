package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.QNA;

public interface QNARepository extends JpaRepository<QNA, Integer> {

}
