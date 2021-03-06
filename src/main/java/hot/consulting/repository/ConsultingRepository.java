package hot.consulting.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.consulting.domain.Consulting;

public interface ConsultingRepository extends JpaRepository<Consulting, Integer> {
	@Query("SELECT c FROM Consulting c WHERE c.memberNo = ?1 AND c.chNo = ?2 AND c.consulParentNo is null AND c.consulStatus = 1")
	Consulting findConsultingParent(int memberNo, int chNo);
	
	@Query("select c from Consulting c where c.memberNo = ?1 and c.chNo = ?2")
	Consulting findByMemberNoAndChNo(int memberNo, int chNo);
	
	@Query("select c from Consulting c where c.consulNo = ?1 and c.consulStatus = 1")
	Consulting findByIdConsulting(int consulNo);
	
	@Query("select c from Consulting c where c.memberNo = ?1 and c.consulStatus = 1 and c.consulParentNo is null") 
	List<Consulting> findBymemberNoConsulting(int memberNo);
	
	@Query("select c from Consulting c where c.chNo = ?1 and c.consulStatus = 1 and c.consulParentNo is null")
	List<Consulting> findByConNoConsulting(int chNo);

	@Query("select count(c) from Consulting c where c.memberNo = ?1 and c.chNo = ?2 and c.consulStatus=2")
	int findCountByMemberNoAndChNo(int memberNo, int chNo);
	
	List<Consulting> findByMemberNoAndChNoAndConsulStatus(Integer MemberNo, Integer chNo, Integer consulStatus);
	@Query("select c from Consulting c where c.memberNo = ?1 and c.consulStatus = 2 and c.consulParentNo is null")
	List<Consulting> findByMemberNoComConsulting(int memberNo);

	@Query("select c from Consulting c where c.chNo = ?1 and c.consulStatus = 2 and c.consulParentNo is null")
	List<Consulting> findByChNoComConsulting(int chNo);
}
