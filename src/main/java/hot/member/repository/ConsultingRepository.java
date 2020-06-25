package hot.member.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.member.domain.Consulting;

public interface ConsultingRepository extends JpaRepository<Consulting, Integer> {
	@Query("SELECT c FROM Consulting c WHERE c.member.memberId = ?1 AND c.channel.chNo = ?2 AND c.consulParentNo.consulNo is null AND c.consulStatus = 0")
	Consulting findConsultingParent(String memberId, int chNo);
	
	@Query("SELECT c FROM Consulting c WHERE c.consulNo = ?1 ORDER BY consul_regdate")
	List<Consulting> findConsultingChild(int consulNo);
}
