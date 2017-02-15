package kr.or.com.debate;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class debateService {

	@Autowired
	private SqlSession sqlSession;
	
	//토론 리스트 뽑아오기
	public List<debateDTO> list(){
		
		List<debateDTO> dto = null;
		try{
			debateDAO dao = sqlSession.getMapper(debateDAO.class);
			dto = dao.listdebateDTO();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//토론 키워드 뽑아오기
	public String debateKeyWord(){
		String keyWord = null;
		try{
			
			debateDAO dao = sqlSession.getMapper(debateDAO.class);
			//키워드 뽑아오고
			keyWord = dao.selectKeyWord();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return keyWord;
	}
	
	//토론 글쓸때 
	public int write(debateDTO dto){
		int result = 0;
		try{
			debateDAO dao = sqlSession.getMapper(debateDAO.class);
			//키워드 뽑아오고
			String keyWord = dao.selectKeyWord();
			dto.setDebateWord(keyWord);
			result = dao.debateWrite(dto);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	//상세보기 눌렀을때 
	public debateDTO selectDetail(String seq) {
		debateDTO dto = null;
		try{
			debateDAO dao = sqlSession.getMapper(debateDAO.class);
			int no = Integer.parseInt(seq);
			dto = dao.selectDetail(no);
		}catch(Exception e){
			e.printStackTrace();
		}
		return dto;
	}
   
	//비디오 링크 가져오기
	public admin_DebateDTO videosrc() {
		debateDAO dao = sqlSession.getMapper(debateDAO.class);
		admin_DebateDTO dto=null;
	  try{
		  dto =  dao.videosrc();
		  System.out.println(" 서비스=========="+dto.toString());
	  }catch (Exception e) {
		e.printStackTrace();
	}
		
		return dto;
	}
	
}
