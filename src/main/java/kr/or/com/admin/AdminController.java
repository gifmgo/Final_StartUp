package kr.or.com.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.com.debate.admin_DebateDTO;
import kr.or.com.debate.debateDTO;
import kr.or.com.debate.debateService;

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
	
	//관리자 토론 페이지
	@RequestMapping("/AdminDebate.do")
	public String adminDebate(Model model){
		
		return "admin.AdminDebate";
	}
	
	//관리자 토론 주제 등록
	@RequestMapping("/insertSubject.do")
	public String insertSubject(admin_DebateDTO subject, Model model){
		System.out.println("====주제=========="+subject.toString());
		int result =0;
		String msg, link="";
		try{
			result=adminservice.insertSubject(subject);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(" result???????????"+result);
		if(result>0){
			msg="등록 성공";
			link="AdminDebate.do";
		}else{
			msg="등록 실패";
			link="AdminDebate.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("link", link);
		return "admin.AdminRedirect";
	}
	
	//관리자 토론 리스트
	@RequestMapping("/AdminDeabteList.do")
	public String adminDeabteList(Model model){
		List<admin_DebateDTO> keyword = adminservice.selectKeyWord();
		model.addAttribute("keyword", keyword);
		return "admin.AdminDebateList";
	}
	
	//관리자 토론 - 키워드 및 글개수 선택시 사용
	@RequestMapping("/adminDebateListAjax.do")
	public View chooseDebateList(String keyword, Model model){
		System.out.println("확인좀 할께요 키워드 : "+keyword);
		List<debateDTO> list = adminservice.selectList(keyword);
		model.addAttribute("list", list);
		return jsonview;
	}
	
	//유저보기 
	@RequestMapping("/AdminBanUserList.do")
	public String adminBanUserList(Model model){
		List<BanUserDTO> list =adminservice.userList();
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
