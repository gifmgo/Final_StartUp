package kr.or.com.blog;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
public class BlogerController {

	@Autowired
	private View jsonview;
	
	@Autowired
	private BlogerService service;
	
	//글 리스트 읽어 오는 부분
	@RequestMapping("/blogerPosting.do")
	public String blogPostingIndex(String id, Model model){
		List<BlogContents_DTO> list = service.selectBloger(id);
		
		
		String blogerId, blogerImg, blogMainUrl = "";
		blogerId = id;
		blogerImg = list.get(0).getBloger_img();
		blogMainUrl = list.get(0).getBloger_mainUrl();
		
		model.addAttribute("mainUrl",blogMainUrl);
		model.addAttribute("profileId",blogerId);
		model.addAttribute("profileImg",blogerImg);
		model.addAttribute("list", list);
		return "bloger.blogerIndex";
	}
	
}
