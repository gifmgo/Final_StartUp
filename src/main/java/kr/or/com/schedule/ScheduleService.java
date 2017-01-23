package kr.or.com.schedule;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.com.Paliament_DTO.PaliamentList_DTO;

@Service
public class ScheduleService{
	
	@Autowired
	private SqlSession sqlSession;
	
	//업데이트 하기 위한 부분
	public int update(List<PaliamentList_DTO> data) {
		
		int result = 0;
		try{
			SchedulerDao dao = sqlSession.getMapper(SchedulerDao.class);
		 	for(int i = 0; i < data.size(); i++){
		 		dao.update(data.get(i));	
		 	}
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

}
