package kr.or.com.Member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//로그인 시 사용
	public String Login(MemberDTO dto){
		String resultDB = "";
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		
		try{
			
			MemberDTO result = dao.login(dto);
																//넘겨받은 비번 ,      디비에 있는 비번
			boolean checkPw = this.bCryptPasswordEncoder.matches(dto.getPw(), result.getPw());
			
			if(result.getId() == null || result.getId().equals("") || checkPw == false){
				resultDB = "실패";
			}else{
				resultDB = "성공";
			}	
		}catch(Exception e){
			resultDB = "실패";
		}finally{
			return resultDB;
		}
	}
	
	//회원가입시 아이디 중복확인
	public String checkId(String id){
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		String result = dao.checkId(id);
		return result;
	}
	
	//회원가입시 닉네임 중복확인
	public String checkNick(String nickName){
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		String result = dao.checkNick(nickName);
		return result;
	}
	
	//회원가입
	public int AddMember(MemberDTO dto){
		int result = 0;
		
		try{
		//비번 암호화
		dto.setPw(this.bCryptPasswordEncoder.encode(dto.getPw()));
		
		System.out.println("확인좀 할께요 서비스 : "+dto.toString());
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		result = dao.AddMember(dto);
		
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	//내정보 보기 이용시
	public MemberDTO SelectMyInfo(String id){
		
		MemberDTO dto = null;
		
		try{
			
			MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
			dto	= dao.selectMyInfo(id);
			if(dto.getId() != null){
				System.out.println("아이디 값 있어욥!! : "+dto.getId());
			}else{
				dto.setId(null);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return dto;
	}

	//닉네임 체크 메서드!!
	public int checkNickName(String nickName) {
		
		MemberDTO dto = null;
		int result = 0;
		
		try{
			
			MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
			dto = dao.checkNickName(nickName);
			if(dto == null){
				result = 1;
			}else{
				result = 0;
			}
		}catch(Exception e){
			result = 1;
			System.out.println("예외 발생!!");
			e.printStackTrace();
		}finally{
			return result;
		}
	}
	
	
	//개인정보 업데이트!!
	public int updateMyInfo(MemberDTO dto) {
		System.out.println("개인정보 업데이트 dto 서비스 확인 : "+dto.toString());
		int result = 0;
		try{
			
			MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
			result = dao.UpdateMyInfo(dto);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
}
