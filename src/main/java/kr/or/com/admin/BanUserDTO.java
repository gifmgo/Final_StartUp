package kr.or.com.admin;

public class BanUserDTO {
  private String id;
  private String nickname;
  private String banUserId;
  
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
public String getBanUserId() {
	return banUserId;
}
public void setBanUserId(String banUserId) {
	this.banUserId = banUserId;
}
@Override
public String toString() {
	return "BanUserDTO [id=" + id + ", nickname=" + nickname + ", banUserId=" + banUserId + "]";
}
  
	
}
