package kr.or.com.admin;

public class BanUserDTO {
	private String id;
	private String nickname;
	private String banUserId;
	
	public BanUserDTO() {
	
	}
	
	public BanUserDTO(String id, String nickname, String banUserId) {

		this.id = id;
		this.nickname = nickname;
		this.banUserId = banUserId;
	}

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
	
	
}
