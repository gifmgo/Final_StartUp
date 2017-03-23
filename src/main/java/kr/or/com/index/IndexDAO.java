package kr.or.com.index;

import java.util.List;

import kr.or.com.FreeBoard.FreeBoardDTO;
import kr.or.com.Member.MemberDTO;
import kr.or.com.Paliament_DTO.PaliamentList_DTO;
import kr.or.com.President.PresidentTalk_DTO;
import kr.or.com.debate.debateDTO;

public interface IndexDAO {

	//대선 토크 관련 리스트
	List<PresidentTalk_DTO> index_selectPresidentTalk();
	
	//토론하기 키워드 가져오는 부분
	String index_selectKeyWord();
	
	//토론하기 리스트 가져오는 부분
	List<debateDTO> index_listdebateDTO(String keyWord);
	
	//오늘의 이슈.
	List<FreeBoardDTO> index_selectIssue();
	
	//정치 게시판 글 
	List<FreeBoardDTO> index_selectJungChi();
	
	//공지사항
	List<FreeBoardDTO> index_selectNotice();
	
	//포인트 리스트
	List<MemberDTO> index_selectPoint();
	
	//인기 국회의원 리스트
	List<PaliamentList_DTO> index_selectPaliament();
}
