package kr.or.com.admin;

import java.util.List;

import kr.or.com.Member.MemberDTO;

public interface AdminDAO {

	//차단 유저 관리  - 유저 리스트 
	public List<BanUserDTO> userList();

	//유저 차단하기
	public int insertbanId(String userId);

	public List<BanUserDTO> checkId();
	
	//차단유저 해제하기
	public int deletebanId(String string);
}
