package hot.constructor.service;

import java.util.List;

import hot.member.domain.Portfolio;

public interface PortfolioService {
	
	void insertPortfolio(Portfolio portfolio);
	
	List<Portfolio> selectPortfolio();
		
	List<Portfolio> selectPortfolioChNo(int ChNo);
	
	List<Portfolio> findAllPortfolio();
	
	Portfolio portfolioDetail(int portNo);
	
}
