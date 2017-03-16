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
	
	//대선 후보 관련 토크
	public List<PresidentDTO> presidentTalk();
	
	//대선 후보 사용자들이 글 쓴 내용 가져오기
	public List<PresidentTalk_DTO> selectPresidentTalk_list();
	
	//대선후보 관련 토크 >> 비회원 글쓰기
	public int notLoginUserTalk(PresidentTalk_DTO dto);
	
	//대선후보 관련 토크 >> 회원 글쓰기
	public int loginUserTalk(PresidentTalk_DTO dto);
	
	//삭제 버튼 클릭시 확인
	public PresidentTalk_DTO selectPresidentTalk(int presidentTalk_seq);
	
	//db 데이터 삭제  >> 입력한 비번 일치 할 때 >> 비회원
	public int deletePresidentTalk(int presidentTalk_seq);
	
	
	
	
}
