package kr.or.com.Point;

public class PointDTO {
	
	private int potinSeq;
	private String userId;
	private String deptCd;
	private String empNm;
	private int point;
	private String buyDate;
	private int updatePoint;
	//내가 산 국회의원 리스트 볼때 사용
	private int Total;
	
	
	
	public int getTotal() {
		return Total;
	}


	public void setTotal(int total) {
		Total = total;
	}


	public PointDTO() {
	
	}

	
	public PointDTO(String deptCd, String empNm, int point) {
		
		this.deptCd = deptCd;
		this.empNm = empNm;
		this.point = point;
	}



	public PointDTO(int potinSeq, String userId, String deptCd, String empNm, int point) {
		this.potinSeq = potinSeq;
		this.userId = userId;
		this.deptCd = deptCd;
		this.empNm = empNm;
		this.point = point;
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


	@Override
	public String toString() {
		return "PointDTO [potinSeq=" + potinSeq + ", userId=" + userId + ", deptCd=" + deptCd + ", empNm=" + empNm
				+ ", point=" + point + ", buyDate=" + buyDate + ", updatePoint=" + updatePoint + ", Total=" + Total
				+ "]";
	}

	
}
