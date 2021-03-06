package hot.constructor.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import hot.channel.domain.Channel;
import hot.member.domain.Portfolio;

public interface PortfolioRepository extends JpaRepository<Portfolio, Integer> {
	
	@Query("select p from Portfolio p where p.channel.chNo = ?1 AND p.portStatus =?2")
	List<Portfolio> findPortfolioByChNoAndPortStatus(int chNo, int portStatus);
	
	Page<Portfolio> findByPortStatus(Pageable pageable, Integer portStatus);
	
	@Query("SELECT f FROM Portfolio f WHERE channel.chNo = :#{#channel.chNo} AND f.portStatus =:#{#portStatus}")
	Page<Portfolio> findByChannelNoAndPortStatus(Pageable pageable, Channel channel, Integer portStatus);
	
	List<Portfolio> findByPortStatusOrderByPortNoDesc(Integer portStatus); 
	
	List<Portfolio> findByPortStatus(Integer portStatus);
	

}
