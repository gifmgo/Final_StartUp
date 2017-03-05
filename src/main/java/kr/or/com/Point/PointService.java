package kr.or.com.Point;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.com.Paliament_DTO.PaliamentList_DTO;

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
			result = dao.buyPoint(dto);
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


	
	
	
}
