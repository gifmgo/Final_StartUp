package kr.or.com.debate;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
public class DebateController {

	@Autowired
	private View jsonView;
	@Autowired
	private debateService service;
	
	//토론 글 상세보기
	@RequestMapping("/debateDetail.do")
	public View debateDetail(String seq, Model model){
		debateDTO dto = null;
		String msg = "";
		try{
			dto = service.selectDetail(seq);
			if(dto == null){
				msg = "0";
			}else{
				msg = "1";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("dto", dto);
		return jsonView;
	}
	
	//진보, 보수 토론 더보기 ->  페이지 처음 들어올때
	@RequestMapping("/moreCommunityTalk.do")
	public String debate(Model model){
		List<debateDTO> list = null;
		List<debateDTO> jlist = new ArrayList<debateDTO>();
		List<debateDTO> blist =new ArrayList<debateDTO>();
		
		admin_DebateDTO link=null;
		try{	
			 //리스트 담아둠
			 list = service.list();
			 for(int i=0; i<list.size(); i++){
				 if(list.get(i).getChoose().equals("진보")){
					 jlist.add(list.get(i));
				 }else{
					 blist.add(list.get(i));
				 }
			 }
			 //키워드, 링크 담아둠
			 link = service.videosrc();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		model.addAttribute("keyWord", link);
		
		model.addAttribute("jlist", jlist);
		model.addAttribute("blist", blist);
		return "debate.debateTalkIndex";
	}
	
	
	//글쓸때.
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
		model.addAttribute("resultNo", result);
		return jsonView;
	}
		
	//글쓰기 성공했을시 
	@RequestMapping("/writeResult.do")
	public String writeSuccess(){
		return "redirect:moreCommunityTalk.do";
	}
	/*@RequestMapping("/debateList.do")
	public View debateList(Model model){
		String msg = "";
		List<debateDTO> dto = service.list();
		if(dto == null){
			msg = "죄송합니다 잠시후 이용해주세요 !";
		}
		model.addAttribute("list", dto);
		model.addAttribute("msg", msg);
		return jsonView;
	}*/
	
}
