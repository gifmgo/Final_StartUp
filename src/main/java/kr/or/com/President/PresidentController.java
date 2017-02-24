package kr.or.com.President;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PresidentController {
	
	@RequestMapping("/PresidentMember.do")
	public String parentsList(){
		return "president.PresidentIndex";
	}
	
}
