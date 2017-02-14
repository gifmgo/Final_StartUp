package kr.or.com.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	
	
	//관리자 메인페이지
	@RequestMapping("/adminIndex.do")
	public String adminIndex(){
		return "admin.AdminIndex";
	}
	
	//관리자 공지사항
	@RequestMapping("/AdminNotice.do")
	public String adminNotice(){
		return "admin.AdminNotice";
	}
	
	//관리자 토론
	@RequestMapping("/AdminDebate.do")
	public String adminDebate(){
		return "admin.AdminDebate";
	}
	
	//관리자 토론 리스트
	@RequestMapping("/AdminDeabteList.do")
	public String adminDeabteList(){
		return "admin.AdminDebateList";
	}
	
	
}
