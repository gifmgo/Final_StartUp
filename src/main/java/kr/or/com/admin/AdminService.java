package kr.or.com.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.com.Member.MemberDTO;
import kr.or.com.debate.admin_DebateDTO;
import kr.or.com.debate.debateDAO;
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
	
}
