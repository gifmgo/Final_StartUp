package kr.or.com.blog;

import java.util.List;

public interface BlogDAO {
	
	//블로거가 쓴 글 읽어오기
	List<BlogContents_DTO> selectBlogContents();
	
	//블로거 ID 만 가져옴
	List<BlogList_DTO> selectBlogerId();
	
	//블로거 글 상세 보기 
	BlogContents_DTO selectDetailContent(int seq);

	//블로거 신청하기 부분
	int blogerApply(BlogerApply_DTO dto);

}
