package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.member.domain.Consulting;

public interface ConsultingRepository extends JpaRepository<Consulting, Integer> {

}
