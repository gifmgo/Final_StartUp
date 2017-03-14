package kr.or.com.President;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.com.Member.MemberDTO;

@Service
public class PresidentService {

	@Autowired
	private SqlSession sqlSession;
	
	public List<PresidentDTO> list(){
		
		List<PresidentDTO> list = null;
		PresidentDAO dao = sqlSession.getMapper(PresidentDAO.class);
		
		try{
			list = dao.list(); 
		}catch(Exception e){
			e.printStackTrace();
		}

		return list; 
	}
	
	//대선주자 지지율
	public List<PresidentDTO> PresidentPoll() {
		
		List<PresidentDTO> list = null;
		try{
			PresidentDAO dao = sqlSession.getMapper(PresidentDAO.class);	
			list = dao.poll();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	//유저끼리 임시 투표 >> 대선 후보 정보 뿌려줌
	public List<PresidentDTO> presidentVote() {
		List<PresidentDTO> list = null;
		try{
			PresidentDAO dao = sqlSession.getMapper(PresidentDAO.class);	
			list = dao.vote();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	//투표를 한 유저인가 확인하는 부분
	public PresidentVote_DTO checkVote(String id) {
		
		PresidentVote_DTO dto = null;
		try{
			PresidentDAO dao = sqlSession.getMapper(PresidentDAO.class);
			dto = dao.checkVote(id);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return dto;
	}

	//유저끼리 임시 투표 버튼 클릭시
	public int VoteStart(PresidentVote_DTO dto) {
		
		int result = 0;
		try{
			PresidentDAO dao = sqlSession.getMapper(PresidentDAO.class);
			result = dao.updateVote(dto);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}

	//임시 투표결과 뿌려주기
	public List<PresidentDTO> voteDetailAjax() {
		List<PresidentDTO> list = null;
		try{
			
			PresidentDAO dao = sqlSession.getMapper(PresidentDAO.class);
			list = dao.voteDetail();
			
		}catch(Exception e){
			e.printStackTrace();
		}
				
		return list;
	}

	
}
