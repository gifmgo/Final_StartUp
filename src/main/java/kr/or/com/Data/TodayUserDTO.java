package kr.or.com.Data;

public class TodayUserDTO {
	
	private int no;
	private String adate;
	private int todayTotalUser;
	private int totalUser;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getAdate() {
		return adate;
	}
	public void setAdate(String adate) {
		this.adate = adate;
	}
	public int getTodayTotalUser() {
		return todayTotalUser;
	}
	public void setTodayTotalUser(int todayTotalUser) {
		this.todayTotalUser = todayTotalUser;
	}
	public int getTotalUser() {
		return totalUser;
	}
	public void setTotalUser(int totalUser) {
		this.totalUser = totalUser;
	}
	@Override
	public String toString() {
		return "TodayUserDTO [no=" + no + ", adate=" + adate + ", todayTotalUser=" + todayTotalUser + ", totalUser="
				+ totalUser + "]";
	}
	
}