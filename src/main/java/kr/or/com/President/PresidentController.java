package kr.or.com.President;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PresidentController {
	
	@RequestMapping("/PresidentMember.do")
	public String parentsList(){
		return "president.PresidentIndex";
	}
	
	//그래프
	@RequestMapping("/PresidentGraph.do")
	public String presidentGrap(){
		return "president.PresidentGrap";
	}
}
