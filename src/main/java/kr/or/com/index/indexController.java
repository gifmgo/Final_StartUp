package kr.or.com.index;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.View;

import kr.or.com.FreeBoard.FreeBoardDTO;
import kr.or.com.Member.MemberDTO;
import kr.or.com.Paliament_DTO.PaliamentList_DTO;
import kr.or.com.President.PresidentTalk_DTO;
import kr.or.com.debate.debateDTO;

@Controller
public class indexController {

	@Autowired
	private View jsonview;
	
	@Autowired
	private IndexService service;
	
	//접속자 확인
	@RequestMapping(value="/", method=RequestMethod.GET)
	public void checkIp(){
		System.out.println(" 접속자확인==================");
		/*String ip = request.getRemoteAddr();*/
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null){
        	ip = req.getRemoteAddr();
        }
            
		System.out.println(" ip----------------------"+ip);
	}
	
	
	@RequestMapping("/faceBook.do")
	public View fIndex(HttpServletRequest request, String img, String name, String id, Model model){
		HttpSession session = request.getSession();
		String dbid = (String)session.getAttribute("id");
		String message = "";
		String result = "0";
		if(dbid == null){
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("img", img);
			message = "로그인 성공!!";
			result = "1";
		}else{
			message = "올바르지 못한 방법입니다!";
		}
		model.addAttribute("message",message);
		model.addAttribute("result",result);
		return jsonview;
	}
	
	//메인에서 코멘트 보내는 부분
	@RequestMapping("/indexComment.do")
	public View Comment(String title, String comment, String admin, Model model){
		
		System.out.println("넘어온 데이타 : "+title+"/ 코멘트 : "+comment + " / 관리자 : "+admin);
		model.addAttribute("data", "성공");
		return jsonview;
	}
	
	@RequestMapping("/index.do")
	public String index(Model model){
		
		//대선후보 토크 보는 것
		List<PresidentTalk_DTO> president_list = service.PresidentTalk();
		//토론 - 키워드
		List<debateDTO> debate_list = service.selectKeyWord();
		//오늘의 이슈
		List<FreeBoardDTO> todayIssue_list = service.selectIssue();
		//정치 게시판 글
		List<FreeBoardDTO> jungChi_list = service.selectJungChi();
		//공지사항
		List<FreeBoardDTO> notice = service.selectNotice();
		
		////////////////////////////////////////////////////////
		
		//포인트
		List<MemberDTO> point_list = service.selectPointList();
		
		//인기 국회의원 
		List<PaliamentList_DTO> pal_list = service.selectPaliamentList();
		
		model.addAttribute("president_list", president_list);
		model.addAttribute("debate_list", debate_list);
		model.addAttribute("todayIssue_list",todayIssue_list);
		model.addAttribute("jungChi_list",jungChi_list);
		model.addAttribute("notice_list", notice);
		
		//포인트
		model.addAttribute("point_list", point_list);
		//인기 국회의원
		model.addAttribute("pal_list", pal_list);
		
		return "index";
	}
	
	

	//페이지 소개
	@RequestMapping("/explanation.do")
	public String explanation(){
		return "explanation.explanation_Main";
	}
	
	//에러페이지
	@RequestMapping("/error_404.do")
	public String error_404(){
		return "error";
	}
	//에러페이지
	@RequestMapping("/error_500.do")
	public String error_500(){
		return "error";
	}
	
}
