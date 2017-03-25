package kr.or.com.President;

public class PresidentDTO extends PresidentVote_DTO{
	
	private String name;
	private String jungDang;
	private String area;
	private String status;
	private String twitter;
	private String facebook;
	private String homepage;
	private int pools;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJungDang() {
		return jungDang;
	}
	public void setJungDang(String jungDang) {
		this.jungDang = jungDang;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTwitter() {
		return twitter;
	}
	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	
	public int getPools() {
		return pools;
	}
	public void setPools(int pools) {
		this.pools = pools;
	}
	@Override
	public String toString() {
		return "PresidentDTO [name=" + name + ", jungDang=" + jungDang + ", area=" + area + ", status=" + status
				+ ", twitter=" + twitter + ", facebook=" + facebook + ", homepage=" + homepage + ", pools=" + pools
				+ "]";
	}
	
	
	
	
}
