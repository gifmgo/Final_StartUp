package kr.or.com.Data;

import java.util.List;

public interface TodayUserDAO {
	
	public List<TodayUserDTO> todayList();

	public TodayUserDTO selectTodayUser(TodayUserDTO dto);
 
	public TodayUserDTO lastTodayUserNo();
	
	public int insertTodayUser(TodayUserDTO dto);
	
	public int updateTodayUser(TodayUserDTO dto);
	
	public int updateTotalUser(TodayUserDTO dto);
	
	public int deleteTodayUser(TodayUserDTO dto);
}