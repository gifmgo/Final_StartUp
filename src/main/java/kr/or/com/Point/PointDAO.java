package kr.or.com.Point;

import java.util.List;

import kr.or.com.Paliament_DTO.PaliamentList_DTO;

public interface PointDAO {

	public List<PaliamentList_DTO> countPaliament();

	//국회의원 검색시 사용됨 - ajax 용
	public List<PaliamentList_DTO> searchPaliament(String name);
	
}
