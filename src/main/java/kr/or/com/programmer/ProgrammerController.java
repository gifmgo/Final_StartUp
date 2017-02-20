package kr.or.com.programmer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProgrammerController {
	
	//포럼 페이지 
	@RequestMapping("/Programmer.do")
	public String Forum(){
		return "forum.forumIndex";
	}
	
	//포럼 설문지
	@RequestMapping("/surveyList.do")
	public String surveyList(){
		return "forum.surveyIndex";
	}
	
}
