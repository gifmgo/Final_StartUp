package kr.or.com.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import kr.or.com.Data.TodayUserDTO;
import kr.or.com.Member.MemberDTO;
import kr.or.com.blog.BlogList_DTO;
import kr.or.com.blog.BlogerApply_DTO;
import kr.or.com.debate.admin_DebateDTO;
import kr.or.com.debate.debateDTO;

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
	
	//유저보기 --> 페이징을 해야 합니다. 
	@RequestMapping("/AdminBanUserList.do")
	public String adminBanUserList(Model model){
		List<BanUserDTO> list =adminservice.userList();
		
		//현재페이지 -1 * 10 + 1
		//마지막 번호 = 시작번호 + 10-1
		
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
	
	//관리자 유저 접속수 확인 - 시작 리스트 뿌려주는 부분
	@RequestMapping("/AdminCountUser.do")
	public String CountUser(){
		return "admin.AdminCountUser";
	}
	
	//관리자 유저 접속수 확인 - 클릭 이벤트 발생시 아작스
	@RequestMapping("/AdminCountDate.do")
	public View countDate(Model model){
		List<TodayUserDTO> list = adminservice.countDateUser();
		model.addAttribute("list", list);
		return jsonview;
	}
	
	
	
	//관리자 설문지 쓰는 페이지 
	@RequestMapping("/adminPollWrite.do")
	public String pollWrite(){
		return "admin.AdminPollWrite";
	}
	
	//퀴즈 작성 페이지로 이동
    @RequestMapping("/pointQuiz.do")
    public String pointQuiz(){
    	return "admin.pointQuiz";
    }
    
    //퀴즈 작성 버튼 클릭시
    @RequestMapping(value="/QuizForm.do", method=RequestMethod.POST)
    public String quizForm(QuizDTO dto, Model model){
    	System.out.println(" ????????????"+dto.toString());
    	int result = adminservice.quiz(dto);
    	String msg="";
    	String link="";
    	if(result>0){
    		msg="퀴즈 등록 성공";
    		link="pointQuiz.do";
    	}else{
    		msg="퀴즈 등록 실패";
    		link="pointQuiz.do";
    	}
    	 model.addAttribute("msg", msg);
    	 model.addAttribute("link", link);
    	return "admin.AdminRedirect";
    }
    
    
    //차단 유저 문의 메일
    @RequestMapping("/BanUserMail.do")
    public String BanUserMailList(Model model){					
    	List<banUserMailDTO> mailList = adminservice.banUserMailList(); 
    	model.addAttribute("mailList", mailList);
    	return "admin.BanUserMailList";
    }
    
    //차단유저 문의 메일 -- > 모달창 띄울때
    @RequestMapping("/banUserMailModal.do")
    public View banUserMailModal(Model model, int banUserMailSeq){
    	System.out.println("넘어온 시퀀스 : "+banUserMailSeq);
    	banUserMailDTO dto = adminservice.banuserMailDTO(banUserMailSeq);
    	model.addAttribute("dto", dto);
    	return jsonview;
    }
    
    //유저 포인트 추가 페이지 - > 유저 리스트
    @RequestMapping("/AdminPointPlus.do")
    public String UserPointUpdate(Model model,String pageSize, String pnowPage){
    	
    	System.out.println("페이지 번호 확인좀 : "+pnowPage);
    	
    	List<MemberDTO> list = adminservice.selectMemberList();
    	
    	List<MemberDTO> list2 = new ArrayList<MemberDTO>();
    	
    	//게시물 총 개수
    	int totalCount = list.size();

    	//현재 페이지  >> 밑에 페이징 한 a 태크 클릭시
    	int nowPage;
    	if(pnowPage == null){
    		nowPage = 0;
    	}else{
    		nowPage = Integer.parseInt(pnowPage);
    	}
    
    	//페이지에 뿌려줄 데이터 개수
    	int i_pageSize = 10;
    	if(nowPage == 0){
    		model.addAttribute("index", 1);
    		for(int i = nowPage; i <= i_pageSize; i++){
    			System.out.println("for 문 내부임  : "+i);
    			if(i < i_pageSize){
    				list.get(i).setIndex(i);
    				list2.add(list.get(i));
    			}
    		}
    	}else{
    		model.addAttribute("index", ((nowPage-1)*i_pageSize));	
    		for(int i = ((nowPage-1)*i_pageSize); i <= ((nowPage * i_pageSize)); i++){
    			System.out.println("for 문 내부임  : "+i);
    			if(i <= ((nowPage * i_pageSize)-1) && i < list.size()){
    				list.get(i).setIndex(i);
    				System.out.println("lsit index : "+list.get(i).getIndex());
    				list2.add(list.get(i));
    			}
    		}
    	}
    	
    	//페이징 개수
    	int pageNumbering;
    	if(totalCount%i_pageSize == 0){
    		pageNumbering = totalCount / i_pageSize;
    	}else{
    		pageNumbering = ((totalCount / i_pageSize) + 1);
    	}
    	
    	
    	model.addAttribute("pageSize",i_pageSize);
    	model.addAttribute("pageNumbering", pageNumbering);
    	model.addAttribute("list", list2);
    	return "admin.UserPointPlus";
    }
    
    //유저 포인트 추가
    @RequestMapping("/UpdatePointAjax.do")
    public View UpdateAajx(Model model){
    	
    	List<MemberDTO> prevList = adminservice.selectMemberList();
    	int result = 0;
    	
    	result = adminservice.updateMemberPoint(prevList);
    	
    	List<MemberDTO> list = null;
    	if(result > 0){
    		list = adminservice.selectMemberList();
    	}
    	
    	System.out.println("list 싸이즈 : "+list.size());
    	model.addAttribute("list", list);
    	return jsonview;
    }
    
    //블로거 신청 리스트 확인
    @RequestMapping("/AdminBloger.do")
    public String AdminBlogerIndex(Model model){
    	List<BlogerApply_DTO> list = adminservice.selectBlogerList();
    	model.addAttribute("list", list);
    	return "admin.AdminBlogerIndex";
    }
    
    //블로거가 신청했을때 내용 확인 하고, 파일 업로드 해줭
    @RequestMapping("/AdminBlogerInfo.do")
    public View AdminBlogerInfo(String seq, Model model){
    	
    	String msg = "";
    	BlogerApply_DTO dto = null;
    	if(seq != null){
    		int i_seq = Integer.parseInt(seq);
    		dto = adminservice.blogerInfo(i_seq);
    	}else{
    		msg = "잘못된 접근 입니다.";
    	}
    	
    	model.addAttribute("msg",msg);
    	model.addAttribute("blogerInfo", dto);
    	return jsonview;
    }
    
    
    //블로거 신청했을 때 내용 확인 하고 db 에 등록 하는 부분
    @RequestMapping("/BlogerInfoForm.do")
    public String AdminBlogerInfoResult(@RequestParam("upload") MultipartFile file,HttpServletRequest request,  BlogerApply_DTO dto){    	
    	int result = adminservice.AdminBlogerInfoResult(file, dto, request);
    	if(result > 0){
    		result = adminservice.AdminBlogerUpdate(dto);
    	}
    	
    	if(result > 0){
    		result = adminservice.AdminWaitBloger_Delete(dto);
    	}
    	
    	System.out.println("최종 result 값은 ? : "+result);
    	return "redirect:AdminBloger.do";
    }
    
}
