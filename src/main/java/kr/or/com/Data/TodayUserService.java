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
	
	public String updateTodayUser(){
		String result="";
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = format.format(now);
		System.out.println("UpdateTodayUser**************************");
		try{
			TodayUserDAO dao = sqlSession.getMapper(TodayUserDAO.class);
		    TodayUserDTO dto = dao.selectTodayUser(date);
			if(dto==null){
				dto = new TodayUserDTO();
				dto.setAdate(date);
				dao.insertTodayUser(dto);
			}else{
				dao.updateTodayUser(dto);
				dao.updateTotalUser(dto);
			}
		}catch(Exception e){
			result = e.getMessage();
		}
		
		return result;
	}
	
}
