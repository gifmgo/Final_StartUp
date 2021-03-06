package kr.or.com.Member;

public class MemberDTO {
	private int index;
	private String id;
	private String pw;
	private String nickName;
	private String birth;
	private String gender;
	private String favorit;
	private int point;
	private String rank; 
	
	

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public MemberDTO() {
	}

	public MemberDTO(String id, String nickName, String rank) {
		this.id = id;
		this.nickName = nickName;
		this.rank = rank;
	}

	public MemberDTO(String id, String pw, String nickName, String birth, String gender, String favorit, int point) {
		this.id = id;
		this.pw = pw;
		this.nickName = nickName;
		this.birth = birth;
		this.gender = gender;
		this.favorit = favorit;
		this.point = point;
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



	public int getPoint() {
		return point;
	}



	public void setPoint(int point) {
		this.point = point;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", nickName=" + nickName + ", birth=" + birth + ", gender="
				+ gender + ", favorit=" + favorit + ", point=" + point + ", rank=" + rank + "]";
	}

	

}
