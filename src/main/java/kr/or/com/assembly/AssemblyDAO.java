package kr.or.com.assembly;

import java.util.List;

import kr.or.com.Paliament_DTO.PaliamentList_DTO;

//국회 페이지에서 사용하는 DAO 임.
public interface AssemblyDAO {
	
	//국회에서 사용하는 의원 리스트 뽑아오는 것
	List<PaliamentList_DTO> selectPaliamentList();

}
