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
	private SqlSession sqlsession;
	
	public List<TodayUserDTO> todayList(){
		TodayUserDAO dao = sqlsession.getMapper(TodayUserDAO.class);
		List<TodayUserDTO> list = dao.todayList();
		return list;
	}
	
	public int updateTodayUser(){

		int result = 0;
		SimpleDateFormat fm = new SimpleDateFormat("yyyyMMdd");
		String strDate = fm.format(new Date());
		
		TodayUserDAO dao = sqlsession.getMapper(TodayUserDAO.class);
	    TodayUserDTO dto = new TodayUserDTO();
	    dto.setAdate(strDate);
	    dto = dao.selectTodayUser(dto);
	    System.out.println("dto : "+dto);
		if(dto==null|| dto.getAdate().equals("")){
			dao.updateTotalUser();
			result = dao.insertTodayUser();
			dao.updateTodayUser();
		}else{
			dao.updateTodayUser();
		}
		return result;
	}
	
}
