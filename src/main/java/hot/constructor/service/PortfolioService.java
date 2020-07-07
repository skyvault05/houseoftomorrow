package hot.constructor.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import hot.channel.domain.Channel;
import hot.member.domain.Order;
import hot.member.domain.Portfolio;

public interface PortfolioService {
	
	void insertPortfolio(Portfolio portfolio);
	
	void insertOrder(Order order);
	
	void deletePortfolio(int portNo);
	
	List<Portfolio> selectPortfolio();
		
	List<Portfolio> selectPortfolioChNo(int ChNo);
	
	Page<Portfolio> selectPortfolioChNo(int ChNo, Pageable page);
	
	List<Portfolio> findAllPortfolio();
	
	Portfolio portfolioDetail(int portNo);

	Page<Portfolio> selectAll(Pageable portPage, Channel channel);

	Page<Portfolio> findAllPortfolio(Pageable pageable);
	

	
	List<Portfolio> selectAllPortNoDesc();
	

}
