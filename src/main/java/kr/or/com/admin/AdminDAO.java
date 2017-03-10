package kr.or.com.admin;

import java.util.List;

import kr.or.com.Member.MemberDTO;
import kr.or.com.debate.admin_DebateDTO;
import kr.or.com.debate.debateDTO;

public interface AdminDAO {

	//차단 유저 관리  - 유저 리스트 
	public List<BanUserDTO> userList();

	//유저 차단하기
	public int insertbanId(String userId);

	public List<BanUserDTO> checkId();
	
	//차단유저 해제하기
	public int deletebanId(String string);

	//토론 주제 등록하기
	public int insertSubject(admin_DebateDTO dto);

	//키워드 관련 테이블에서 데이터 가져오는것
	public List<admin_DebateDTO> selectAdmin_debateDTO_List();

	//토론글 리스트 읽어 오는 것
	public List<debateDTO> selectDebateList(String keyword);

	//퀴즈 작성하기
	public int quiz(QuizDTO dto);
	
	//차단 유저들이 보낸 메일 관리 함
	public List<banUserMailDTO> banUserMailList();
	
	//차단 유저들이 보낸 메일  상세보기
	public banUserMailDTO banuserMailDTO(int banUserMailSeq);
	
	//유저 리스트 보여주는 부분
	public List<MemberDTO> userList2();
	
	//유저포인트 업데이트 !!
	public int updateMemberPoint(MemberDTO prevList);
}
