package hot.admin.service;

import org.springframework.stereotype.Service;

import hot.admin.repository.PriceRepository;
import hot.member.domain.Price;
import lombok.RequiredArgsConstructor;

@Service 
@RequiredArgsConstructor
public class PriceServiceImpl implements PriceService {
	
	private final PriceRepository priceRep;
	
	@Override
	public void insertPrice(Price price) {
		
			
		priceRep.save(price);
	}

}
