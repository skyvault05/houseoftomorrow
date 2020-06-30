package hot.channel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hot.channel.domain.FavoritePortfolio;

public interface FavoritePortfolioRepository extends JpaRepository<FavoritePortfolio, Integer> {

}
