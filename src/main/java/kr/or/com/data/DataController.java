package kr.or.com.data;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.com.FreeBoard.FreeBoardService;

/*@Controller
public class DataController {

	@Autowired
	private FreeBoardService free_Service;
	
	@Autowired
	private View jsonView;
	
	// 게시판 커뮤니티 메인 페이지
	@RequestMapping("/CommunityIndex.do")
	public String Community(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyyMMddHHmm");
	    String strDate = fm.format(new Date());
		
	    model.addAttribute("now", strDate);
	    model.addAttribute("imgsrc", "img alt src=");
		model.addAttribute("id", id);

		return "community.CommunityIndex";
	}
	
}
*/