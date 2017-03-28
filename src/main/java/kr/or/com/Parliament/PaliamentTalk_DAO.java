package kr.or.com.Parliament;

import java.util.List;

import kr.or.com.FreeBoard.CommentDTO;
import kr.or.com.Paliament_DTO.PaliamentList_DTO;
import kr.or.com.Paliament_DTO.PaliamentTalk_DTO;

public interface PaliamentTalk_DAO {

   //국회의원별 말,말,말
   public List<PaliamentTalk_DTO> talkMember(String name);
   
   //말말말 댓글
   public List<PaliamentTalk_DTO> talktalkList(String num, String start, String end);
   
   //국회의원 말, 말, 말 , 게시판 글쓰기
   public int talk_Write(PaliamentTalk_DTO dto);
   
   //국회의원 말,말,말 게시글 상세보기
   public PaliamentTalk_DTO talk_detailSelect(String num);
   
   //국회의원 말, 말, 말 수정하기
   public PaliamentTalk_DTO talk_modify(String seq, String id);
   
   //말말말 삭제하기
   public int removeTalk(String seq);
   
   //조회수
   public int updateCnt(String seq);

   //국회의원 말, 말, 말 수정하기 >> POST 고고씽 >> DB 데이터 변경 합시다.
   public int talk_modify_Post(String seq, String title, String content);
   
   //API 정보 db에 담아두는 부분 >> 스케쥴러 용
   public int paliament_DB(PaliamentList_DTO data);
   
   //API >  디비에 있는 데이터 뽑아옴
   public List<PaliamentList_DTO> selectPaliamentList_DTO();
   
   public List<PaliamentList_DTO> selectPaliamentList(String polyNm,String orignm,String empnm);
   
   
   //댓글
   //댓글 쓰기
 	public int writeComment(CommentDTO dto);
 	
 	//대댓글 쓰기
 	public int writeCommentn(CommentDTO dto);
 	
 	//댓글 뽑기
 	public List<CommentDTO> selectComment(String no);

 	//대댓글 리스트
 	public List<CommentDTO> commentList(String no);
 	
 	public int deleteComment(int co_no);
 	public int deleteAllComment(int co_no);
 	
 	public int updateComment(CommentDTO dto);
 	
 	//최근 국회의원 최신댓글
	public List<PCommentDTO> rPCommentList();
	// 국회의원 댓글
	public List<PCommentDTO> pCommentList();
	//선택된 국회의원 댓글
	public List<PCommentDTO> sCommentList(String polyNm,String orignm, String name);
	
	//정당 아이콘 클릭해서 정당별 의원만 뿌려주는 것
	public List<PaliamentList_DTO> selectPolyName_PaliamentList(String polyNm);
   
}