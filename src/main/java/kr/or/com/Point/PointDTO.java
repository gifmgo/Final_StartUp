package kr.or.com.Point;

public class PointDTO {

	private int potinSeq;
	private String userId;
	private String deptCd;
	private String empNm;
			//보유 수량
	private int point;
	private String buyDate;
	private int updatePoint;
	private String totalCount;
	private String polyNm;
	
	
	public PointDTO() {
	
	}
	public PointDTO(String deptCd, String empNm, String totalCount) {
		this.deptCd = deptCd;
		this.empNm = empNm;
		this.totalCount = totalCount;
	}

	public PointDTO(String deptCd, String empNm, int point, String totalCount, String polyNm) {
		this.deptCd = deptCd;
		this.empNm = empNm;
		this.point = point;
		this.totalCount = totalCount;
		this.polyNm = polyNm;
	}
	public int getPotinSeq() {
		return potinSeq;
	}
	public void setPotinSeq(int potinSeq) {
		this.potinSeq = potinSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDeptCd() {
		return deptCd;
	}
	public void setDeptCd(String deptCd) {
		this.deptCd = deptCd;
	}
	public String getEmpNm() {
		return empNm;
	}
	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}
	public int getUpdatePoint() {
		return updatePoint;
	}
	public void setUpdatePoint(int updatePoint) {
		this.updatePoint = updatePoint;
	}
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	public String getPolyNm() {
		return polyNm;
	}
	public void setPolyNm(String polyNm) {
		this.polyNm = polyNm;
	}
	
	@Override
	public String toString() {
		return "PointDTO [potinSeq=" + potinSeq + ", userId=" + userId + ", deptCd=" + deptCd + ", empNm=" + empNm
				+ ", point=" + point + ", buyDate=" + buyDate + ", updatePoint=" + updatePoint + ", totalCount="
				+ totalCount + ", polyNm=" + polyNm + "]";
	}
	
	
}
