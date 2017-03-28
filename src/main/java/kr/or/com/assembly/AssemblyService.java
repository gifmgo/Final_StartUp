package kr.or.com.assembly;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.com.Paliament_DTO.PaliamentList_DTO;

@Service
public class AssemblyService {

	@Autowired
	private SqlSession sqlsession;
	
	//의원 읽어 와야함 .
	public List<PaliamentList_DTO> selectPaliamentList() {
		List<PaliamentList_DTO> list = null;
		try{
			
			AssemblyDAO dao = sqlsession.getMapper(AssemblyDAO.class);
			list = dao.selectPaliamentList();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	
	
}
