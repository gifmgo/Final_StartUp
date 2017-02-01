package kr.or.com.index;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
public class indexController {

	@Autowired
	private View jsonview;
	
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
	public String index(){
		System.out.println("인덱스 . do ");
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
