package kr.or.com.Life;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;


@Controller
public class LifeController {

	@Autowired
	private View jsonview;
	
	//관리자 메인페이지
	@RequestMapping("/life.do")
	public String adminIndex(){
		return "life.life";
	}
}
