package kr.or.com.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.com.Member.MemberDTO;

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

	public int insertSubject(String subject) {
		AdminDAO dao= sqlsession.getMapper(AdminDAO.class);
		int result = dao.insertSubject(subject);
		return result;
	}

	
	

	
}
