package kr.or.com.blog;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlogerService {
	
	
	@Autowired
	private SqlSession sqlsession;

	
	//블로거가 쓴 글 확인
	public List<BlogContents_DTO> selectBloger(String id) {
		List<BlogContents_DTO> list = null;
		try{
			BlogDAO dao = sqlsession.getMapper(BlogDAO.class);
			list = dao.selectBlogContents(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	
	
}
