package hot.constructor.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import hot.channel.domain.Channel;
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
	public List<Portfolio> findAllPortfolio() {
		List<Portfolio> port = portRep.findByPortStatus(1);
		return port;
	}

	@Override
	public Portfolio portfolioDetail(int portNo) {
		Portfolio portfolio = portRep.findById(portNo).orElse(null);
		return portfolio;
	}

	@Override
	public Page<Portfolio> selectAll(Pageable portPage, Channel channel) {
		Page<Portfolio> port = portRep.findByChannelNoAndPortStatus(portPage, channel, 1);
		return port;
	}
	
	
	
}
