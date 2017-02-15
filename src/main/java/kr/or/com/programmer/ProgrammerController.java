package kr.or.com.programmer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProgrammerController {
	
	@RequestMapping("/Programmer.do")
	public String Forum(){
		return "forum.forumIndex";
	}
	
}
