package kr.or.com.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import net.sf.json.JSONObject;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private View jsonview;
	
	
	//회원가입시 아이디 체크
	@RequestMapping("/id_Check.do")
	public View id_Check(String id, Model model){
		
		System.out.println("넘어온 아이디 : "+id);
		String db_id = service.checkId(id);
		String msg, use, hidden_id = "";
		
		if(db_id == null){
			System.out.println("if 탐");
			msg = "사용 가능한 아이디 입니다!";
			use="1";
			hidden_id = id;
		}else{
			msg = "사용할 수 없는 아이디 입니다!";
			use="2";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("use", use);
		model.addAttribute("hidden_id", hidden_id);
		return jsonview;
	}
	
	//회원가입시 닉네임 체크
	@RequestMapping("/check_N.do")
	public View checkNick(String nick, Model model){
		String db_nick = service.checkNick(nick);
		String msg, use, hidden_nick = "";
		if(db_nick == null){
			System.out.println("if 탐");
			msg = "사용 가능한 닉네임 입니다!";
			use="1";
			hidden_nick = nick;
		}else{
			msg = "사용할 수 없는 닉네임 입니다!";
			use="2";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("use", use);
		model.addAttribute("hidden_nick", hidden_nick);
		return jsonview;
	}
	
	
	@RequestMapping("/Login.do")
	public View loginResult(String id, String pw, HttpServletRequest request, Model model){		
		//로그인 성공시 - 성공  
		//로그인 실패시 - 실패
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPw(pw);
		
		MemberDTO result = service.Login(dto);
		
		
		System.out.println("로그인 결과 : "+result);
		if(result != null){
			if(dto.getId().equals("stpark89@naver.com")){
				model.addAttribute("result","관리자");
			}else{
				HttpSession session = request.getSession();
				session.setAttribute("memberDTO", result);
				session.setAttribute("id", dto.getId());
				model.addAttribute("result","성공");
			}
			return jsonview;	
		}else{
			model.addAttribute("result","실패");
			return jsonview;
		}
	}
	
	@RequestMapping("/LogOut.do")
	public String logOut(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		model.addAttribute("url", "index.do");
		return "LogOut";
	}
	
	
	//아이디 중복확인
	@RequestMapping("/checkId.do")
	public View checkId(String id, Model model){
		String result = service.checkId(id);
		if(result==null ||result ==""){
			model.addAttribute("msg", "사용가능한 아이디입니다");
		}else{
			model.addAttribute("msg", "이미 존재하는 아이디입니다");
		}
		
		return jsonview;
	}
	
	
	//회원가입 버튼 클릭시
	@RequestMapping(value="/AddMember.do", method=RequestMethod.POST)
	public View AddMember(MemberDTO dto, String favorit, Model model){
		
		dto.setFavorit(favorit);
		int result = 0; 
		try{
			result = service.AddMember(dto);	
		}catch(Exception e){
			e.printStackTrace();
		}
		 
		if(result > 0){
			System.out.println("성공");
		}else{
			System.out.println("실패");
		}
		return jsonview;
	}
	
	//내정보 수정 하기
	@RequestMapping(value="/infoView.do", method=RequestMethod.GET)
	public String InfoView(HttpServletRequest request, Model model){
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		System.out.println("로그인 한 아이디 : "+id);

		String link,msg="";
		
		if(id == null){
			
			link = "index.do";
			msg = "잘못된 접근 입니다!";
			model.addAttribute("link", link);
			model.addAttribute("msg", msg);
			
			return "dbResult";
			
		}else{
			MemberDTO dto = service.SelectMyInfo(id);
			
			if(dto.getId().equals(null)){
			
				link = "index.do";
				msg = "ID/PW 를 확인해주세요!";
				model.addAttribute("link", link);
				model.addAttribute("msg", msg);
				return "dbResult";

			}else{
				model.addAttribute("dto", dto);
				System.out.println("최종 페이지 뿌리기전에 dto 리스트 확인 해볼께요 !! "+dto.toString());
				return "member.MyInfoView";
			}
		}
	}
	
	//내정보 수정 하기
	@RequestMapping(value="/infoView.do", method=RequestMethod.POST)
	public String infoViewPost(HttpServletRequest request, MemberDTO dto, Model model){
		System.out.println("포스트 함수 호출 !! "+dto.toString() + " / 관심사 : "+dto.getFavorit().toString());
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		dto.setId(id);
		
		int result = service.updateMyInfo(dto);
		
		String link,msg="";
		if(result > 0){
			link = "infoView.do";
			msg = "정보수정 성공!";		
		}else{
			link = "infoView.do";
			msg = "정보수정 실패!";
		}
		model.addAttribute("link", link);
		model.addAttribute("msg", msg);
		return "dbResult";
	}
	
	//닉네임 중복 검사 !!
	@RequestMapping("/checkNick.do")
	public View nickCheck(String nick, Model model){

		int result = service.checkNickName(nick);
		String msg, use= "";
		
		if(result == 1){
			msg = "사용 가능한 아이디 입니다!";
			use="1";

		}else{
			msg = "사용할 수 없는 아이디 입니다!";
			use="2";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("use", use);
		return jsonview;
	}
	
	//개인정보 수정 submit 이벤트 발생시
	@RequestMapping("/submitMyModify.do")
	public View modifySubmit(String nick, Model model){
		int result = service.checkNickName(nick);
		
		System.out.println("서브밋 할때 호출 되는 부분 : "+result);
		
		String info = "";
		if(result == 1){
			info = "success";
		}else{
			info = "fail";
		}
		model.addAttribute("result", info);
		return jsonview;
	}
	
	
}
