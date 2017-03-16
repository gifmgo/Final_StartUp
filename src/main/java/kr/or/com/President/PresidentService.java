package kr.or.com.President;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class PresidentService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
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
	
	//대선관련  유저들이 글쓴것 뿌려주는 부분
	public List<PresidentTalk_DTO> presidentTalk_List() {
		List<PresidentTalk_DTO> list = null;
		try{
			PresidentDAO dao = sqlSession.getMapper(PresidentDAO.class);
			list = dao.selectPresidentTalk_list();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	//대선관련 토크
	public List<PresidentDTO> presidentTalk() {
		List<PresidentDTO> list = null;
		try{
			PresidentDAO dao = sqlSession.getMapper(PresidentDAO.class);
			list = dao.presidentTalk();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	//비회원 대선후보 토크
	public int notLoginUserTalk(PresidentTalk_DTO dto) {
		int result = 0;
		try{
			PresidentDAO dao = sqlSession.getMapper(PresidentDAO.class);
			dto.setPw(this.bCryptPasswordEncoder.encode(dto.getPw()));
			result = dao.notLoginUserTalk(dto);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	//회원 대선후보 토크
	public int loginUserTalk(PresidentTalk_DTO dto) {
		int result = 0;
		try{
			PresidentDAO dao = sqlSession.getMapper(PresidentDAO.class);
			System.out.println("이건왜 ? : "+dto.toString());
			result = dao.loginUserTalk(dto);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	//삭제 버튼 클릭시 확인 해야함.
	public PresidentTalk_DTO selectPresidentTalk(int presidentTalk_seq) {
		
		PresidentTalk_DTO dto = null;
		
		try{
			PresidentDAO dao = sqlSession.getMapper(PresidentDAO.class);
			dto = dao.selectPresidentTalk(presidentTalk_seq);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return dto;
	}

	//대선 토크 >> 글 삭제 !!
	public int deletePresidentTalk(int presidentTalk_seq, String nickName, String pw, String db_pw) {
		
		int result = 0;
		//비번 암호화
													//넘겨받은 비번 ,  디비에 있는 비번
		boolean checkPw = this.bCryptPasswordEncoder.matches(pw, db_pw);
		
		if(checkPw != false){
			try{
				PresidentDAO dao = sqlSession.getMapper(PresidentDAO.class);
				result = dao.deletePresidentTalk(presidentTalk_seq);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return result;
	}

}
