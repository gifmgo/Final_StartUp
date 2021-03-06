package kr.or.com.FreeBoard;

import java.util.List;

import kr.or.com.blog.BlogList_DTO;

public interface FreeBoardDAO {
	
	//베스트 글 뽑기
	public List<FreeBoardDTO> selectBestBoard(String category, int num);

	//생활부분 베스트
	public List<FreeBoardDTO> bestLife(int start, int end);
	
	//자유게시판 list 불러오기
	public List<FreeBoardDTO> selectAllFreeBoard(String field, String query, String category,int start, int end);
	
	//자유게시판 글쓰기
	public int FreeBoardWrite(FreeBoardDTO dto);
	
	//자유게시판 상세 글보기
	public FreeBoardDTO FreeBoardDetail(String no);
	
	//글삭제
	public int deleteContent(String no);

	//글수정
	public int updateContent(FreeBoardDTO dto);
	
	//자유게시판 상세보기 클릭시 조회수 증가
	public int updateCnt(String no);
	
	//총게시글수
	public int boardCount(String field, String query, String category);
	public int lifeBoardCount(String field, String query);

	
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
	
	//관심사 뽑아오기
	public String selectFavorit(String id);
	
	//커뮤니티 >> 블로거 정보 뽑아오기
	public List<BlogList_DTO> selectBloger();
}
