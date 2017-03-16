package kr.or.com.President;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.com.Member.MemberDTO;

@Controller
public class PresidentController {
	
	@Autowired
	private View jsonview;
	
	@Autowired
	private PresidentService service;
	
	//대선후보 메인 페이지
	@RequestMapping("/PresidentMember.do")
	public String parentsList(Model model){
		List<PresidentDTO> list = service.list();
		model.addAttribute("list",list);
		return "president.PresidentIndex";
	}
	
	//대선후보 지지율 페이지
	@RequestMapping("/PresidentPolls.do")
	public String presidentPolls(Model model){
		List<PresidentDTO> list = service.PresidentPoll();
		model.addAttribute("list", list);
		return "president.PresidentPools";
	}
	
	//대선후보 투표 하기 페이지
	@RequestMapping("/PresidentVote.do")
	public String PresidentVote(Model model){
		List<PresidentDTO> list = service.presidentVote();
		model.addAttribute("list", list);
		return "president.PresidentVote";
	}
	
	//대선 관련 한마디 하기 페이지
	@RequestMapping(value="/PresidentTalk.do", method=RequestMethod.GET)
	public String PresidentTalk(Model model){
		
		//유저들이 쓴 글 리스트
		List<PresidentTalk_DTO> comment_List = service.presidentTalk_List();
		for(int i = 0; i < comment_List.size(); i++){
			System.out.println("ddd : "+comment_List.get(i).toString());
		}
		//드래그앤 드랍에 쓸 대선 후보 정보
		List<PresidentDTO> list = service.presidentTalk();
		
		model.addAttribute("comment_List",comment_List);
		model.addAttribute("talk_list", list);
		return "president.PresidentTalk";
	}
	
	//대선관련 드래그앤 드랩 해서 만든 폼 이용해서 글쓰기
	@RequestMapping(value="/PresidentTalk.do", method=RequestMethod.POST)
	public String PresidentTalkPOST(Model model, HttpServletRequest request, PresidentTalk_DTO dto){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int result = 0;
		if(id == null){
			System.out.println("아이디가 없어 비회원 : "+dto.toString());
			result = service.notLoginUserTalk(dto);
		}else{
			
			MemberDTO login_dto = (MemberDTO)session.getAttribute("memberDTO");
			dto.setNickName(login_dto.getNickName());
			dto.setLoginPw(id);
			result = service.loginUserTalk(dto);
		}
		String msg, link = "";
		if(result > 0){
			msg = "글 등록 성공!";
			link = "PresidentTalk.do";
		}else{
			msg = "글 등록 실패!";
			link = "PresidentTalk.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("link", link);
		return "dbResult";
	}
	
	//대선관련 >> 글 삭제하기
	@RequestMapping(value="/deletePresidentTalk.do")
	public View deletePresidentTalk(String seq,String nickName, String pw,Model model){
		int presidentTalk_seq = Integer.parseInt(seq);
		PresidentTalk_DTO dto=service.selectPresidentTalk(presidentTalk_seq);
		int result = service.deletePresidentTalk(presidentTalk_seq,nickName,pw,dto.getPw());
		
		model.addAttribute("result", result);
		return jsonview;
	}
	
	
	//로그인했는지 체크하는 함수
	@RequestMapping("/loginCheck.do")
	public View loginCheck(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("id");
		
		String message = null;
		int result = 0;
		if(logId == null){
			message = "로그인을 해주세요";
			model.addAttribute("message", message);
			model.addAttribute("result", result);
		}else{
			result = 1;
			model.addAttribute("result",result);
		}
		return jsonview;
	}
	
	//로그인하고 투표하기 
	@RequestMapping("/dbVoteStart.do")
	public View dbVoteStart(String chk, HttpServletRequest request, Model model){
		System.out.println("체크한 후보 : "+chk);
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		PresidentVote_DTO dto = service.checkVote(id);
		int result,dbResult = 0;
		String message = null;
		
		if(id == null){
			System.out.println("널일떄 !!!! ");
			message = "로그인을 해주세요! (로그아웃을 살포시..)";
			dbResult = 3;
		}else{
			if(dto == null){
				
				PresidentVote_DTO nDto = new PresidentVote_DTO();
				
				nDto.setId(id);
				nDto.setPresident(chk);
				
				result = service.VoteStart(nDto);
				
				if(result > 0){
					message = "투표 성공";
					dbResult = 1;
				}else{
					message = "투표 실패";
					dbResult = 0;
				}
				
			}else{
				message = "이미 투표를 하셨습니다.";
				dbResult = 2;
			}
		}
		
		model.addAttribute("message", message);
		model.addAttribute("dbResult", dbResult);
		return jsonview;
	}
	
	@RequestMapping("/voteDetailAjax.do")
	public View voteDetailAjax(Model model){
		List<PresidentDTO> list = service.voteDetailAjax();
		model.addAttribute("list", list);
		return jsonview;
	}
	
	
}
