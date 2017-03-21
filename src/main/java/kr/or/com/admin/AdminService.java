package kr.or.com.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.com.Data.TodayUserDAO;
import kr.or.com.Data.TodayUserDTO;
import kr.or.com.Member.MemberDTO;
import kr.or.com.blog.BlogerApply_DTO;
import kr.or.com.debate.admin_DebateDTO;
import kr.or.com.debate.debateDTO;

@Service
public class AdminService {
	
	@Autowired
	private SqlSession sqlsession;

	//전체 사용자 리스트 출력
	public List<BanUserDTO> userList(){
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		List<BanUserDTO> list = dao.userList();
		return list;
	}

	//아이디 차단하기
	public int banIdinsert(String banId) {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		String[] array = banId.split(",");
		int result =0;
		for(int i=0; i<array.length; i++){
			result = dao.insertbanId(array[i]);
		}
		return result;
	}
	//차단아이디 해제하기
	public int banIdDelete(String banId) {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		String[] array = banId.split(",");
		int result =0;
		for(int i=0; i<array.length; i++){			
			result = dao.deletebanId(array[i]);
		}
		return result;
	}

	//차단 전 아이디 확인하기
	public List<BanUserDTO> checkId() {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		List<BanUserDTO> checkresult = dao.checkId();
		return checkresult;
	}

	public int insertSubject(admin_DebateDTO subject) {
		AdminDAO dao= sqlsession.getMapper(AdminDAO.class);
		int result = dao.insertSubject(subject);
		return result;
	}

	//키워드 전체 가져오는 부분
	public List<admin_DebateDTO> selectKeyWord() {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		List<admin_DebateDTO> list = null;
		try{
			 list = dao.selectAdmin_debateDTO_List();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
	//선택한 키워드에 따른 게시글 읽어오기
	public List<debateDTO> selectList(String keyword) {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		List<debateDTO> list = null;
		try{
			list = dao.selectDebateList(keyword);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	//요일별 접속자 확인하는 메서드
	public List<TodayUserDTO> countDateUser() {	
		TodayUserDAO dao = sqlsession.getMapper(TodayUserDAO.class);
		List<TodayUserDTO> list = null;
		try{
			list = dao.todayList();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	public int quiz(QuizDTO dto) {
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		int result =0;
		 try{
			 result = dao.quiz(dto);
				
		 }catch (Exception e) {
			e.printStackTrace();
		}
		 	return result;
	}
	
	//차단 당한 유저가 보내는 메일 확인하는 부분
	public List<banUserMailDTO> banUserMailList() {
		
		List<banUserMailDTO> list = null;
		try{
			
			AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
			list = dao.banUserMailList();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
	//메일보낸것 팝업 띄우기!
	public banUserMailDTO banuserMailDTO(int banUserMailSeq) {
		banUserMailDTO dto = null;
		try{
			
			AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
			dto = dao.banuserMailDTO(banUserMailSeq);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//포인트 업데이트 해주는 부분
	public List<MemberDTO> selectMemberList() {
		List<MemberDTO> list = null;
		try{
			AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
			list = dao.userList2();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	//유저 포인트 업데이트!
	public int updateMemberPoint(List<MemberDTO> prevList) {

		int result = 0;
		try{
			AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
			for(int i=0; i<prevList.size(); i++){
				result = dao.updateMemberPoint(prevList.get(i));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	//블로거 신청 리스트 !!
	public List<BlogerApply_DTO> selectBlogerList() {
		List<BlogerApply_DTO> list = null;
		try{
			AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
			list = dao.selectBlogerList();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	//신청한 블로거 한명 정보 확인 하는 부분
	public BlogerApply_DTO blogerInfo(int i_seq) {
		BlogerApply_DTO	dto = null;
		try{
			
			AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
			dto = dao.selectBlogerInfo(i_seq);
		}catch(Exception e){
			e.printStackTrace();
		}
		return dto;
	}

	//블로거 신청 리스트 수락하는 부분
	public int AdminBlogerInfoResult(MultipartFile file, BlogerApply_DTO dto, HttpServletRequest request) {
		
		int result = 0;
		try{
		
		if(file != null){
			  //파일 이름
			 String fileName = file.getOriginalFilename();
			  dto.setFilename(fileName);
			  //파일 경로
			 String filePath = request.getRealPath("/blog");
			 dto.setFilepath(filePath);
			 
			 File myFile = new File(filePath+"/"+fileName);
			 file.transferTo(myFile);
			 System.out.println("서비스 dto 확인좀요  >>>> "+dto.toString());
			 AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
			 result = dao.insertBlogerInfo(dto);
		}

		}catch(Exception e){
			e.printStackTrace();
		}
  		return result;
	}
	
	//블로거 신청 리스트 수락 성공 후 >> tbl_bloger 에 insert 하는 부부
	public int AdminBlogerUpdate(BlogerApply_DTO dto) {
		int result = 0;
		try{
			AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
			result = dao.insertBloger(dto);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	//대기중인 블로거 승인 후 삭제 하는 부분
	public int AdminWaitBloger_Delete(BlogerApply_DTO dto) {
		int result = 0;
		try{
			AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
			result = dao.AdminWaitBloger_Delete(dto);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
}
