package kr.or.com.Util;


public class Converter {

	public String korToEng(String kor){
		String result = kor;
		if(kor.equals("자유게시판")){
			result = "free";
		}else if(kor.equals("정치게시판")){
			result = "politics";
		}else if(kor.equals("오늘의 이슈")){
			result = "issue";
		}else if(kor.equals("공지사항")){
			result = "qa";
		}else if(kor.equals("일상")){
			result = "life";
		}else if(kor.equals("영상")){
			result = "fun";
		}else if(kor.equals("고민")){
			result = "wor";
		}else if(kor.equals("연예")){
			result = "star";
		}
		return result;
	}
	
	
	public String engToKor(String eng){
		String result = eng;
		if(eng.equals("free")){
			result = "자유게시판";
		}else if(eng.equals("politics")){
			result = "정치게시판";
		}else if(eng.equals("issue")){
			result = "오늘의 이슈";
		}else if(eng.equals("qa")){
			result = "공지사항";
		}else if(eng.equals("life")){
			result = "일상";
		}else if(eng.equals("fun")){
			result = "영상";
		}else if(eng.equals("wor")){
			result = "고민";
		}else if(eng.equals("star")){
			result = "연예";
		}
		return result;
	}
	
}
