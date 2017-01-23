package kr.or.com.Paliament_DTO;

public class AllConInfo_DTO {
	//회의 번호
	private String conferNum;
	//위원회
	private String commName;
	//회기별 (ex - 320)
	private String meeting1;
	//차수별 ( ex - 제 4차)
	private String meeting2;
	//요약 정보
	private String summary;
	
	//출석정보
	private String join;
	
	public AllConInfo_DTO(String conferNum, String commName, String meeting1, String meeting2, String summary, String join) {
		this.conferNum = conferNum;
		this.commName = commName;
		this.meeting1 = meeting1;
		this.meeting2 = meeting2;
		this.summary = summary;
		this.join = join;
	}

	public void setJoin(String join) {
		this.join = join;
	}
	
	public String getJoin() {
		return join;
	}
	
	public String getConferNum() {
		return conferNum;
	}

	public void setConferNum(String conferNum) {
		this.conferNum = conferNum;
	}

	public String getCommName() {
		return commName;
	}

	public void setCommName(String commName) {
		this.commName = commName;
	}

	public String getMeeting1() {
		return meeting1;
	}

	public void setMeeting1(String meeting1) {
		this.meeting1 = meeting1;
	}

	public String getMeeting2() {
		return meeting2;
	}

	public void setMeeting2(String meeting2) {
		this.meeting2 = meeting2;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	@Override
	public String toString() {
		return "AllConInfo_DTO [conferNum=" + conferNum + ", commName=" + commName + ", meeting1=" + meeting1
				+ ", meeting2=" + meeting2 + ", summary=" + summary + ", join=" + join + "]";
	}

	
	
}
