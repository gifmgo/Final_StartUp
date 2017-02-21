package kr.or.com.Data;


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
		TodayUserDAO dao = sqlSession.getMapper(TodayUserDAO.class);
	    TodayUserDTO dto = dao.selectTodayUser();
		if(dto==null){
			result = dao.insertTodayUser();
		}else{
			dao.updateTodayUser();
			dao.updateTotalUser(dto);
		}
		return result;
	}
	
}
