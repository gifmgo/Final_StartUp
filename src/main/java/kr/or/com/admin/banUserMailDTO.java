package kr.or.com.admin;

/*
 * 목적 : 차단 당한 사용자가 차단페이지에서 메일보낼때 사용되는 DTO
 */
public class banUserMailDTO {
	private int banUserMailSeq;
	private String banUserId;	//차단된 아이디
	private String realId;		//연락받을 아이디
	private String banContent;
	private String mailDay;
	
	public banUserMailDTO() {
	}

	public banUserMailDTO(int banUserMailSeq, String banUserId, String realId, String banContent, String mailDay) {
		this.banUserMailSeq = banUserMailSeq;
		this.banUserId = banUserId;
		this.realId = realId;
		this.banContent = banContent;
		this.mailDay = mailDay;
	}

	public String getBanUserId() {
		return banUserId;
	}
	public void setBanUserId(String banUserId) {
		this.banUserId = banUserId;
	}
	public String getRealId() {
		return realId;
	}
	public void setRealId(String realId) {
		this.realId = realId;
	}
	public String getBanContent() {
		return banContent;
	}
	public void setBanContent(String banContent) {
		this.banContent = banContent;
	}

	public int getBanUserMailSeq() {
		return banUserMailSeq;
	}

	public void setBanUserMailSeq(int banUserMailSeq) {
		this.banUserMailSeq = banUserMailSeq;
	}

	public String getMailDay() {
		return mailDay;
	}

	public void setMailDay(String mailDay) {
		this.mailDay = mailDay;
	}

	@Override
	public String toString() {
		return "banUserMailDTO [banUserMailSeq=" + banUserMailSeq + ", banUserId=" + banUserId + ", realId=" + realId
				+ ", banContent=" + banContent + ", mailDay=" + mailDay + "]";
	}
	
	
	

}
