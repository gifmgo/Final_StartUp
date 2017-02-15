package kr.or.com.debate;

import java.util.List;

public interface debateDAO {
	
	public String selectKeyWord();
	
	public int debateWrite(debateDTO dto);
	
	public List<debateDTO> listdebateDTO();

	public debateDTO selectDetail(int no);

	public admin_DebateDTO videosrc();
	
}
