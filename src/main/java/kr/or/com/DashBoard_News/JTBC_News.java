package kr.or.com.DashBoard_News;

import java.util.ArrayList;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
public class JTBC_News {

	@Autowired
	private View jsonView;
	
	//JTBC  - 속보 - RSS
	@RequestMapping("/jtbc_News1.do")
	public View jtbcNews (Model model){
		
		List<JTBC_News_DTO> dto_list = new ArrayList<JTBC_News_DTO>();
		try{
			SAXBuilder builder = new SAXBuilder(); 
			Document jdomdoc = builder.build(new java.net.URL("http://fs.jtbc.joins.com/RSS/newsflash.xml"));
			
			Element root= jdomdoc.getRootElement();
	 		Element peresons_E1 =root.getChild("channel");
	 	
	 		List<Element> list=peresons_E1.getChildren("item");
	 		
	 		for(int i=0;i<list.size(); i++){
	 			Element person_E=list.get(i);
	 			JTBC_News_DTO dto = new JTBC_News_DTO(person_E.getChild("title").getValue(), person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
	 			dto_list.add(dto);
	 		}
	 		}catch(Exception e){
			   e.printStackTrace();
		   }
	    
	    model.addAttribute("jtbc", dto_list);
	    return jsonView;
	}
	
	//Jtbc 정치 
	@RequestMapping("/Jtbc_Jung.do")
	public View jtbc_Jung (Model model){
		   
		List<JTBC_News_DTO> dto_list = new ArrayList<JTBC_News_DTO>();
		
		   try{
			
			SAXBuilder builder = new SAXBuilder(); 
			
			Document jdomdoc = builder.build(new java.net.URL("http://fs.jtbc.joins.com/RSS/politics.xml"));
			
			Element root= jdomdoc.getRootElement();
	 		Element peresons_E1 =root.getChild("channel");
	 	
	 		List<Element> list=peresons_E1.getChildren("item");
	 		
	 		for(int i=0;i<list.size(); i++){
	 			Element person_E=list.get(i);
	 			JTBC_News_DTO dto = new JTBC_News_DTO(person_E.getChild("title").getValue(), person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
	 			dto_list.add(dto);
	 		}
	 		}catch(Exception e){
			   e.printStackTrace();
		   }
	    
	    model.addAttribute("jtbc_jung", dto_list);
	    return jsonView;
	}

	//Jtbc 경제 부분
	@RequestMapping("/Jtbc_Gyung.do")
	public View jtbc_Gyung (Model model){	
		   
		List<JTBC_News_DTO> dto_list = new ArrayList<JTBC_News_DTO>();
		
		   try{
			
			SAXBuilder builder = new SAXBuilder(); 
			//url에 xml이 있는경우
			Document jdomdoc = builder.build(new java.net.URL("http://fs.jtbc.joins.com/RSS/economy.xml"));
			
			
			Element root= jdomdoc.getRootElement();
	 		Element peresons_E1 =root.getChild("channel");
	 	
	 		List<Element> list=peresons_E1.getChildren("item");
	 		
	 		for(int i=0;i<list.size(); i++){
	 			Element person_E=list.get(i);
	 			JTBC_News_DTO dto = new JTBC_News_DTO(person_E.getChild("title").getValue(), person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
	 			dto_list.add(dto);
	 		}
	 		}catch(Exception e){
			   e.printStackTrace();
		   }
		   model.addAttribute("jtbc_Gyung",dto_list);
		   return jsonView;
	}
	
	
	//Jtbc 사회 부분
	@RequestMapping("/Jtbc_Society.do")
	public View jtbc_Society(Model model){	
		   
		List<JTBC_News_DTO> dto_list = new ArrayList<JTBC_News_DTO>();
		
		   try{
			
			SAXBuilder builder = new SAXBuilder(); 
			//url에 xml이 있는경우
			Document jdomdoc = builder.build(new java.net.URL("http://fs.jtbc.joins.com/RSS/society.xml"));
			
			
			Element root= jdomdoc.getRootElement();
	 		Element peresons_E1 =root.getChild("channel");
	 	
	 		List<Element> list=peresons_E1.getChildren("item");
	 		
	 		for(int i=0;i<list.size(); i++){
	 			Element person_E=list.get(i);
	 			JTBC_News_DTO dto = new JTBC_News_DTO(person_E.getChild("title").getValue(), person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
	 			dto_list.add(dto);
	 		}
	 		}catch(Exception e){
			   e.printStackTrace();
		   }
		   model.addAttribute("jtbc_society",dto_list);
		   return jsonView;
	}
		
		
	//Jtbc 연예 부분
	@RequestMapping("/Jtbc_Love.do")
	public View jtbc_Love(Model model){	
		   
		List<JTBC_News_DTO> dto_list = new ArrayList<JTBC_News_DTO>();
		
		   try{
			
			SAXBuilder builder = new SAXBuilder(); 
			//url에 xml이 있는경우
			Document jdomdoc = builder.build(new java.net.URL("http://fs.jtbc.joins.com/RSS/entertainment.xml"));
			
			
			Element root= jdomdoc.getRootElement();
	 		Element peresons_E1 =root.getChild("channel");
	 	
	 		List<Element> list=peresons_E1.getChildren("item");
	 		
	 		for(int i=0;i<list.size(); i++){
	 			Element person_E=list.get(i);
	 			JTBC_News_DTO dto = new JTBC_News_DTO(person_E.getChild("title").getValue(), person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
	 			dto_list.add(dto);
	 		}
	 		}catch(Exception e){
			   e.printStackTrace();
		   }
		   model.addAttribute("jtbc_entertainment",dto_list);
		   return jsonView;
	}
		
	//Jtbc 스포츠 부분
	@RequestMapping("/Jtbc_Sports.do")
	public View jtbc_Sports(Model model){	
		   
		List<JTBC_News_DTO> dto_list = new ArrayList<JTBC_News_DTO>();
		   try{
			SAXBuilder builder = new SAXBuilder(); 
			//url에 xml이 있는경우
			Document jdomdoc = builder.build(new java.net.URL("http://fs.jtbc.joins.com/RSS/sports.xml"));
			
			
			Element root= jdomdoc.getRootElement();
	 		Element peresons_E1 =root.getChild("channel");
	 	
	 		List<Element> list=peresons_E1.getChildren("item");
	 		
	 		for(int i=0;i<list.size(); i++){
	 			Element person_E=list.get(i);
	 			JTBC_News_DTO dto = new JTBC_News_DTO(person_E.getChild("title").getValue(), person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
	 			dto_list.add(dto);
	 		}
	 		}catch(Exception e){
			   e.printStackTrace();
		   }
		   model.addAttribute("jtbc_sports",dto_list);
		   return jsonView;
	}	
}
