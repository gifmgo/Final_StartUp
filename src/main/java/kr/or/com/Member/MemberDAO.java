package kr.or.com.Member;

import kr.or.com.admin.BanUserDTO;
import kr.or.com.admin.banUserMailDTO;

public interface MemberDAO {

	//로그인
	public MemberDTO login(MemberDTO dto);
	
	//회원가입
	public int AddMember(MemberDTO dto);
	
	//회원가입시 아이디 중복확인
	public String checkId(String id);
	
	//회원가입시 닉네임 중복 확인
	public String checkNick(String nick);
	
	//내정보 보기 
	public MemberDTO selectMyInfo(String id);
	
	//닉네임 체크
	public MemberDTO checkNickName(String nick);
	
	//개인정보 업데이트 !!
	public int UpdateMyInfo(MemberDTO dto);
	
	//밴유저 확인
	public BanUserDTO banUser(String id);
	
	//밴유저 메일 보내기
	public int banUserMail(banUserMailDTO dto);
	
}
