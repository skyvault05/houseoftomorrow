package hot.consulting.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hot.consulting.service.ConsultingService;
import hot.member.domain.Consulting;

@Controller
public class ConsultingController {
	@Autowired
	private ConsultingService consultService;
	
	@RequestMapping("/consultForm")
	public ModelAndView consultForm(String memberId, int chNo) {
		List<Consulting> list = new ArrayList<Consulting>();
		
		return new ModelAndView("consultUserDetail", "consulting", list);
	}
}
