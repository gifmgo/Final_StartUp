package kr.or.com.Parliament;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.jsoup.Jsoup;
import org.jsoup.parser.Parser;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.com.FreeBoard.CommentDTO;
import kr.or.com.Paliament_DTO.AllConInfo_DTO;
import kr.or.com.Paliament_DTO.PaliamentList_DTO;
import kr.or.com.Paliament_DTO.PaliamentStatue_DTO;
import kr.or.com.Paliament_DTO.PaliamentTalk_DTO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.xml.XMLSerializer;
/*
 * 작성일 : 2016-12-29
 * 작성자 : 박성준
 * 목  적 : 국회의원 관련 컨트롤러
 */
@Controller
public class PaliamentController {

   @Autowired
   private View jsonView;
   @Autowired
   private PaliamentService service;
   
   //국회의원 헤더부분 클릭시 이동하는 페이지
   @RequestMapping("/Member_Parliament.do")
   public String Parliament_List(Model model){
     return "parliament_List.ParliamentList";
   }
   
   //말말말!!  >> View 페이지 보여줌
   @RequestMapping(value="/paliament_talk_Write.do", method=RequestMethod.GET)
   public String paliament_talk_Write(String name, String num, String dept_cd, String img, Model model){
      model.addAttribute("name", name);
      model.addAttribute("num", num);
      model.addAttribute("dept_cd", dept_cd);
      model.addAttribute("img", img);
      return "parliament_Detail.Parliament_Talk";
   }
   
   //말말말 !! >> 게시판 제목 클릭시 >> 상세보기 페이지 이동
   @RequestMapping("/Paliament_Talk_Detail.do")
   public String Paliament_Talk_Detail(String seq, String num, String dept_cd, String img, String name, Model model){
      
      PaliamentTalk_DTO dto = service.talk_Detail(seq);
      List<CommentDTO> list = service.commentList(seq);
      List<CommentDTO> comment = service.commSelect(seq);
      
      model.addAttribute("list", list);
      model.addAttribute("comment", comment);
      model.addAttribute("dept_cd", dept_cd);
      model.addAttribute("img", img);
      model.addAttribute("detail", dto);
      return "parliament_Detail.Parliament_Talk_Detail";
   }
   
   
   //말말말 !! >> View 데이터 입력 db 작업 실행하는 부분 (쓰기)
   @RequestMapping(value="/paliament_talk_Write.do", method=RequestMethod.POST)
   public String paliament_talk_Write_Post(/*@RequestParam("uploadfile") MultipartFile file,*/ HttpServletRequest request, PaliamentTalk_DTO dto, String logId, String dept_cd, String img, String cate_name, Model model){
      
     /*//파일 업로드 
	  try {
		  String path = request.getRealPath("/upload");
		  File cFile = new File(path, file.getOriginalFilename());
		  file.transferTo(cFile);
	  } catch (IllegalStateException e1) {
	     e1.printStackTrace();
	  } catch (IOException e1) {
	     e1.printStackTrace();
	  }*/

	  dto.setId(logId);
	  dto.setCatego(cate_name);
	  dto.setContent(request.getParameter("ckeditor"));
      int result = service.talk_Write(dto);
      
      model.addAttribute("num",dto.getNum());
      model.addAttribute("dept_cd",dept_cd);
      model.addAttribute("img",img);
      model.addAttribute("name",cate_name);
      
      if(result > 0){
         model.addAttribute("result","성공");
         return "parliament_Detail.Parliament_WriteResult";
      }
      
      return "redirect:paliament_talk_Write.do";
   }
   
   //
   
   //파일 다운로드
   //파일 다운
      @RequestMapping("/paliament_talk_fileDown.do")
      public void download(String name, HttpServletResponse response, HttpServletRequest request)
            throws Exception {
         //파일 업로드 
         @SuppressWarnings("deprecation")
		String path = request.getRealPath("/upload");
         File f = new File(path + "/"+name);
         String fname = new String(name.getBytes("utf-8"), "8859_1");

         response.setHeader("Content-Disposition", "attachment;filename=" + fname + ";");
         FileInputStream fin = new FileInputStream(f);
         // 출력 도구 얻기 :response.getOutputStream()
         ServletOutputStream sout = response.getOutputStream();
         byte[] buf = new byte[1024]; // 전체를 다읽지 않고 1204byte씩 읽어서
         int size = 0;
         while ((size = fin.read(buf, 0, buf.length)) != -1) // buffer 에 1024byte
         // 담고
         { // 마지막 남아있는 byte 담고 그다음 없으면 탈출
            sout.write(buf, 0, size); // 1kbyte씩 출력
         }
         fin.close();
         sout.close();
      }
   
   
   //국회의원 말, 말, 말 글 수정 하는 부분
   @RequestMapping("/paliamentTalk_modifyDetail.do")
   public View paliamentTalk_modifyDetail(String seq, String id, Model model){
      
      PaliamentTalk_DTO dto = service.ModifyTalk(seq, id);
      
      if(dto.getPaliament_talk_seq() > 0){
         model.addAttribute("result", "성공");
         model.addAttribute("dto", dto);
      }else{
         model.addAttribute("result", "올바르지 못한 접근 입니다.");
      }
      return jsonView;
   }
   
   //국회의원 말, 말, 말  > 직접적인 글 수정 하는 뷰
   @RequestMapping(value="/modifyTalk_WriteModify.do", method=RequestMethod.GET)
   public String modifyTalk_WriteModify(String seq, String dept_cd, String name, String num, String img, String obj, Model model){
      
      JSONObject json = (JSONObject) JSONSerializer.toJSON(obj);
      JSONObject json2 = (JSONObject) json.get("dto");
      
      String title = (String) json2.get("title");
      String content = (String)json2.get("content");
      //디비에서 읽어온 title , content
      model.addAttribute("title", title);
      model.addAttribute("content", content);
      
      model.addAttribute("seq", seq);
      model.addAttribute("dept_cd", dept_cd);
      model.addAttribute("name", name);
      model.addAttribute("num", num);
      model.addAttribute("img", img);
      return "parliament_Detail.Parliament_ModifyWrite";
   }
   
   //국회의원 말, 말, 말  > 직접적인 글 수정 하는 뷰 >> POST > SERVICE 실행 후 > DB 작업 진행
   @RequestMapping(value="/modifyTalk_WriteModify.do", method=RequestMethod.POST)
   public String modifyTalk_WriteModify_Post(String title, String content, String seq, String img,String num, String dept_cd, String cate_name, Model model){
      
      List<String> splitList = new ArrayList<String>();
      String[] array = num.split(",");
         splitList.add(array[0]);
         array = new String[4];
           array = dept_cd.split(",");
           splitList.add(array[0]);   
           array = new String[4];
           array = img.split(",");
           splitList.add(array[0]);
          
           array = new String[2];
           array = seq.split(",");
           splitList.add(array[0]);
           splitList.add(cate_name);
           splitList.add(title);
           splitList.add(content);
           
           int result = service.modifyTalk_WriteService(splitList);
           String msg = "";
           
           if(result == 1){
              msg = "성공";
              String link = "PaliamentDetail.do?num="+num+"&dept_cd="+dept_cd+"&img="+img+"&name="+cate_name;
              model.addAttribute("msg", msg);
              model.addAttribute("link", link);
              
              //String num, String dept_cd, String img, String name ///// PaliamentDetail.do
              return "parliament_Detail.Paliament_modifyResult"; 
           }
           System.out.println("수정 컨트롤러 결과 : "+result);
           
      return null;
   }
   
   
   //말말말 삭제
  	@RequestMapping("paliamenTalk_Remove.do")
  	public View paliamenTalk_Remove(String seq, Model model, HttpServletRequest request){
  		
  		int result = service.removeTalk(seq);
  		
 	    model.addAttribute("result", result);
  		return jsonView;
  	}
   
   //게시판 코멘트 부분
   	/*//코멘트 쓰기
 	@RequestMapping("paliamentCommentWrite.do")
 	public View paliamentCommentWrite(CommentDTO cdto, String coNo, String name, String img,String num, String dept_cd, Model model, HttpServletRequest request){
 		
 		HttpSession session = request.getSession();
 		String logId = (String)session.getAttribute("id");
 		cdto.setId(logId);
 		
 		if(logId == null || logId.equals("")){
 			model.addAttribute("result", 0);
 			return jsonView;
 		} //임시
 		
 		if(cdto.getDepth()==1){
 			cdto.setGrpno(Integer.parseInt(coNo));
 		}else if(cdto.getDepth()==0){ //return을 안 하기 위해
 		}else{
 			model.addAttribute("result", 0);
 			return jsonView;
 		}
 		
 		int result = service.writeComment(cdto);
 		
 		model.addAttribute("seq", cdto.getNo());
	    model.addAttribute("dept_cd", dept_cd);
	    model.addAttribute("name", name);
	    model.addAttribute("num", num);
	    model.addAttribute("img", img);
 		model.addAttribute("result", result);
 		return jsonView;
 	}
 	
 	//코멘트 삭제
 	@RequestMapping("paliamentRemoveComment.do")
 	public View paliamentRemoveComment(CommentDTO dto, String name, String img,String num, String dept_cd, Model model, HttpServletRequest request){
 		
 		int result = service.removeComment(dto.getCo_no(), dto.getDepth());
 		
 		model.addAttribute("seq", dto.getNo());
 		model.addAttribute("dept_cd", dept_cd);
	    model.addAttribute("name", name);
	    model.addAttribute("num", num);
	    model.addAttribute("img", img);
	    model.addAttribute("result", result);
 		return jsonView;
 	}
 	
 	//코멘트 수정
 	@RequestMapping("paliamentmodifyComment.do")
 	public View paliamentmodifyComment(CommentDTO dto, String name, String img,String num, String dept_cd, Model model, HttpServletRequest request){
 		int result = service.modifyComment(dto);
 		
 		model.addAttribute("seq", dto.getNo());
 		model.addAttribute("dept_cd", dept_cd);
	    model.addAttribute("name", name);
	    model.addAttribute("num", num);
	    model.addAttribute("img", img);
 		model.addAttribute("result", result);
 		return jsonView;
 	}*/
 	
 	//의원 댓글로 바꾸기
 	//코멘트 쓰기
 	@RequestMapping("paliamentCommentWrite.do")
 	public View paliamentCommentWrite(CommentDTO cdto, String coNo, String name, String img,String num, String dept_cd, Model model, HttpServletRequest request){
 		
 		HttpSession session = request.getSession();
 		String logId = (String)session.getAttribute("id");
 		cdto.setId(logId);
 		
 		if(logId == null || logId.equals("")){
 			model.addAttribute("result", 0);
 			return jsonView;
 		} //임시
 		
 		if(cdto.getDepth()==1){
 			cdto.setGrpno(Integer.parseInt(coNo));
 		}else if(cdto.getDepth()==0){ //return을 안 하기 위해
 		}else{
 			model.addAttribute("result", 0);
 			return jsonView;
 		}
 		
 		int result = service.writeComment(cdto);
 		
 		model.addAttribute("seq", cdto.getNo());
	    model.addAttribute("dept_cd", dept_cd);
	    model.addAttribute("name", name);
	    model.addAttribute("num", num);
	    model.addAttribute("img", img);
 		model.addAttribute("result", result);
 		return jsonView;
 	}
 	
 	//코멘트 삭제
 	@RequestMapping("paliamentRemoveComment.do")
 	public View paliamentRemoveComment(CommentDTO dto, String name, String img,String num, String dept_cd, Model model, HttpServletRequest request){
 		
 		int result = service.removeComment(dto.getCo_no(), dto.getDepth());
 		
 		model.addAttribute("seq", dto.getNo());
 		model.addAttribute("dept_cd", dept_cd);
	    model.addAttribute("name", name);
	    model.addAttribute("num", num);
	    model.addAttribute("img", img);
	    model.addAttribute("result", result);
 		return jsonView;
 	}
 	
 	//코멘트 수정
 	@RequestMapping("paliamentmodifyComment.do")
 	public View paliamentmodifyComment(CommentDTO dto, String name, String img,String num, String dept_cd, Model model, HttpServletRequest request){
 		int result = service.modifyComment(dto);
 		
 		model.addAttribute("seq", dto.getNo());
 		model.addAttribute("dept_cd", dept_cd);
	    model.addAttribute("name", name);
	    model.addAttribute("num", num);
	    model.addAttribute("img", img);
 		model.addAttribute("result", result);
 		return jsonView;
 	}
   
   
   
   
   //국회의원 리스트 뿌려주는 부분
   @RequestMapping("/ListPaliament.do")
   public View paliamentList(Model model){
      System.out.println("컨트롤러 리스트 호출합니다.");
      List<PaliamentList_DTO> list = service.selectPaliamentList();
      model.addAttribute("xml", list);
      return jsonView;
   }
   
   //국회의원 전체 리스트 뿌려주는 컨트롤러 >> 스케쥴러에서 써야함....
/*  @RequestMapping("/XmlParse.do")
   public View xmlParse(Model model) throws Exception{

      System.out.println("확인좀");
      List<PaliamentList_DTO> data = new ArrayList<PaliamentList_DTO>();
      
      String html = "http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberCurrStateList?numOfRows=300&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D";
      org.jsoup.nodes.Document doc = Jsoup.connect(html).parser(Parser.xmlParser()).timeout(50000).get();
      Elements elements = doc.select("item");
       
       int count = 0;
       for(org.jsoup.nodes.Element e : elements){
          PaliamentList_DTO dto = 
                new PaliamentList_DTO(e.select("deptCd").text(), e.select("num").text(), 
                                   e.select("jpgLink").text(), e.select("empNm").text(), 
                                   e.select("origNm").text(), e.select("reeleGbnNm").text());
          data.add(dto);
          count++;
       }
      
      data = JungDang(data);
      service.paliamentDB(data);
      model.addAttribute("xml", data);
      return jsonView;
   }
   
   public List<PaliamentList_DTO> JungDang(List<PaliamentList_DTO> data) throws Exception {

      System.out.println("함수 data 싸이즈 : " + data.size());
      for (int i = 0; i < data.size(); i++) {

         String dept_cd = data.get(i).getDeptCd();
         String num = data.get(i).getNum2();

         String html = "http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberDetailInfoList?dept_cd="
               + dept_cd + "&num=" + num
               + "&numOfRows=300&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D";
         org.jsoup.nodes.Document doc = Jsoup.connect(html).parser(Parser.xmlParser()).timeout(50000).get();
         Elements elements = doc.select("item");
         String polyNm = "";
         String shrtNm = "";
         String memTitle = "";  //학력
         String assemEmail = "";
         String assemHomep = "";
         String assemTel = "";
         for (org.jsoup.nodes.Element element : elements) {
            polyNm = element.select("polyNm").text();
            shrtNm = element.select("shrtNm").text();
            memTitle = element.select("memTitle").text();
            assemEmail = element.select("assemEmail").text();
            assemHomep = element.select("assemHomep").text();
            assemTel = element.select("assemTel").text();
         }

         System.out.println("뽑아온 정보 polyNm : " + polyNm + " /  shrtNm : " + shrtNm);
         data.get(i).setPolyNm(polyNm);
         data.get(i).setShrtNm(shrtNm);
         data.get(i).setMemTitle(memTitle);

         data.get(i).setAssemEmail(assemEmail);
         data.get(i).setAssemHomep(assemHomep);
         data.get(i).setAssemTel(assemTel);
      }
      return data;
   }
   */
   
   
   //정당 뽑을라고 이거함. ..
   @RequestMapping("/PaliamentJungDang.do")
   public View xmlPlusJung(String num, String dept_cd, Model model)throws Exception{
      
      String html = "http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberDetailInfoList?dept_cd="+dept_cd+"&num="+num+"&numOfRows=300&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D";
      org.jsoup.nodes.Document doc = Jsoup.connect(html).parser(Parser.xmlParser()).timeout(30000).get();
      Elements elements = doc.select("polyNm");
      model.addAttribute("jungDang", elements.text());
      return jsonView;
   }
   
   //국회의원 상세보기 - 기본  페이지
   @RequestMapping("/PaliamentDetail.do")
   public String detail(String num, String dept_cd, String img, String name, Model model){
      
      System.out.println("%%%%%%%%%%%%%%%%%%%%%%5$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 확인좀 : "+num+" /// dept : "+dept_cd  + " / img : "+img + " / 이름 : "+name);
      List<PaliamentTalk_DTO> list;

      if(num.contains(",")){
         System.out.println("상세보기 if 탑니다.");
         String[] array = num.split(",");
         num = array[0];
         
         System.out.println("%%%%%%%%% 확인좀 : "+num+" /// dept : "+dept_cd  + " / img : "+img + " / 이름 : "+name);

          List<String> splitList = new ArrayList<String>();
          String[] array2 = num.split(",");
         splitList.add(array2[0]);
         array2 = new String[4];
           array2 = dept_cd.split(",");
           splitList.add(array2[0]);   
           array2 = new String[4];
           array2 = img.split(",");
           splitList.add(array2[0]);
              
         List<CommentDTO> comment = service.commSelect(splitList.get(0));
         model.addAttribute("comment", comment);
        
         /* 글 리스트 뿌려주기
          * list = service.talkToMe(num); 
         if(list.size() == 0){
            list = null;
         }
         model.addAttribute("list", list);*/
         
         model.addAttribute("num", splitList.get(0));
         model.addAttribute("dept_cd", splitList.get(1));
         model.addAttribute("img", splitList.get(2));
         model.addAttribute("tid", "1");   
         
         
      }else{
    	  
    	  System.out.println("else num: "+ num);
    	  List<CommentDTO> comment = service.commSelect(num);
          model.addAttribute("comment", comment);
    	  /*list=service.talkToMe(num);
          if(list.size() == 0){
	          list = null;
	      }
          model.addAttribute("list", list);*/
          
          model.addAttribute("num", num);
          model.addAttribute("dept_cd", dept_cd);
          model.addAttribute("img", img);
          model.addAttribute("tid", "1");
      }
      return "parliament_Detail.ParliamentDetail";
   }
   
   
   //국회의원 상세보기
   @RequestMapping("/PaliamentDetailView.do")
   public View detailPaliment(String num, String dept_cd, String img, Model model) throws Exception{
      
      URL url = new URL("http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberDetailInfoList?dept_cd="+dept_cd+"&num="+num+"&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D");
        URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체
        BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
        
        String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
        
        JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString());
        
        model.addAttribute("detailImg", img);
        model.addAttribute("detail", obj);
      return jsonView;
   }
   
   //국회의원 상세보기에서 - > 발의한 법안 보기
   @RequestMapping("/paliamentStatue.do")
   public View paliamentStatue(String name, String dasu, Model model){
      
      List<PaliamentStatue_DTO> dto_list = new ArrayList<PaliamentStatue_DTO>();
      try{
         
         SAXBuilder builder = new SAXBuilder();
         Document jdomdoc = builder.build(new java.net.URL("http://apis.data.go.kr/9710000/BillInfoService/getMotionLawList?start_ord="+dasu+"&end_ord="+dasu+"&mem_name="+URLEncoder.encode(name, "UTF-8")+"&mem_name_check=G01&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D"));
         Element root= jdomdoc.getRootElement();
           //System.out.println("처음 : "+root.getName());
           Element second =root.getChild("body");
           //System.out.println("두번째 : "+second.getName());
           Element third = second.getChild("items");
           List<Element> items = third.getChildren("item");
         
          for(int i=0;i<items.size(); i++){
             Element person_E=items.get(i);
             PaliamentStatue_DTO dto = new PaliamentStatue_DTO(person_E.getChild("billId").getValue(), person_E.getChild("billName").getValue(), person_E.getChild("proposeDt").getValue(), person_E.getChild("procStageCd").getValue());
             dto_list.add(dto);
          }
          
          }catch(Exception e){
            e.printStackTrace();
         }
      
      model.addAttribute("result", dto_list);
      return jsonView;
   }
   
   
   //첫번째 - > 내가 속한 위원회와 , 상임위원회 전체에서  비교
   @RequestMapping(value="/paliamentSang.do", method=RequestMethod.GET)
   public View paliamentSang(String resultarray, String dasu, String name, Model model){

      //상임 위원회  담겨있는 list.
      List<String> list = JSONArray.fromObject(resultarray);
      
      String total = service.sangInTotal(dasu);
      
      //회의 정보 담을 리스트
        List<AllConInfo_DTO> con_list = new ArrayList<AllConInfo_DTO>();
      
      try{
         
         SAXBuilder builder = new SAXBuilder();
         //회의 리스트 xml 뽑아옴
         Document jdomdoc = builder.build(new java.net.URL("http://apis.data.go.kr/9710000/ProceedingInfoService/getAllConInfoList?class_code=2&dae_num=20&numOfRows="+total+"&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D"));
         
         Element root= jdomdoc.getRootElement();
           //System.out.println("처음 : "+root.getName());
           
           Element second =root.getChild("body");
           //System.out.println("두번째 : "+second.getName());
           Element third = second.getChild("items");
           List<Element> items = third.getChildren("item");
         
           
           
           //여기서 해야 할 것은 ?? 
           if(list.size() <= 1){
              String onlyOne = list.get(0);
              System.out.println("items 싸이즈는요 ?? "+items.size());
              
              for(int i=0; i < items.size(); i++){
                 
                 Element bill_name=items.get(i);
                 
                 if(bill_name.getChild("commName").getValue().equals(onlyOne)){
                    //회의 번호
                    String conferNum = bill_name.getChild("conferNum").getValue();
                    String join = "결석";
                    String check = second_Conf(conferNum, name);
                    if(check.equals("1")){
                       join = "출석";
                    }
                    //회의번호 확인
                    String commName = bill_name.getChild("commName").getValue();
                    String meeting1 = bill_name.getChild("meeting1").getValue();
                    String meeting2 = bill_name.getChild("meeting2").getValue();
                    String summary = bill_name.getChild("summary").getValue();
                    AllConInfo_DTO dto = new AllConInfo_DTO(conferNum, commName, meeting1, meeting2, summary, join);
                    con_list.add(dto);
                 }
                 
              }
              
           }else{
             for(int i=0;i<items.size(); i++){
                   Element person_E=items.get(i);
                   
                   
                }
              }
              
          }catch(Exception e){
            e.printStackTrace();
         }

      model.addAttribute("attend_list", con_list);
      return jsonView;
   }
   
   
   //두번째 작업 -- 회의번호 넘어옴
   public String second_Conf(String conferNum, String name){
         String result = "0";
         
         try{
            
            SAXBuilder builder = new SAXBuilder();
            //넘겨받은 회의번호를 이용해 참석자 리스트를 뽑음
            Document jdomdoc = builder.build(new java.net.URL("http://apis.data.go.kr/9710000/ProceedingInfoService/getSummaryAttenInfoList?confer_num="+conferNum+"&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D"));
            Element root= jdomdoc.getRootElement();
              Element second =root.getChild("body");
              Element third = second.getChild("items");
              List<Element> items = third.getChildren("item");
            
              for(int i = 0; i < items.size(); i++){
                 Element conf = items.get(i);
                 if(conf.getChild("attName").getValue().equals(name)){
                    result="1";
                 }
              }
              
         }catch (Exception e) {
            e.printStackTrace();
         }
         
         return result;
   }
   
   
   
   
   //페이징 클릭할때 - > 상임 위원회 회의 - > 출석 부분
   @RequestMapping("/paliamentSang_Paging.do")
   public View paliamentSang(String count){
      
      System.out.println("a 페이지 정보 : "+count);
      
      return jsonView;
   }
   
}