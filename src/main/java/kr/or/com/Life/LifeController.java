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
	public String lifeBoard(HttpServletRequest request, Model model, String category){
		
		model.addAttribute("category", category);
		
		return "board.boardIndex";
	}
}
