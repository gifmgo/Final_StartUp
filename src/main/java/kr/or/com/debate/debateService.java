package kr.or.com.debate;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class debateService {

	@Autowired
	private SqlSession sqlSession;
	
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
	
}
