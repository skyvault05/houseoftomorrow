package hot.consulting.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.consulting.domain.Consulting;

public interface ConsultingRepository extends JpaRepository<Consulting, Integer> {
	@Query("SELECT c FROM Consulting c WHERE c.member.memberNo = ?1 AND c.channel.chNo = ?2 AND c.consulParentNo is null AND c.consulStatus = 1")
	Consulting findConsultingParent(int memberNo, int chNo);
	
	@Query("SELECT c FROM Consulting c WHERE c.consulParentNo = ?1 ORDER BY consul_regdate")
	List<Consulting> findConsultingChild(int consulNo);
	
	@Query("select c from Consulting c where c.member.memberNo = ?1 and c.channel.chNo = ?2")
	Consulting findByMemberNoAndChNo(int memberNo, int chNo);
}
