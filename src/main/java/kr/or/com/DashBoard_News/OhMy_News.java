package kr.or.com.DashBoard_News;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
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

import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;

@Controller
public class OhMy_News {

	@Autowired
	private View jsonView;
	
	//오마이 뉴스  - 속보 부분
	@RequestMapping("/CommunityNews_2.do")
	public View News2(Model model){
		
		List<OhMy_News_DTO> dto_list = new ArrayList<OhMy_News_DTO>();

		try{
			SAXBuilder builder = new SAXBuilder(); 
			Document jdomdoc = builder.build(new java.net.URL("http://rss.ohmynews.com/rss/top.xml"));
			
			Element root= jdomdoc.getRootElement();
	 		Element peresons_E1 =root.getChild("channel");
	 	
	 		List<Element> list=peresons_E1.getChildren("item");
	 		
	 		for(int i=0;i<list.size(); i++){
	 			Element person_E=list.get(i);
	 			OhMy_News_DTO dto = new OhMy_News_DTO(person_E.getChild("title").getValue().replaceAll("&lt(;)?(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?&gt(;)?", ""), person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
	 			dto_list.add(dto);
	 		}
	 		}catch(Exception e){
			   e.printStackTrace();
		   }

        model.addAttribute("joinsmsn", dto_list);
        return jsonView;
	}
	
	//오마이 뉴스 - 정치 부분
	@RequestMapping("/JungChi.do")  
	public View JungChi(Model model){
		List<OhMy_News_DTO> dto_list = new ArrayList<OhMy_News_DTO>();

		try{
			SAXBuilder builder = new SAXBuilder(); 
			Document jdomdoc = builder.build(new java.net.URL("http://rss.ohmynews.com/rss/politics.xml"));
			
			Element root= jdomdoc.getRootElement();
	 		Element peresons_E1 =root.getChild("channel");
	 	
	 		List<Element> list=peresons_E1.getChildren("item");
	 		
	 		for(int i=0;i<list.size(); i++){
	 			Element person_E=list.get(i);
	 			OhMy_News_DTO dto = new OhMy_News_DTO(person_E.getChild("title").getValue().replaceAll("&lt(;)?(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?&gt(;)?", ""), person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
	 			dto_list.add(dto);
	 		}
	 		}catch(Exception e){
			   e.printStackTrace();
		   }
		
        model.addAttribute("ohmy_Jung", dto_list);
        return jsonView;
	}
	
	//오마이 뉴스 - 경제
	@RequestMapping("/GyungJae.do")
	public View GyungJae(Model model){
		
		List<OhMy_News_DTO> dto_list = new ArrayList<OhMy_News_DTO>();

		try{
			SAXBuilder builder = new SAXBuilder(); 
			Document jdomdoc = builder.build(new java.net.URL("http://rss.ohmynews.com/rss/economy.xml"));
			
			Element root= jdomdoc.getRootElement();
	 		Element peresons_E1 =root.getChild("channel");
	 	
	 		List<Element> list=peresons_E1.getChildren("item");
	 		
	 		for(int i=0;i<list.size(); i++){
	 			Element person_E=list.get(i);
	 			OhMy_News_DTO dto = new OhMy_News_DTO(person_E.getChild("title").getValue().replaceAll("&lt(;)?(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?&gt(;)?", ""), person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
	 			dto_list.add(dto);
	 		}
	 		}catch(Exception e){
			   e.printStackTrace();
		   }

        model.addAttribute("ohmy_Gyung", dto_list);
        return jsonView;
	}
	
	//오마이 뉴스 - 사회
	@RequestMapping("/ohMy_Sa.do")
	public View society(Model model){
		List<OhMy_News_DTO> dto_list = new ArrayList<OhMy_News_DTO>();

		try{
			SAXBuilder builder = new SAXBuilder(); 
			Document jdomdoc = builder.build(new java.net.URL("http://rss.ohmynews.com/rss/society.xml"));
			
			Element root= jdomdoc.getRootElement();
	 		Element peresons_E1 =root.getChild("channel");
	 	
	 		List<Element> list=peresons_E1.getChildren("item");
	 		
	 		for(int i=0;i<list.size(); i++){
	 			Element person_E=list.get(i);
	 			OhMy_News_DTO dto = new OhMy_News_DTO(person_E.getChild("title").getValue().replaceAll("&lt(;)?(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?&gt(;)?", ""), person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
	 			dto_list.add(dto);
	 		}
	 		}catch(Exception e){
			   e.printStackTrace();
		   }

        model.addAttribute("ohmy_Sa", dto_list);
        return jsonView;
	}
	
	//오마이 뉴스 연애 부분
	@RequestMapping("/ohMy_Love.do")
	public View love(Model model){
		List<OhMy_News_DTO> dto_list = new ArrayList<OhMy_News_DTO>();

		try{
			SAXBuilder builder = new SAXBuilder(); 
			Document jdomdoc = builder.build(new java.net.URL("http://rss.ohmynews.com/rss/media.xml"));
			
			Element root= jdomdoc.getRootElement();
	 		Element peresons_E1 =root.getChild("channel");
	 	
	 		List<Element> list=peresons_E1.getChildren("item");
	 		
	 		for(int i=0;i<list.size(); i++){
	 			Element person_E=list.get(i);
	 			OhMy_News_DTO dto = new OhMy_News_DTO(person_E.getChild("title").getValue().replaceAll("&lt(;)?(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?&gt(;)?", ""), person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
	 			dto_list.add(dto);
	 		}
	 		}catch(Exception e){
			   e.printStackTrace();
		   }

        model.addAttribute("ohmy_Love", dto_list);
        return jsonView;
	}
	
	
	@RequestMapping("/ohMy_Sports.do")
	public View Sports(Model model){
		List<OhMy_News_DTO> dto_list = new ArrayList<OhMy_News_DTO>();

		try{
			SAXBuilder builder = new SAXBuilder(); 
			Document jdomdoc = builder.build(new java.net.URL("http://rss.ohmynews.com/rss/sports.xml"));
			
			Element root= jdomdoc.getRootElement();
	 		Element peresons_E1 =root.getChild("channel");
	 	
	 		List<Element> list=peresons_E1.getChildren("item");
	 		
	 		for(int i=0;i<list.size(); i++){
	 			Element person_E=list.get(i);
	 			OhMy_News_DTO dto = new OhMy_News_DTO(person_E.getChild("title").getValue().replaceAll("&lt(;)?(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?&gt(;)?", ""), person_E.getChild("link").getValue(), person_E.getChild("pubDate").getValue());
	 			dto_list.add(dto);
	 		}
	 		}catch(Exception e){
			   e.printStackTrace();
		   }

        model.addAttribute("ohmy_Sports", dto_list);
        return jsonView;
	}	
}
