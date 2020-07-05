package hot.constructor.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

	@Override
	public Page<Portfolio> findAllPortfolio(Pageable pageable) {
				
		Page<Portfolio> port = portRep.findByPortStatus(pageable,1);
		
		return port;
	}
	
	@Override
	public List<Portfolio> findAllPortfolio() {
		
		return null;
	}
	
	@Override
	public Portfolio portfolioDetail(int portNo) {
		Portfolio portfolio = portRep.findById(portNo).orElse(null);
		return portfolio;
	}
	
	
	
}
