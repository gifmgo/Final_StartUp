package kr.or.com.FreeBoard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.com.Member.MemberDAO;
import kr.or.com.Member.MemberDTO;
import kr.or.com.blog.BlogList_DTO;

@Service
public class FreeBoardService {


	@Autowired
	private SqlSession sqlSession;
	
	//베스트 리스트 뿌려주는 메서드
	public List<FreeBoardDTO> selectBestBoard(String category, int number){
		FreeBoardDAO dao = sqlSession.getMapper(FreeBoardDAO.class);
		List<FreeBoardDTO> list = dao.selectBestBoard(category,number);
		return list;
	}

	//자유게시판 글쓰기
	public int writeBoard(FreeBoardDTO dto){
		
		MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
		MemberDTO member = mdao.selectMyInfo(dto.getId());
		dto.setWriter(member.getNickName());
		
		FreeBoardDAO dao = sqlSession.getMapper(FreeBoardDAO.class);

		int result = 0;
		result = dao.FreeBoardWrite(dto);
		return result;
	}
	
	//자유게시판 상세 글보기
	public FreeBoardDTO selectDetail(String no, String lastPage){
		
		FreeBoardDTO dto = null;
		FreeBoardDAO dao = sqlSession.getMapper(FreeBoardDAO.class);
		try{
			if(lastPage!=null&&!lastPage.equals("")&&!lastPage.equals(no)){
				dao.updateCnt(no);				
			}
			dto = dao.FreeBoardDetail(no);
		}catch(Exception e){
			e.printStackTrace();
		}
		return dto;
	}
	
	//글 삭제
	public int deleteContent(String no){
        FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
        int result = 0;
        result = freeboarddao.deleteContent(no);
        
        return result;
	}
	
	//글 수정
	public int updateContent(FreeBoardDTO dto){
		FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
		int result = 0;
		result = freeboarddao.updateContent(dto);
		
		return result;
	}
	
	public List<FreeBoardDTO> selectAllFreeBoard(int cpage,int pgsize,String field,String query,String category){
		int start = cpage * pgsize - (pgsize - 1);
        int end = cpage * pgsize;
        FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
        List<FreeBoardDTO> list = null;
        list = freeboarddao.selectAllFreeBoard(field, query, category, start, end);
        
        return list;
	}

	public int boardCount(String field, String query, String category) {
		FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
		int result = 0;
		result = freeboarddao.boardCount(field, query, category);
		return result;	
	}

	//대댓글 리스트
	public List<CommentDTO> commentList(String no) {
		FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
        List<CommentDTO> list = null;
        list = freeboarddao.commentList(no);
        return list;
	}
	
	
	//댓글 뽑기
	public List<CommentDTO> commSelect(String no) {
		FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
		List<CommentDTO> list = null;
		list = freeboarddao.selectComment(no);
		
		return list;
	}
	
	public int writeComment(CommentDTO cdto) {
		FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
		int result = 0;
		MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
		MemberDTO member = mdao.selectMyInfo(cdto.getId());
		cdto.setWriter(member.getNickName());
		if(cdto.getDepth()==0){
			result = freeboarddao.writeComment(cdto);//댓글
		}else if(cdto.getDepth()==1){
			result = freeboarddao.writeCommentn(cdto);//대댓글
		}
		return result;
	}

	public int removeComment(int co_no,int depth) {
		FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
		int result = 0;
		if(depth==0){
			result = freeboarddao.deleteAllComment(co_no);			
		}else if(depth==1){
			result = freeboarddao.deleteComment(co_no);						
		}
		return result;
	}
	
	public int modifyComment(CommentDTO dto) {
		
		int result = 0;
		try{
			FreeBoardDAO freeboarddao = sqlSession.getMapper(FreeBoardDAO.class);
			result = freeboarddao.updateComment(dto);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	//관심사 뽑아오는 메서드
	public String selectFavorit(String id){
		String favorit = null;
		try{
			FreeBoardDAO dao = sqlSession.getMapper(FreeBoardDAO.class);
			favorit = dao.selectFavorit(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return favorit;
	}

	//블로거 리스트 
	public List<BlogList_DTO> selectBloger() {
		List<BlogList_DTO> list = null;
		try{
			
			FreeBoardDAO dao = sqlSession.getMapper(FreeBoardDAO.class);
			list = dao.selectBloger();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
}
