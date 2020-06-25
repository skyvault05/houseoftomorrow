package hot.member.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.member.domain.Consulting;

public interface ConsultingRepository extends JpaRepository<Consulting, Integer> {
	@Query("SELECT consulNo FROM Consulting c WHERE c.member.memberId = ?1 AND c.channel.chNo = ?2 AND c.consulParentNo = null")
	int findConsultingParent(String memberId, int chNo);
}
