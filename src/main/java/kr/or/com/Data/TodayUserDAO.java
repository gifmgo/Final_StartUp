package kr.or.com.Data;

import java.util.List;

public interface TodayUserDAO {
	
	public List<TodayUserDTO> todayList();

	public TodayUserDTO selectTodayUser(TodayUserDTO dto);

	public int insertTodayUser();
	
	public int updateTodayUser();
	
	public int updateTotalUser();
	
	public int deleteTodayUser();
}