package hot.admin.service;

import org.springframework.stereotype.Service;

import hot.admin.repository.OrderRepository;
import hot.member.domain.Order;
import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {
	
	private final OrderRepository orderRep;
	
	@Override
	public void insertOrder(Order order) {
		System.out.println("OrderServiceImpl");
		orderRep.save(order);
		System.out.println("After OrderServiceImpl");
	}

}
