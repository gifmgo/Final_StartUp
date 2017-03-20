package kr.or.com.blog;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

@Controller
public class BlogerController {

	@Autowired
	private View jsonview;
	
	@Autowired
	private BlogerService service;
	
	//블로거 신청하기  >> 모달에서 신청
	@RequestMapping("/BlogerApply.do")
	public String blogerApply(BlogerApply_DTO dto, Model model){
		
		int result = service.blogerApply(dto);
		String msg,link = "";
		if(result > 0){
			msg = "신청성공!";
			link = "CommunityIndex.do";
		}else{
			msg = "신청 실패!";
			link = "CommunityIndex.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("link", link);
		return "dbResult";
	}
	
	//글 리스트 읽어 오는 부분
	@RequestMapping("/blogerPosting.do")
	public String blogPostingIndex(Model model){
		//글목록 뿌려주는 부분
		List<BlogContents_DTO> list = service.selectBloger();
		
		//블로거 아이디 담겨있음
		List<BlogList_DTO> blogerList = service.selectBlogerId();
		
		//블로거 mainURL, img 다 있음
		model.addAttribute("blogerId_List", blogerList);
		//블로거 글 정보
		model.addAttribute("list", list);
		return "bloger.blogerIndex";
	}
	
	//글 세부 내용 읽어오기
	@RequestMapping("/blogContentDetail.do")
	public String blogContentDetail(String seq, Model model){
		BlogContents_DTO dto = service.blogContentDetail(seq);
		System.out.println("확인좀 해봐요 상세 : "+dto.toString());
		model.addAttribute("dto",dto);
		return "bloger.blogerDetail";
	}
	
	
	
}
