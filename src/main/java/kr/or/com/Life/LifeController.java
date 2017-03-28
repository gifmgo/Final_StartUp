package kr.or.com.Life;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String lifeIndex(Model model){
		
		List<FreeBoardDTO> popLife = free_Service.bestLife(1, 10);
		List<FreeBoardDTO> fun = free_Service.selectBestBoard("영상", 10);
		List<FreeBoardDTO> wor = free_Service.selectBestBoard("고민", 10);
		List<FreeBoardDTO> life = free_Service.selectBestBoard("일상", 10);
		List<FreeBoardDTO> star = free_Service.selectBestBoard("연예", 10);
		
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyyMMddHHmm");
	    String strDate = fm.format(new Date());
	    
	    model.addAttribute("now", strDate);
		model.addAttribute("popLife", popLife);
		model.addAttribute("fun", fun);
		model.addAttribute("wor", wor);
		model.addAttribute("life", life);
		model.addAttribute("star", star);
		
		return "life.life";
	}
	
	//boardDetail
	@RequestMapping("/lifeBoard.do")
	public String lifeBoard(Model model,HttpServletRequest request, String f, String q){
		
		String category = request.getParameter("category");
		String pagesize = request.getParameter("pagesize");
		String currentpage = request.getParameter("currentpage");
		
		Converter cvt = new Converter();
		category= cvt.engToKor(category);
		
		if(category == null || category.trim().equals("")){
			category = "자유게시판"; 			// default 10건씩 
        }else{
        	if(category.equals("자유게시판")){
        	}else if(category.equals("오늘의 이슈")){
        	}else if(category.equals("정치게시판")){
        	}else if(category.equals("공지사항")){
//        	life
        	}else if(category.equals("일상")){
        	}else if(category.equals("연예")){
        	}else if(category.equals("고민")){
        	}else if(category.equals("영상")){
        	}else{
        		return null;
        	}
        }
		
		int totalcount = 0;
		int pagecount = 0;
		
		String field = "title";
		String query ="%%";
		
        if(pagesize == null || pagesize.trim().equals("")){
            pagesize = "15"; 			// default 10건씩 
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
		
        int pgsize = Integer.parseInt(pagesize);  		// 10
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
			
			SimpleDateFormat fm = new SimpleDateFormat("yyyyMMddHHmm");
		    String strDate = fm.format(new Date());
		    model.addAttribute("now", strDate);
			
			model.addAttribute("title", category);
			model.addAttribute("list", list);
			model.addAttribute("cpage", cpage);
			model.addAttribute("pgsize", pgsize);
			model.addAttribute("pagecount", pagecount);
			model.addAttribute("totalcount", totalcount);
		}
		
		return "life.boardIndex";
	}
}
