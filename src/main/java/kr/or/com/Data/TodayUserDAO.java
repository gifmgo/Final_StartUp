package kr.or.com.Data;

import java.util.List;

public interface TodayUserDAO {
	
	public List<TodayUserDTO> todayList();

	public TodayUserDTO selectTodayUser();

	public TodayUserDTO lastTodayUserNo();
	
	public int insertTodayUser();
	
	public int updateTodayUser();
	
	public int updateTotalUser(TodayUserDTO dto);
	
	public int deleteTodayUser();
}