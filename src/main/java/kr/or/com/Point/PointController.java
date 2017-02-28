package kr.or.com.Point;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.com.Paliament_DTO.PaliamentList_DTO;

@Controller
public class PointController {

	@Autowired
	private PointService service;
	
	@Autowired
	private View jsonview;
	
	//포인트 메인 페이지
	@RequestMapping("/point.do")
	public String PointIndex(Model model){
		List<PaliamentList_DTO> list = service.PointIndex();
		model.addAttribute("list", list);
		return "point.PointIndex";
	}
	
	
	//의원 검색 할 때
	@RequestMapping("/PointSearchPaliament.do")
	public View searchPaliament(String name, Model model){
		
		List<PaliamentList_DTO> list = service.searchPaliament(name);
		model.addAttribute("list", list);
		return jsonview;
	}
	
	//베스트 국회의원 포인트 구매시
	@RequestMapping("/buyPoint.do")
	public View buyPoint(Model model){
		
		return jsonview;
	}
	
	
}
