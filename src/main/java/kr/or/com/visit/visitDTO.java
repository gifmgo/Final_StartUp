package kr.or.com.visit;

public class visitDTO {

	private String ip;
	private String visitDate;
	
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}
	@Override
	public String toString() {
		return "visitDTO [ip=" + ip + ", visitDate=" + visitDate + "]";
	}
	
	
	
}
