package kr.or.com.President;

import java.util.List;

public interface PresidentDAO {

	//국회의원 리스트 뿌리는 것
	public List<PresidentDTO> list();
	
}
