package kr.or.com.Member;

import java.util.List;

public class MemberDTO {

	private String id;
	private String pw;
	private String nickName;
	private String birth;
	private String gender;
	private String favorit;

	public MemberDTO() {
	}

	public MemberDTO(String id, String pw, String nickName, String birth, String gender, String favorit) {
		this.id = id;
		this.pw = pw;
		this.nickName = nickName;
		this.birth = birth;
		this.gender = gender;
		this.favorit = favorit;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getFavorit() {
		return favorit;
	}

	public void setFavorit(String favorit) {
		this.favorit = favorit;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", nickName=" + nickName + ", birth=" + birth + ", gender="
				+ gender + ", favorit=" + favorit + "]";
	}
	
	



}
