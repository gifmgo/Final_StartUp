package kr.or.com.President;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PresidentController {
	
	@Autowired
	private PresidentService service;
	
	//대선후보 메인 페이지
	@RequestMapping("/PresidentMember.do")
	public String parentsList(Model model){
		List<PresidentDTO> list = service.list();
		model.addAttribute("list",list);
		return "president.PresidentIndex";
	}
	
	//그래프
	@RequestMapping("/PresidentGraph.do")
	public String presidentGrap(){
		return "president.PresidentGrap";
	}
}
