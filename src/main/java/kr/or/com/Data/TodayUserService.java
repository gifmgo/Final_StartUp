package kr.or.com.Data;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TodayUserService {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<TodayUserDTO> todayList(){
		TodayUserDAO dao = sqlSession.getMapper(TodayUserDAO.class);
		List<TodayUserDTO> list = dao.todayList();
		return list;
	}
	
	public int updateTodayUser(){
		int result = 0;
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = format.format(now);
		System.out.println("UpdateTodayUser**************************");
		TodayUserDTO tdto = new TodayUserDTO();
		tdto.setAdate(date);
		try{
			TodayUserDAO dao = sqlSession.getMapper(TodayUserDAO.class);
		    TodayUserDTO dto = dao.selectTodayUser(tdto);
			if(dto==null){
				dto = new TodayUserDTO();
				dto.setAdate(date);
				result = dao.insertTodayUser(dto);
			}else{
				dao.updateTodayUser(dto);
				dao.updateTotalUser(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
}
