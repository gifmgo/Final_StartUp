package kr.or.com.President;

import java.util.List;

public interface PresidentDAO {

	//국회의원 리스트 뿌리는 것
	public List<PresidentDTO> list();
	
	//대선주자 지지율
	public List<PresidentDTO> poll();

	//대선주자 > 임시 투표 >> 대선주자 리스트 뿌리기
	public List<PresidentDTO> vote();
	
	//우리끼리 투표하기전에 이미 했는지 확인해보는 부분
	public PresidentVote_DTO checkVote(String id);
	
	//투표하기 고고 
	public int updateVote(PresidentVote_DTO dto);
	
	//임시 투표 결과
	public List<PresidentDTO> voteDetail();
	
	
}
