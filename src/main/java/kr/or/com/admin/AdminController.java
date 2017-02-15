package kr.or.com.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
public class AdminController {

	@Autowired
	private View jsonview;
	
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
	
	//차단, 차단해제 전 아이디 확인
	@RequestMapping("/Admin_checkId.do")
	public View checkId(Model model){
		List<BanUserDTO> result = adminservice.checkId();
		model.addAttribute("banUser", result);
		return jsonview;
	}
	
	//차단하기
	@RequestMapping("/banUser.do")
	public String banUser(String banId, Model model){
		System.out.println("==============test: "+banId);
		int result = adminservice.banIdinsert(banId);
		String msg, link = "";
		if(result > 0){
			msg = "차단 성공!";
			link = "AdminBanUserList.do";
		}else{
			msg = "실패 하였습니다.!";
			link = "AdminBanUserList.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("link",link);
		return "admin.AdminRedirect";
	}
	
	//차단유저 해제
	@RequestMapping("/banUserDelete")
	public String banUserDelete(String banId, Model model){
		System.out.println("==============test: "+banId);
		int result = adminservice.banIdDelete(banId);
		String msg, link = "";
		if(result > 0){
			msg = "차단 성공!";
			link = "AdminBanUserList.do";
		}else{
			msg = "실패 하였습니다.!";
			link = "AdminBanUserList.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("link",link);
		return "admin.AdminRedirect";
	}
	
}
