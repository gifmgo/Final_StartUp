package kr.or.com.admin;

import java.util.List;

import kr.or.com.Member.MemberDTO;
import kr.or.com.blog.BlogList_DTO;
import kr.or.com.blog.BlogerApply_DTO;
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
	
	//블로거 신청 리스트 확인
	public List<BlogerApply_DTO> selectBlogerList();

	//신청한 블로거 한명 정보 확인하는 부분 >> 파일업로드 해줘야함
	public BlogerApply_DTO selectBlogerInfo(int i_seq);
	
	//신청한 블로거 메인 이미지까지 등록
	public int insertBlogerInfo(BlogerApply_DTO dto);
	
	//신청한 블로그 >> 실제 등록 >> 리스트에 담아서 뿌려줄꺼
	public int insertBloger(BlogerApply_DTO dto);
	
	//실제 등록되고  대기중인 블로거 삭제 하는 부분 
	public int AdminWaitBloger_Delete(BlogerApply_DTO dto);
}
