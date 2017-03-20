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
	public List<BlogContents_DTO> selectBloger() {
		List<BlogContents_DTO> list = null;
		try{
			BlogDAO dao = sqlsession.getMapper(BlogDAO.class);
			list = dao.selectBlogContents();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	//블로거 Id 만 뽑아옴
	public List<BlogList_DTO> selectBlogerId() {
		List<BlogList_DTO> list = null;
		try{
			BlogDAO dao = sqlsession.getMapper(BlogDAO.class);
			list = dao.selectBlogerId();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
	//글내용 상세보기
	public BlogContents_DTO blogContentDetail(String seq) {
		
		int i_seq = 0;
		BlogContents_DTO dto = null;
		try{
			i_seq = Integer.parseInt(seq);
			BlogDAO dao = sqlsession.getMapper(BlogDAO.class);
			dto = dao.selectDetailContent(i_seq);
		}catch(Exception e){
			e.printStackTrace();
		}
		return dto;
	}
	
	//블로거 신청하는 부분 >> Modal
	public int blogerApply(BlogerApply_DTO dto) {
		int result = 0;
		try{
			BlogDAO dao = sqlsession.getMapper(BlogDAO.class);
			result = dao.blogerApply(dto);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	
	
}
