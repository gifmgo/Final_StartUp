package kr.or.com.Paliament_DTO;

public class PaliamentStatue_DTO {

					//법안 이름
	private String billName;
					//제안일
	private String proposeDt;
					//심사 진행상태
	private String procStageCd;
	
	private String billId;
	
	public PaliamentStatue_DTO(String billId, String billName, String proposeDt, String procStageCd) {
		this.billId = billId;
		this.billName = billName;
		this.proposeDt = proposeDt;
		this.procStageCd = procStageCd;
	}

	public void setBillId(String billId) {
		this.billId = billId;
	}
	public String getBillId() {
		return billId;
	}
	
	public String getBillName() {
		return billName;
	}

	public void setBillName(String billName) {
		this.billName = billName;
	}

	public String getProposeDt() {
		return proposeDt;
	}

	public void setProposeDt(String proposeDt) {
		this.proposeDt = proposeDt;
	}

	public String getProcStageCd() {
		return procStageCd;
	}

	public void setProcStageCd(String procStageCd) {
		this.procStageCd = procStageCd;
	}

	@Override
	public String toString() {
		return "PaliamentStatue_DTO [billName=" + billName + ", proposeDt=" + proposeDt + ", procStageCd=" + procStageCd
				+ ", billId=" + billId + "]";
	}

	
}
