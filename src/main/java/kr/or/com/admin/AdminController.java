package kr.or.com.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminservice;
	
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
	
	//유저보기 
	@RequestMapping("/AdminBanUserList.do")
	public String adminBanUserList(Model model){
		
		List<BanUserDTO> list =adminservice.userList();
		for(int i=0; i<list.size(); i++){
			System.out.println("dtooooooooooooooooo???????"+list.get(i).toString());
		}
		
		model.addAttribute("userlist", list);
		return "admin.AdminBanUserList";
	}
	
	
	@RequestMapping("/banUser.do")
	public String banUser(String banId){
		System.out.println("==============test: "+banId);
		return null;
	}
	
}
