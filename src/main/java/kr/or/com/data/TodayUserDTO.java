package kr.or.com.data;

public class TodayUserDTO {
	private String ADate;
	private int todayTotalUser;
	private int totalUser;
	
	public String getADate() {
		return ADate;
	}
	public void setADate(String aDate) {
		ADate = aDate;
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
		return "AccessUserDTO [ADate=" + ADate + ", todayTotalUser=" + todayTotalUser + ", totalUser=" + totalUser
				+ "]";
	}
}