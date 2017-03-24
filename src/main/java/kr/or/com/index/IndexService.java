package kr.or.com.index;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.com.Data.TodayUserDTO;
import kr.or.com.FreeBoard.FreeBoardDTO;
import kr.or.com.Member.MemberDTO;
import kr.or.com.Paliament_DTO.PaliamentList_DTO;
import kr.or.com.Point.PointDTO;
import kr.or.com.President.PresidentTalk_DTO;
import kr.or.com.blog.BlogList_DTO;
import kr.or.com.debate.debateDTO;

@Service
public class IndexService {

	@Autowired
	private SqlSession sqlSession;
	
	//대선후보 관련 
	public List<PresidentTalk_DTO> PresidentTalk() {
		
		List<PresidentTalk_DTO> list = null;
		
		try{
			IndexDAO dao = sqlSession.getMapper(IndexDAO.class);
			list = dao.index_selectPresidentTalk();
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	//토론하기 키워드
	public List<debateDTO> selectKeyWord() {
		
		List<debateDTO> list = null;
		String keyWord = null;
		try{
			
			IndexDAO dao = sqlSession.getMapper(IndexDAO.class);
			keyWord = dao.index_selectKeyWord();
			list = dao.index_listdebateDTO(keyWord);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
	//오늘의 이슈
	public List<FreeBoardDTO> selectIssue() {
		List<FreeBoardDTO> list = null;
		try{
			IndexDAO dao = sqlSession.getMapper(IndexDAO.class); 
			list = dao.index_selectIssue();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	//정치 게시판 데이터 글
	public List<FreeBoardDTO> selectJungChi() {
		List<FreeBoardDTO> list = null;
		try{
			IndexDAO dao = sqlSession.getMapper(IndexDAO.class);
			list = dao.index_selectJungChi();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	//공지사항
	public List<FreeBoardDTO> selectNotice() {
		List<FreeBoardDTO> list = null;
		try{
			IndexDAO dao = sqlSession.getMapper(IndexDAO.class);
			list = dao.index_selectCheckList();
			if(list.size() > 5){
				list = dao.index_selectNotice();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	//포인트 상위 5명
	public List<MemberDTO> selectPointList() {
		
		List<MemberDTO> list = null;
		try{
			
			IndexDAO dao = sqlSession.getMapper(IndexDAO.class);
			list = dao.index_selectPoint();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
	//인기 국회의원
	public List<PaliamentList_DTO> selectPaliamentList() {
		List<PaliamentList_DTO> list = null;
		try{
			
			IndexDAO dao = sqlSession.getMapper(IndexDAO.class);
			list = dao.index_selectPaliament();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	//블로거 리스트 
	public List<BlogList_DTO> selectBlogerList() {
		List<BlogList_DTO> list = null;
		try{
			IndexDAO dao = sqlSession.getMapper(IndexDAO.class);
			list = dao.index_selectBlogerList();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	//접속자 수 확인 
	public TodayUserDTO selectTodayUserDTO() {
		TodayUserDTO dto = null;
		try{
			IndexDAO dao = sqlSession.getMapper(IndexDAO.class);
			dto = dao.index_selectTodayUser();
		}catch(Exception e){
			e.printStackTrace();
		}
		return dto;
	}
	
	//index 페이지에서 문의하기 
	public int insertConCat(ConcatDTO dto) {
		
		int result = 0;
		
		try{
			IndexDAO dao = sqlSession.getMapper(IndexDAO.class);
			result = dao.index_insertConCat(dto);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}





	
}
