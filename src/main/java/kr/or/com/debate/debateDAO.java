package kr.or.com.debate;

import java.util.List;

public interface debateDAO {
	
	public String selectKeyWord();
	
	public int debateWrite(debateDTO dto);
	
	//토론 리스트 가져오는 것
	public List<debateDTO> listdebateDTO();

	public debateDTO selectDetail(int no);
    
	//dto 가져오는 것
	public admin_DebateDTO videosrc();
	
}
