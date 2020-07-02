package hot.constructor.service;

import java.util.List;

import org.springframework.stereotype.Service;

import hot.constructor.repository.PortfolioRepository;
import hot.member.domain.Portfolio;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class portfolioServiceImpl implements PortfolioService{
	
	private final PortfolioRepository portRep;
	
	@Override
	public void insertPortfolio(Portfolio portfolio) {
		
		portRep.save(portfolio);
		
	}
	
	@Override
	public List<Portfolio> selectPortfolio() {
		
		return portRep.findAll();
	}
	
	
	@Override
	public List<Portfolio> selectPortfolioChNo(int ChNo) {
		
		return portRep.findPortfolioByChNo(ChNo);
	}
	
	
	
}
