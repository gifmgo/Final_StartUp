package kr.or.com.admin;

public class BanUserDTO {
  private String id;
  private String nickname;
  private String ban;
  
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBan() {
		return ban;
	}
	public void setBan(String ban) {
		this.ban = ban;
	}
	
	@Override
	public String toString() {
		return "BanUserDTO [id=" + id + ", nickname=" + nickname + ", ban=" + ban + "]";
	}
	  
  
}
