package hot.channel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.channel.domain.FavoritePortfolio;
import hot.member.domain.Member;
import hot.member.domain.Portfolio;

public interface FavoritePortfolioRepository extends JpaRepository<FavoritePortfolio, Integer> {

	FavoritePortfolio findByMemberAndPortfolio(Member member, Portfolio portfolio);
	
	void deleteByMemberAndPortfolio(Member member, Portfolio portfolio);
	
	List<FavoritePortfolio> findByMember(Member member);
	
	List<FavoritePortfolio> findByPortfolio(Portfolio portfolio);
	
}
