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
}
