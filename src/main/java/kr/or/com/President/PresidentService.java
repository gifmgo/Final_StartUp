package kr.or.com.President;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PresidentService {

	@Autowired
	private SqlSession sqlSession;
	
	public List<PresidentDTO> list(){
		
		List<PresidentDTO> list = null;
		PresidentDAO dao = sqlSession.getMapper(PresidentDAO.class);
		
		try{
			list = dao.list(); 
		}catch(Exception e){
			e.printStackTrace();
		}

		return list; 
	}
	
}
