package kr.or.com.Point;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.or.com.Member.MemberDTO;
import kr.or.com.Paliament_DTO.PaliamentList_DTO;
import kr.or.com.admin.QuizDTO;

@Service
public class PointService {

	@Autowired
	private SqlSession sqlSession;

	//내가산 국회의원 리스트
	public List<PointDTO> buyPaliamentIndex(String userId) {
		
		List<PointDTO> pointList = null;
		try{
			
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			pointList = dao.buyPaliamentIndex(userId);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return pointList;
	}
	
	
	public List<PaliamentList_DTO> PointIndex(){
		List<PaliamentList_DTO> list = new ArrayList<PaliamentList_DTO>();
		try{
			
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			List<PaliamentList_DTO>list2 = dao.countPaliament();
			for(int i = 0; i < 5; i++){
				list.add(i, list2.get(i));
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		return list;
	}

	//포인트 > 국회의원 이름 검색시 사용
	public List<PaliamentList_DTO> searchPaliament(String empNm) {
		
		List<PaliamentList_DTO> list = null;
		try{
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			list = dao.searchPaliament(empNm);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	
	//포인트 구매
	public int buyPoint(PointDTO dto) {
		int result = 0;
		try{
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			PointDTO secondDTO = dao.selectPointDTO(dto);
			
			if(secondDTO == null){
			
				System.out.println("dto 가 널일때 !! insert 해야함");
				result = dao.buyPoint(dto);
			}else{
				System.out.println("널 아닐때 update 해야함");
				int plusPoint = (secondDTO.getPoint() + dto.getPoint());
				dto.setUpdatePoint(plusPoint);
				result = dao.updatePoint(dto);
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}

		return result;
	}

	//구매후 내 포인트 빼는것
	public int updateMyInfo(PointDTO dto) {
		
		int result = 0;
		try{
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			result = dao.updateMyPoint(dto);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}


	//셀렉트 박스 지역 검사
	public List<PaliamentList_DTO> selectPaliament(String origNm, String polyNm) {
		PaliamentList_DTO dto = new PaliamentList_DTO();
		dto.setOrigNm(origNm);
		dto.setPolyNm(polyNm);
		List<PaliamentList_DTO> list = null;
		try{
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			list = dao.selectBoxPaliament(dto);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	
	//의원정보 한번 읽어 오는 부분
	public PaliamentList_DTO selectPaliamentTotalCount(String deptCd) {
		
		PaliamentList_DTO dto = null;
		try{
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			dto = dao.selectPaliamentTotalCount(deptCd);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return dto;
	}


	//총 구매회수만 증가할때
	public int updatePaliamentCount(PaliamentList_DTO dto) {
		
		int result = 0;
		try{
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			result = dao.updatePaliamentCount(dto);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return result;
	}

	//총 구매회수 + 의원 포인트 증가
	public int updatePaliamentPointCount(PaliamentList_DTO selectDTO) {
		int result = 0;
		try{	
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			result = dao.updatePaliamentPointCount(selectDTO);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}

	
	
	//총 구매 누적 숫자가 0일때 한번 호출됨
	public int zeroUpdatePaliamentCount(PaliamentList_DTO dto) {
		
		int result = 0;
		try{
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			result = dao.zeroUpdatePaliamentCount(dto);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}

	
	//포인트 유저 랭킹
	public List<MemberDTO> pointRank() {
		
		List<MemberDTO> list = null;
		try{
			
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			list = dao.pointRank();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	
	// 좋아하는 국회의원
	public List<PaliamentList_DTO> lovePaliament() {
		
		List<PaliamentList_DTO> list = null;
		
		try{
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			list = dao.lovePaliament();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	//정당별 - >  맨처음 쓰여지는 것
	public List<PaliamentList_DTO> lovepolyNmBase() {
		

		List<PaliamentList_DTO> list = null;
		
		try{
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			list = dao.lovepolyNmBase();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	
	//내가 구매한 국회의원 리스트
	public List<PointDTO> buyPaliamentList(String id) {
		
		List<PointDTO> list = null;
		
		try{
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			list = dao.buyPaliamentList(id);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	//내가 구매한 국회의원 상세 정보 보는 부분
	public PaliamentList_DTO selectPaliamentDeptCd(String deptCd) {
		
		PaliamentList_DTO dto = null;
		try{
			
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			dto = dao.selectPaliamentDeptCd(deptCd);

		}catch(Exception e){
			e.printStackTrace();
		}
		
		return dto;
	}

	//의원 판매
	public int sellTotal(String deptCd, String sellCount, String getPoint, String paliamentPoint, MemberDTO mydto) {
		
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
		 
		int result = 0;
		
		PaliamentList_DTO dto = new PaliamentList_DTO();
		dto.setDeptCd(deptCd);
		int sellCount2 = Integer.parseInt(sellCount);
		dto.setPointCount(sellCount2);
		
		try{
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			
			result = dao.sellPaliamentTotalCount(dto);
			
			//의원 판매 >> totalCount - 시킨것
			if(result > 0){
				int getPoint2 = Integer.parseInt(getPoint);
				System.out.println("처음 if 문  getPoint2 는 ?? "+getPoint2);
				//판매후 나의 포인트 증가시키는 부분.
				mydto.setPoint(mydto.getPoint()+getPoint2);
				
				result = dao.sell_updateMyPoint(mydto);
				//이젠 point 테이블에서 뺴줘야함
				if(result > 0){
					System.out.println("내부 if 문");
					//의원포인트인데..
					//int palPoint = Integer.parseInt(paliamentPoint);
					
					
					
					PointDTO pdto = new PointDTO();
					//pdto.setUpdatePoint(sellCount2);
					pdto.setDeptCd(deptCd);
					pdto.setUserId(mydto.getId());
					
					PointDTO secondDTO = dao.selectPointDTO(pdto);
					pdto.setUpdatePoint(secondDTO.getPoint()-sellCount2);
					
					System.out.println("마지막 업뎃 전 확인좀 : "+pdto.toString());
					if(pdto.getUpdatePoint() < 0){
						System.out.println("0보다 작습니다...");
					}else{
						result = dao.updatePoint(pdto);
					}
				}else{
					System.out.println("내부 else 문");
					result = 0;
					return result;
				}

			}else{
				System.out.println("바깥 else 문");
				return result;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}

	//퀴즈 불러오기
	public QuizDTO quiz() {
	    PointDAO dao  = sqlSession.getMapper(PointDAO.class);
	    QuizDTO dto =null;
	     try{
	    	dto= dao.quiz();
	     }catch (Exception e) {
	    	 e.printStackTrace();
		}
	    
		return dto;
	}

	//퀴즈 풀기 버튼 클릭시
	public String insert_member(QuizDTO dto) {
		PointDAO dao = sqlSession.getMapper(PointDAO.class);
		int result =0;
		String final_result="";
		try{
			//퀴즈 풀었었는지 확인
			String check_id = check_quizMember(dto);
			
			if(check_id !=null){
				final_result="이미 퀴즈 완료";
				System.out.println(" 퀴즈 이미 풀었어------------------");
			}else{
				result = dao.insert_member(dto);
				System.out.println(" 퀴즈 처음이네 insert 결과==========="+result);
				if(result>0){
					String answer = dao.checkQuizAnswer(dto);
					if(answer.equals(dto.getAnswer())){
						int update_result =updateMyPointQuiz(dto);
						if(update_result>0){
							final_result="정답";
						}
						
					}else{
						final_result="오답";
					}
					System.out.println(" 정답이니??????????"+final_result);
				}
			}
				
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return final_result;
	}
	  
	//퀴즈 풀었는지 확인
     public String check_quizMember(QuizDTO dto){
    	 PointDAO dao = sqlSession.getMapper(PointDAO.class);
    	 String check_id=""; 
    	 try{
    		 check_id = dao.checkId(dto);
    	 }catch (Exception e) {
			e.printStackTrace();
		}
    	 
    	 return check_id;
     }
	
	//퀴즈 맞췄을 경우 포인트 업데이트
     public int updateMyPointQuiz(QuizDTO dto){
    	 PointDAO dao = sqlSession.getMapper(PointDAO.class);
    	 int result=0;
    	  try{
    		  result = dao.updateMyPointQuiz(dto);
    	  }catch (Exception e) {
			e.printStackTrace();
		}
    	 return result;
     }

    //포인트 디테일 페이지 >> 정당별 인기의원
	public List<PaliamentList_DTO> pointSelectAjax(String polyNm) {
		
		List<PaliamentList_DTO> list = null;
		try{
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			list = dao.pointSelectAjax(polyNm);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	//포인트 Index >> 내가 구매한 국회의원 상세보기
	public PointDTO selectMyDetailPoint(PointDTO dto) {
		
		PointDTO db_dto = null;
		try{
			
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			db_dto = dao.myPointPaliament_Detail(dto);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return db_dto;
	}

	//내 포인트 가져오기 위한 것 
	public MemberDTO selectMyInfo(String id) {
		
		MemberDTO dto = null;
		
		try{
			
			PointDAO dao = sqlSession.getMapper(PointDAO.class);
			dto = dao.selectMyInfo(id);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return dto;
	}
	
}
