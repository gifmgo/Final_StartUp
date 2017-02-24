package kr.or.com.Util;


public class Converter {

	public String korToEng(String kor){
		String result = "free";
		if(kor.equals("자유게시판")){
			result = "free";
		}else if(kor.equals("정치게시판")){
			result = "politics";
		}else if(kor.equals("오늘의 이슈")){
			result = "issue";
		}else if(kor.equals("공지사항")){
			result = "qa";
		}
		return result;
	}
	public String engToKor(String eng){
		String result = "free";
		if(eng.equals("free")){
			result = "자유게시판";
		}else if(eng.equals("politics")){
			result = "정치게시판";
		}else if(eng.equals("issue")){
			result = "오늘의 이슈";
		}else if(eng.equals("qa")){
			result = "공지사항";
		}
		return result;
	}
	
}
