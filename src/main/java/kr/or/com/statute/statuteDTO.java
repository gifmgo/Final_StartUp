package kr.or.com.statute;
/*
 * 의안 DTO
 * 
 * */
public class statuteDTO { 
  private String proposeDt;
  private String billName;
  private String committeeName;
  private String generalResult;
  private String billId;
  private String proposerKind;
  
  
  
public statuteDTO() {
	
}

public statuteDTO(String proposeDt, String billName, String committeeName, String generalResult, String billId) {
	
	this.proposeDt = proposeDt;
	this.billName = billName;
	this.committeeName = committeeName;
	this.generalResult = generalResult;
	this.billId = billId;
}

public statuteDTO(String proposeDt, String billName, String committeeName, String billId) {
	
	this.proposeDt = proposeDt;
	this.billName = billName;
	this.committeeName = committeeName;
	this.billId = billId;
}






public String getProposerKind() {
	return proposerKind;
}

public void setProposerKind(String proposerKind) {
	this.proposerKind = proposerKind;
}

public String getBillId() {
	return billId;
}

public void setBillId(String billId) {
	this.billId = billId;
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
public String getCommitteeName() {
	return committeeName;
}
public void setCommitteeName(String committeeName) {
	this.committeeName = committeeName;
}
public String getGeneralResult() {
	return generalResult;
}
public void setGeneralResult(String generalResult) {
	this.generalResult = generalResult;
}


  
  
}
