package kr.or.com.statute;

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
public class StatuteController {

	@Autowired
	private View jsonview;
	
	@RequestMapping("/statute.do")
	public String statute(){
		System.out.println("법률");
		return "statute.statute";
	}
	
	//최근 통과의안 목록
	@RequestMapping("/statuteList.do")
	public View statuteList(Model model){
	    List<statuteDTO> dto_list = new ArrayList<statuteDTO>();
        try{ 
        SAXBuilder builder = new SAXBuilder(); 
        //url에 xml이 있는경우
        Document jdomdoc = builder.build(new java.net.URL("http://apis.data.go.kr/9710000/BillInfoService/getRecentPasageList?numOfRows=15&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D"));
        
        //response 
        Element root= jdomdoc.getRootElement();
        System.out.println("처음 : "+root.getName());
        
        Element second =root.getChild("body");
        System.out.println("두번째 : "+second.getName());
        Element third = second.getChild("items");
        
        List<Element> items =	third.getChildren("item");
        System.out.println("세번째 : "+items.size() + " /  제발 ? : "+items.toString());
        
   
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
	
	//최근 접수의안 목록
	@RequestMapping("/getRecentRceptList.do")
	public View getRecentRceptList(Model model) throws Exception{
		List<statuteDTO> dto_list = new ArrayList<statuteDTO>();
        try{ 
        SAXBuilder builder = new SAXBuilder(); 
        //url에 xml이 있는경우
        Document jdomdoc = builder.build(new java.net.URL("http://apis.data.go.kr/9710000/BillInfoService/getRecentRceptList?numOfRows=15&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D"));
        
        //response 
        Element root= jdomdoc.getRootElement();
        
        Element second =root.getChild("body");
      
        Element third = second.getChild("items");
        
        List<Element> items =	third.getChildren("item");
        
   
        for(int i=0;i<items.size(); i++){
            Element person_E=items.get(i);
            String committeeName=null;
            if(person_E.getChild("proposerKind")==null){
            	committeeName= " ";
            }else{
            	committeeName=person_E.getChild("proposerKind").getValue();
            }
            statuteDTO dto = new statuteDTO();
            dto.setProposeDt(person_E.getChild("proposeDt").getValue()); 
            dto.setBillName(person_E.getChild("billName").getValue());
            dto.setCommitteeName(person_E.getChild("proposerKind").getValue());
            dto.setBillId(person_E.getChild("billId").getValue());
            dto_list.add(dto);
        }
         
        }catch(Exception e){
            e.printStackTrace();
         }
        System.out.println(" 마지막 =============: "+dto_list.toString());
		model.addAttribute("statutelist", dto_list);
		
		return jsonview;
	}


//처리의안 목록
@RequestMapping("/getJsictionComiteProcessList.do")
public View getJsictionComiteProcessList(Model model){
	
	List<statuteDTO> dto_list = new ArrayList<statuteDTO>();
    try{ 
    SAXBuilder builder = new SAXBuilder(); 
    //url에 xml이 있는경우
    Document jdomdoc = builder.build(new java.net.URL("http://apis.data.go.kr/9710000/BillInfoService/getJsictionComiteProcessList?numOfRows=15&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D"));
    
    //response 
    Element root= jdomdoc.getRootElement();
  
    Element second =root.getChild("body");
   
    Element third = second.getChild("items");
    
    List<Element> items =	third.getChildren("item");
 
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

//계류의안 목록
@RequestMapping("/getRecentMoorList.do")
public View getRecentMoorList(Model model){
	
List<statuteDTO> dto_list = new ArrayList<statuteDTO>();
  try{ 
  SAXBuilder builder = new SAXBuilder(); 
  //url에 xml이 있는경우
  Document jdomdoc = builder.build(new java.net.URL("http://apis.data.go.kr/9710000/BillInfoService/getRecentMoorList?numOfRows=15&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D"));
  
  //response 
  Element root= jdomdoc.getRootElement();

  Element second =root.getChild("body");
 
  Element third = second.getChild("items");
  
  List<Element> items =	third.getChildren("item");

  for(int i=0;i<items.size(); i++){
  	 Element person_E=items.get(i);
  	 String committeeName="";
  	
       if(person_E.getChild("committeeName")==null){
       	committeeName= "";
       }else{
       	committeeName=person_E.getChild("committeeName").getValue();
       }
      //System.out.println("첫번쨰 : "+person_E.getChild("proposedt").getValue() + " 두번째 : "+person_E.getChild("billname").getValue());  
      statuteDTO dto = new statuteDTO(person_E.getChild("proposedt").getValue(), person_E.getChild("billname").getValue(), committeeName, person_E.getChild("billid").getValue());
      dto_list.add(dto);
  }
   
  }catch(Exception e){
      e.printStackTrace();
   }
 
	model.addAttribute("statutelist", dto_list);
	return jsonview;
}

  //의안 상세 페이지
 @RequestMapping("/detailStatues.do")
 public String detailStatues(String billId, String billName, Model model){
	 System.out.println(" billId---------------: "+billId+"?????????????billNamd: "+billName);
     String url="http://likms.assembly.go.kr/bill/billDetail.do?billId="+billId;
     System.out.println("URL 확인합시다 : "+url);
	 model.addAttribute("statutelist", url);
	 
	 return "statute.statuteDetail";
 }
 
}