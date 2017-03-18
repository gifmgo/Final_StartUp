package kr.or.com.blog;

import java.util.List;

public interface BlogDAO {
	
	//블로거가 쓴 글 읽어오기
	List<BlogContents_DTO> selectBlogContents(String id);

}
