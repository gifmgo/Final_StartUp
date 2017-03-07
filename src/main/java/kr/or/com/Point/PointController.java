package kr.or.com.Point;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.com.Member.MemberDTO;
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
		List<PointDTO> pointList = null;
		if(userId != null && userId != ""){
			pointList = service.buyPaliamentIndex(userId);
		}
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
	public View buyPoint(String deptCd, String empNm, int buypoint, int updatePoint, Model model, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");
		
		System.out.println("확인 : "+deptCd + " // 이름 : "+empNm + " // 유저가 구매한 숫자 : "+buypoint+ " // 업데이트 포인트는 뭔데 : "+updatePoint);
		PointDTO dto = new PointDTO();
		dto.setDeptCd(deptCd);
		dto.setEmpNm(empNm);
		//몇개 구매한건지
		dto.setPoint(buypoint);
		dto.setUserId(id);
		dto.setUpdatePoint(updatePoint);
														// 내가 구매한 거임 ....  >> dto.getPoint()
		System.out.println("**************************잠시만 확인좀요 : "+dto.toString());
		
		//point 테이블에 구매한 정보 담궈둠
		int result = service.buyPoint(dto);
		String message = "";
		
		if(result > 0){
				/*
				 * 1.국회의원 총 구매횟수  - > PointCount
				 * 2.유저가 구매한 숫자 - > buyPoint
				 * 3.국회의원 포인트 - > Point
				 * 
				 * -------------------
				 * 1.국회의원 정보 가져와서 >> 총 구매회수 증가시켜야함.
				 * 2.point 관련 테이블에 누가 구매했는지 정보 입력함.
				 * 
				 */
				
			 
				//1.국회의원 정보 가져옴 >> PointCount
				PaliamentList_DTO selectDTO = service.selectPaliamentTotalCount(deptCd);

				//국회의원 총 구매수
				int totalCount = selectDTO.getPointCount();
				
				//국회의원 포인트
				int paliamentPoint = selectDTO.getPoint();
				System.out.println("---국회의원 총 구매수 누적 숫자 : " +totalCount + " //  포인트 확인좀 컨트롤러 85번째 줄 : "+paliamentPoint);
				
				
				//총구매횟수가 100 이 안되거나  0 일때  >> 유저가 구매한 카운트 업데이트
				if(totalCount == 0 || (totalCount/100) == 0){
					selectDTO.setPointCount(totalCount+buypoint);
					result = service.zeroUpdatePaliamentCount(selectDTO);
				}else{
					selectDTO.setPointCount(totalCount+buypoint);
					result = service.zeroUpdatePaliamentCount(selectDTO);
				}
				
				if(result > 0){
					System.out.println("업뎃 마이 인포 전");
					result = service.updateMyInfo(dto);
					System.out.println("result 는 ?? "+result);
					if(result > 0){
						memberDTO.setPoint(dto.getUpdatePoint());
						message = "구매 성공!";
					}else{
						message = "죄송합니다 잠시후 다시 이용해주세요!";
					}
				
				}else{
					message = "죄송합니다 잠시후 다시 이용해주세요!";
				}
			}		
		model.addAttribute("message", message);
		model.addAttribute("result", result);
		return jsonview;
	}

	//2.유저 정보 업데이트
	/*private int UpdateUser(PointDTO dto){
		System.out.println("Service ---  122 번째 줄 : "+dto.getUpdatePoint());
		int result = service.updateMyInfo(dto);
		return result;
	}*/
	
	//3-1.국회의원 정보 업데이트
	/*private int updatePaliamentCount(PaliamentList_DTO dto) {
		int result = service.updatePaliamentCount(dto);
		return result;
	}*/
	
	//3-2.국회의원 정보 업데이트 - 포인트 및 총 구매수 변경
	/*private int updatePaliamentPointCount(PaliamentList_DTO selectDTO) {
		int result = service.updatePaliamentPointCount(selectDTO);
		return result;
	}
	*/

	//셀렉트 최종 !!
	@RequestMapping("/pointSearchSelect.do")
	public View selectResult(String area, String jungDang, Model model){
		System.out.println("확인좀 해볼께요 : "+area+ " // 정당 : "+jungDang);
		List<PaliamentList_DTO> list = service.selectPaliament(area, jungDang);
		for(int i = 0; i < list.size(); i++){
			System.out.println("확인좀 할께요 : "+list.get(i).toString());
		}
		model.addAttribute("selectlist", list);
		return jsonview;
	}
	
	//PointDetail 페이지
	@RequestMapping("/PointDetail.do")
	public String PointDetailIndex(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		//유저 랭킹
		List<MemberDTO> list = service.pointRank();
		//인기의원
		List<PaliamentList_DTO> pal_list = service.lovePaliament();
		//정당별 인기의원
		List<PaliamentList_DTO> jungDang_list = service.lovepolyNmBase();
		
		//내가 구매한 국회의원
		List<PointDTO> myPaliament = service.buyPaliamentList(id);
		
		model.addAttribute("pointRank", list);
		model.addAttribute("lovePal", pal_list);
		model.addAttribute("baseJungDang",jungDang_list);
		model.addAttribute("buyPaliament", myPaliament);
		return "point.PointDetailIndex";
	}
	
	//PointDetail 페이지 ajax  - > 판매하려는 의원 상세정보 보기
	@RequestMapping("/detailMyPaliament.do")
	public View detailMyPaliament(String deptCd, Model model){
		
		System.out.println("의원번호 : "+deptCd);
		PaliamentList_DTO dto = service.selectPaliamentDeptCd(deptCd);
		System.out.println("아작스 : "+dto.toString());
		model.addAttribute("paliamentDTO", dto);
		return jsonview;
	}
	
	//의원 판매 시작하자
	@RequestMapping("/sellStartPaliament.do")
	public View sellPaliament(String deptCd, String sellCount, String getPoint, String paliamentPoint, Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberDTO myDTO = (MemberDTO)session.getAttribute("memberDTO");
		
		/* 변수
		 * ------------------------------------
		 * getPoint >> 판매수량 * 의원 포인트
		 * sellCount >> 유저가 입력한 판매 수량
		 * paliamentPoint >> 의원 포인트
		 * ------------------------------------
		 * 1.국회의원 토탈카운트를 판매수량 만큼 감소를 시킨다.
		 * 2.유저의 포인트를 증가시키고
		 * 3.유저의 구매수량을 판매수량만큼 감소시켜야함.
		 */
		
	     int result = service.sellTotal(deptCd, sellCount, getPoint,paliamentPoint, myDTO);
		
		
		
		
		return jsonview;
	}
	
}
