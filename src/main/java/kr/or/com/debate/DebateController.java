package kr.or.com.debate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

@Controller
public class DebateController {

	@Autowired
	private View jsonView;
	@Autowired
	private debateService service;
	
	//진보, 보수 토론 더보기
	@RequestMapping("/moreCommunityTalk.do")
	public String debate(Model model){
		String keyWord = null;
		try{	
			keyWord = service.debateKeyWord();
			if(keyWord == null){
				keyWord = "죄송해요 잠시후 다시 이용해주세요 !";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		model.addAttribute("keyWord", keyWord);
		return "debate.debateTalkIndex";
	}
	
	@RequestMapping("/DebateWrite.do")
	public View debateWrite(debateDTO dto, Model model){
		
		System.out.println("dto 확인좀 할께요 : "+dto.toString());
		int result = 0;
		String resultTalk = "";
		try{
			result = service.write(dto);
			if(result < 0){
				resultTalk = "죄송합니다. 잠시후 이용해주세요 !";
			}else{
				resultTalk = "글쓰기에 성공하셨습니다 !";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		model.addAttribute("result", resultTalk);
		return jsonView;
	}
		
	
	
}
