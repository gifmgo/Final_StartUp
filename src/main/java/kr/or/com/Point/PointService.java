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
	
	
}
