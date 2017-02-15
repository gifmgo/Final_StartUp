package kr.or.com.debate;

public class admin_DebateDTO {

	private String admin_debate_debateword;
	private String firstvideo;
	private String secondvideo;
	private int no;
	public String getAdmin_debate_debateword() {
		return admin_debate_debateword;
	}
	public void setAdmin_debate_debateword(String admin_debate_debateword) {
		this.admin_debate_debateword = admin_debate_debateword;
	}
	public String getFirstvideo() {
		return firstvideo;
	}
	public void setFirstvideo(String firstvideo) {
		this.firstvideo = firstvideo;
	}
	public String getSecondvideo() {
		return secondvideo;
	}
	public void setSecondvideo(String secondvideo) {
		this.secondvideo = secondvideo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	@Override
	public String toString() {
		return "admin_DebateDTO [admin_debate_debateword=" + admin_debate_debateword + ", firstvideo=" + firstvideo
				+ ", secondvideo=" + secondvideo + ", no=" + no + "]";
	}
	
	
}
