package hot.constructor.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import hot.admin.repository.OrderRepository;
import hot.channel.domain.Channel;
import hot.constructor.repository.PortfolioRepository;
import hot.member.domain.Order;
import hot.member.domain.Portfolio;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class portfolioServiceImpl implements PortfolioService{
	
	private final PortfolioRepository portRep;
	
	private final OrderRepository orderRep;
	
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
	public List<Portfolio> selectAllPortNoDesc() {
		
		return portRep.findByPortStatusOrderByPortNoDesc(1);
	}
	

	@Override
	public Page<Portfolio> findAllPortfolio(Pageable pageable) {
				
		Page<Portfolio> port = portRep.findByPortStatus(pageable,1);
		
		return port;
	}
	
	@Override
	public List<Portfolio> findAllPortfolio() {
		List<Portfolio> portAll = portRep.findByPortStatus(1);
		
		return portAll;
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

	/**
	 * 포트폴리오 등록할 때, 주문 테이블에도 값 들어가게
	 * */
	@Override
	public void insertOrder(Order order) {
		orderRep.save(order);		
	}

	/**
	 * 포트폴리오 삭제
	 * 
	 * portStatus -> 0
	 * orderStatus -> 2
	 * */
	@Override
	@Transactional
	public void deletePortfolio(int portNo) {		
		Portfolio dbPortfolio = portRep.findById(portNo).orElse(null);
		Order dbOrder = orderRep.selectByPortfolioNo(dbPortfolio.getPortNo());
		dbPortfolio.setPortStatus(0);
		
		if(dbOrder != null) {
			dbOrder.setOrderStatus(2);
		}		
	}
}