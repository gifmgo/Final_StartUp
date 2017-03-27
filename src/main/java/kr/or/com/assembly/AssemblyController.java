package kr.or.com.assembly;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.com.Paliament_DTO.PaliamentList_DTO;
import kr.or.com.Parliament.PCommentDTO;
import kr.or.com.Parliament.PaliamentService;
import kr.or.com.statute.statuteDTO;

@Controller
public class AssemblyController {

	@Autowired
	private AssemblyService service;
	
	@Autowired
	private PaliamentService pal_service;
	
	@Autowired
	private View jsonview;
	
	//페이지 이동 index 
	@RequestMapping("/Assembly.do")
	public String AssemblyIndex(Model model){
		//최근 써진 댓글 뽑아오기
	   List<PCommentDTO> clist = pal_service.rPCommentList();
	   SimpleDateFormat fm = new SimpleDateFormat("yyyyMMddHHmm");
	   String strDate = fm.format(new Date());
	   
	    model.addAttribute("now", strDate);
	    model.addAttribute("clist", clist);
		return "assembly.AssemblyIndex";
	}
	
	//페이지 뜨고난다음에 아작스로 의원 정당 만 담겨있는거 가져옴
	@RequestMapping("/AssemblyPaliamentList.do")
	public View paliamentList(Model model){
		List<PaliamentList_DTO> paliament_list = service.selectPaliamentList();
	    model.addAttribute("paliament_list", paliament_list);
	    return jsonview;
	}
	
	//의안 부분 리스트 -- 
	@RequestMapping("/AssemblyStatueList.do")
	public View StatuteList(Model model){
		  List<statuteDTO> dto_list = new ArrayList<statuteDTO>();
	        try{ 
	        SAXBuilder builder = new SAXBuilder(); 
	        //url에 xml이 있는경우
	        Document jdomdoc = builder.build(new java.net.URL("http://apis.data.go.kr/9710000/BillInfoService/getRecentPasageList?numOfRows=5&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D"));
	        //response 
	        Element root= jdomdoc.getRootElement();
	        //System.out.println("처음 : "+root.getName());
	        Element second =root.getChild("body");
	        //System.out.println("두번째 : "+second.getName());
	        Element third = second.getChild("items");
	        List<Element> items =	third.getChildren("item");
	        //System.out.println("세번째 : "+items.size() + " /  제발 ? : "+items.toString());
	        for(int i=0;i<items.size(); i++){
	        	 Element person_E=items.get(i);
	        	 String committeeName=null;
	             if(person_E.getChild("committeeName")==null){
	             	committeeName= " ";
	             }else{
	             	committeeName=person_E.getChild("committeeName").getValue();
	             }
	            statuteDTO dto = new statuteDTO(person_E.getChild("proposeDt").getValue(), person_E.getChild("billName").getValue(), committeeName,person_E.getChild("generalResult").getValue(), person_E.getChild("billId").getValue());
	            dto_list.add(dto);
	        }
	         
	        }catch(Exception e){
	            e.printStackTrace();
	         }
	       
			model.addAttribute("statutelist", dto_list);
			return jsonview;
	}
	
}
