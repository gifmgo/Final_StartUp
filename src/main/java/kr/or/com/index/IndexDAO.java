package kr.or.com.index;

import java.util.List;

import kr.or.com.Data.TodayUserDTO;
import kr.or.com.FreeBoard.FreeBoardDTO;
import kr.or.com.Member.MemberDTO;
import kr.or.com.Paliament_DTO.PaliamentList_DTO;
import kr.or.com.President.PresidentTalk_DTO;
import kr.or.com.blog.BlogList_DTO;
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
	//공지사항 글 개수 체크하는 부분
	List<FreeBoardDTO> index_selectCheckList();
	
	//포인트 리스트
	List<MemberDTO> index_selectPoint();
	
	//인기 국회의원 리스트
	List<PaliamentList_DTO> index_selectPaliament();
	
	//블로거 리스트 뽑아오는 부분.
	List<BlogList_DTO> index_selectBlogerList();
	
	//접속자 수 확인 
	TodayUserDTO index_selectTodayUser();
	
	//문의하기 
	int index_insertConCat(ConcatDTO dto);


}
