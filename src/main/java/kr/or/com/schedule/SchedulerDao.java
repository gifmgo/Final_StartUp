package kr.or.com.schedule;

import java.util.List;

import kr.or.com.Paliament_DTO.PaliamentList_DTO;

public interface SchedulerDao {

	public int update(PaliamentList_DTO dto);

	public List<PaliamentList_DTO> paliament_Select();
	
}
