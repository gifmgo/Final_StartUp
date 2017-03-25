package kr.or.com.President;

public class PresidentVote_DTO {

	private String id;
	private String president;
	private int presidentCount;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPresident() {
		return president;
	}
	public void setPresident(String president) {
		this.president = president;
	}
	public int getPresidentCount() {
		return presidentCount;
	}
	public void setPresidentCount(int presidentCount) {
		this.presidentCount = presidentCount;
	}
	
	@Override
	public String toString() {
		return "PresidentVote_DTO [id=" + id + ", president=" + president + ", presidentCount=" + presidentCount + "]";
	}
	
}
