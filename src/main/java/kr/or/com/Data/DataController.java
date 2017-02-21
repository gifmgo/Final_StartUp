package kr.or.com.Data;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
public class DataController {

	@Autowired
	private TodayUserService tService;
	
	@Autowired
	private View jsonView;
	
	// 게시판 커뮤니티 메인 페이지
	@RequestMapping("/dataView.do")
	public String dataView(Model model, HttpServletRequest request) {
		
		List<TodayUserDTO> list = tService.todayList();
		model.addAttribute("list", list);

		return "dataView.dataView";
	}
	
	@RequestMapping("/userConnect.do")
	public String userConnent(Model model, HttpServletRequest request) {
		String s = tService.updateTodayUser();
		model.addAttribute("excep", s);
		return "dataView.connectView";
	}
	
}
