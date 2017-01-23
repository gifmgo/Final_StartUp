package kr.or.com.Paliament_DTO;
/*
 * 작성자 : 박성준
 * 작성일 : 2016-12-26
 * 목  적 : 의원 정보 관련 xml 데이터
 */
public class PaliamentDTO {
	//의원이름
	private String empNm;
	//소속 정당
	private String polyNm;
	//소속 위원회
	private String sharNm;
	//당선횟수
	private String reeleGbnNm;
	//선거구
	private String origNm;
	
	public String getEmpNm() {
		return empNm;
	}
	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}
	public String getPolyNm() {
		return polyNm;
	}
	public void setPolyNm(String polyNm) {
		this.polyNm = polyNm;
	}
	public String getSharNm() {
		return sharNm;
	}
	public void setSharNm(String sharNm) {
		this.sharNm = sharNm;
	}
	public String getReeleGbnNm() {
		return reeleGbnNm;
	}
	public void setReeleGbnNm(String reeleGbnNm) {
		this.reeleGbnNm = reeleGbnNm;
	}
	public String getOrigNm() {
		return origNm;
	}
	public void setOrigNm(String origNm) {
		this.origNm = origNm;
	}
	@Override
	public String toString() {
		return "PaliamentDTO [empNm=" + empNm + ", polyNm=" + polyNm + ", sharNm=" + sharNm + ", reeleGbnNm="
				+ reeleGbnNm + ", origNm=" + origNm + "]";
	}
	
	
}
