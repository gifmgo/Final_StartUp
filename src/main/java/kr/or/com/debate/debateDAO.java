package kr.or.com.debate;

import java.util.List;

public interface debateDAO {
	
	public String selectKeyWord();
	
	public int debateWrite(debateDTO dto);
	
	//토론 리스트 가져오는 것
	public List<debateDTO> listdebateDTO(String keyword);

	public debateDTO selectDetail(int no);
    
	//dto 가져오는 것
	public admin_DebateDTO videosrc();
	
	//토론 리스트 상세 뿌려주는 부분 영상이랑 다 뿌려줘야함.
	public List<debateDTO> detaillist(String keyWord);
	
}
