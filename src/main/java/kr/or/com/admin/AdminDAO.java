package kr.or.com.admin;

import java.util.List;

import kr.or.com.Member.MemberDTO;

public interface AdminDAO {

	public List<BanUserDTO> userList();
}
