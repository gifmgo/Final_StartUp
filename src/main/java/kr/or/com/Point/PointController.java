package kr.or.com.Point;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.com.Paliament_DTO.PaliamentList_DTO;

@Controller
public class PointController {

	@Autowired
	private PointService service;
	
	@Autowired
	private View jsonview;
	
	//포인트 메인 페이지
	@RequestMapping("/point.do")
	public String PointIndex(Model model,HttpServletRequest request){
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("id");
		
		List<PaliamentList_DTO> list = service.PointIndex();
		List<PointDTO> pointList = service.buyPaliamentIndex(userId);

		model.addAttribute("pointList", pointList);
		model.addAttribute("list", list);
		return "point.PointIndex";
	}
	
	
	//의원 검색 할 때
	@RequestMapping("/PointSearchPaliament.do")
	public View searchPaliament(String name, Model model){
		
		List<PaliamentList_DTO> list = service.searchPaliament(name);
		model.addAttribute("list", list);
		return jsonview;
	}
	
	//베스트 국회의원 포인트 구매시
	@RequestMapping("/buyPoint.do")
	public View buyPoint(String deptCd, String empNm, int point, int updatePoint, Model model, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println("확인 : "+deptCd + " // 이름 : "+empNm + " // 포인트 : "+point);
		PointDTO dto = new PointDTO();
		dto.setDeptCd(deptCd);
		dto.setEmpNm(empNm);
		dto.setPoint(point);
		dto.setUserId(id);
		dto.setUpdatePoint(updatePoint);
		int result = service.buyPoint(dto);
		String message = "";
		
		if(result > 0){
			result = UpdateUser(dto);
			if(result > 0){
				message = "구매 성공!";
				System.out.println("2단계 if");
			}else{
				message = "죄송합니다 잠시후 다시 이용해주세요!";
				System.out.println("2단계 else");
			}
		}else{
			message = "죄송합니다 잠시후 다시 이용해주세요!";
		}
		model.addAttribute("message", message);
		model.addAttribute("result", result);
		return jsonview;
	}
	
	public int UpdateUser(PointDTO dto){
		int result = service.updateMyInfo(dto);
		return result;
	}
	
}
