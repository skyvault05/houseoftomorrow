package hot.constructor.service;

import java.util.List;

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
		
		return null;
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

	@Override
	public void insertOrder(Order order, String orderStatusName) {
		System.out.println("order.getOrderStatusName(): " + orderStatusName);
		
		if(orderStatusName == "ready") {
			System.out.println("**************ready**************");
			order.setOrderStatus(0);
		} else if(orderStatusName == "paid") {
			System.out.println("**************paid**************");
			order.setOrderStatus(1);
		} else if(orderStatusName == "cancelled") {
			
			order.setOrderStatus(2);
		} else if(orderStatusName == "failed") {
			order.setOrderStatus(3);
		}
		
		order.setOrderStatus(1);
		System.out.println("강제로 status 값 줌");
		orderRep.save(order);		
	}
}
