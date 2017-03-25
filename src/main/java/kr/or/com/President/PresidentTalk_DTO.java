package kr.or.com.President;

public class PresidentTalk_DTO {

	private int presidentTalk_seq;
	private String empNm;
	private String polyNm;
	private String color;
	private String nickName;
	private String title;
	private String writeDate;
	private String comments;
	//로그인 안한 사용자가 insert 할때
	private String pw;
	//로그인한 사용자가 insert 할때
	private String loginPw;
	
	
	



	public int getPresidentTalk_seq() {
		return presidentTalk_seq;
	}



	public void setPresidentTalk_seq(int presidentTalk_seq) {
		this.presidentTalk_seq = presidentTalk_seq;
	}



	public String getEmpNm() {
		return empNm;
	}



	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}



	public String getPolyNm() {
		return polyNm;
	}



	public void setPolyNm(String polyNm) {
		this.polyNm = polyNm;
	}



	public String getColor() {
		return color;
	}



	public void setColor(String color) {
		this.color = color;
	}



	public String getNickName() {
		return nickName;
	}



	public void setNickName(String nickName) {
		this.nickName = nickName;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getWriteDate() {
		return writeDate;
	}



	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}



	public String getComments() {
		return comments;
	}



	public void setComments(String comments) {
		this.comments = comments;
	}



	public String getPw() {
		return pw;
	}



	public void setPw(String pw) {
		this.pw = pw;
	}



	public String getLoginPw() {
		return loginPw;
	}



	public void setLoginPw(String loginPw) {
		this.loginPw = loginPw;
	}



	@Override
	public String toString() {
		return "PresidentTalk_DTO [presidentTalk_seq=" + presidentTalk_seq + ", empNm=" + empNm + ", polyNm=" + polyNm
				+ ", color=" + color + ", nickName=" + nickName + ", title=" + title + ", writeDate=" + writeDate
				+ ", comments=" + comments + ", pw=" + pw + ", loginPw=" + loginPw + "]";
	}

	


}
