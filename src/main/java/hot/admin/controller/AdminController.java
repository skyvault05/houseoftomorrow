package hot.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import hot.admin.service.PriceServiceImpl;
import hot.member.domain.Price;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {
	
	private final PriceServiceImpl priceService;
	
	
	@RequestMapping("/admin/price")
	String insertPrice(String priceAmount, String priceName){
		
		int Amount = Integer.parseInt(priceAmount);
		
		Price price = new Price(); 
		price.setPriceName(priceName);
		price.setPriceAmount(Amount);
		
		priceService.insertPrice(price);
		
		return "";
	}
}
