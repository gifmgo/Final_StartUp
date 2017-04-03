package kr.or.com.Life;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import kr.or.com.FreeBoard.FreeBoardDTO;
import kr.or.com.FreeBoard.FreeBoardService;
import kr.or.com.Util.Converter;


@Controller
public class LifeController {

	@Autowired
	private View jsonview;
	
	@Autowired
	private FreeBoardService free_Service;
	
	//관리자 메인페이지
	@RequestMapping("/life.do")
	public String lifeIndex(Model model,HttpServletRequest request, String f, String q){
		
		List<FreeBoardDTO> fun = free_Service.selectBestBoard("영상", 10);
		List<FreeBoardDTO> wor = free_Service.selectBestBoard("고민", 10);
		List<FreeBoardDTO> life = free_Service.selectBestBoard("일상", 10);
		List<FreeBoardDTO> star = free_Service.selectBestBoard("연예", 10);
		
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyyMMddHHmm");
	    String strDate = fm.format(new Date());
	    
	    model.addAttribute("now", strDate);
		model.addAttribute("fun", fun);
		model.addAttribute("wor", wor);
		model.addAttribute("life", life);
		model.addAttribute("star", star);
		
		String category = request.getParameter("category");
		String pagesize = request.getParameter("pagesize");
		String currentpage = request.getParameter("currentpage");
		
		Converter cvt = new Converter();
		if(category==null || category.equals("")){
			category = "전체";
		}else{
			category= cvt.engToKor(category);
			if(category.equals("일상")){
			}else if(category.equals("연예")){
			}else if(category.equals("고민")){
			}else if(category.equals("영상")){
			}else{
				return null;
			}
		}
		model.addAttribute("title", category);
    	
		int totalcount = 0;
		int pagecount = 0;
		
		String field = "title";
		String query ="%%";
		
        if(pagesize == null || pagesize.trim().equals("")){
            pagesize = "15"; 			// default 15건씩 
        }
        
        if(currentpage == null || currentpage.trim().equals("")){
            currentpage = "1";        //default 1 page
        }
        if(f != null && !f.equals("")){
			field = f;
		}
		if(q != null && !q.equals("")){
			query = q;
		}
		
		totalcount = free_Service.boardCount(field, query, category);
		
        int pgsize = Integer.parseInt(pagesize);  		// 15
        int cpage = Integer.parseInt(currentpage);     //1
        
        if(totalcount % pgsize==0){        //전체 건수 , pagesize 
            pagecount = totalcount/pgsize;
        }else{
            pagecount = (totalcount/pgsize) + 1;
        }
		
		List<FreeBoardDTO> list = null;

		try{
			 list = free_Service.selectAllFreeBoard(cpage,pgsize,field,query,category);         
		}catch(Exception e){
			e.getMessage();
		}finally{
		    model.addAttribute("now", strDate);
			model.addAttribute("list", list);
			model.addAttribute("cpage", cpage);
			model.addAttribute("pgsize", pgsize);
			model.addAttribute("pagecount", pagecount);
			model.addAttribute("totalcount", totalcount);
		}
		
		return "life.life";
	}
	
	//글쓰기
	@RequestMapping("/lifeboardWriteView.do")
	public String FreeBoardWrite(String category, String currentpage, Model model){
		
		model.addAttribute("category", category);
		model.addAttribute("currentpage", currentpage);
		return "life.boardWrite";
	}
	
	//글쓰기 submit 할때
	@RequestMapping(value="/writelife.do", method=RequestMethod.POST)
	public String FreeBoardWriteResult(@RequestParam("uploadfile") MultipartFile file ,FreeBoardDTO dto, String img, Model model, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("id");
		if(logId == null || logId.equals("")){
			model.addAttribute("result", 2);
			return null;
		}
		dto.setId(logId);
		
		String s = request.getParameter("ckeditor");
		dto.setContent(s);
		
		try {
			if(file.getOriginalFilename()==null || file.getOriginalFilename().equals("")){
				dto.setFilename("");
				dto.setFilepath("");
			}else{
				String fileName = file.getOriginalFilename();
				String fileNameExt = fileName.substring(fileName.indexOf(".")+1);
				
				@SuppressWarnings("deprecation")
				String path = request.getRealPath("/upload/"+dto.getId());
				File destD = new File(path);
				if(!destD.exists()){
					destD.mkdirs();
				}
				dto.setFilename(fileName);
				File destination = File.createTempFile(fileName.substring(0, fileName.indexOf("."))+"_", "."+fileNameExt, destD);
				dto.setFilepath(destination.getName());
				file.transferTo(destination);
			}
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		int result = free_Service.writeBoard(dto);
		
		Converter cvt = new Converter();
		dto.setCategory(cvt.korToEng(dto.getCategory()));
		
		model.addAttribute("category", dto.getCategory());
		model.addAttribute("result", result);
		
		return "life.boardpointer";
	}
	
	//글 수정 view
	@RequestMapping("lifeModifyView.do")
	public String boardModifyView(HttpServletRequest requset,String no, String currentpage, Model model){
		
		HttpSession session = requset.getSession();
		FreeBoardDTO dto=free_Service.selectDetail(no, session.getAttribute("lastPage").toString());

		model.addAttribute("dto", dto);
		model.addAttribute("currentpage", currentpage);
		model.addAttribute("category", dto.getCategory());
		return "life.boardpointer";
		
	}
	
}
