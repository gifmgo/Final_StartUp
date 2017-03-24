package kr.or.com.index;

public class ConcatDTO {

	private int concatSeq;
	private String concatName;
	private String concatEmail;
	private String concatComments;
	public int getConcatSeq() {
		return concatSeq;
	}
	public void setConcatSeq(int concatSeq) {
		this.concatSeq = concatSeq;
	}
	public String getConcatName() {
		return concatName;
	}
	public void setConcatName(String concatName) {
		this.concatName = concatName;
	}
	public String getConcatEmail() {
		return concatEmail;
	}
	public void setConcatEmail(String concatEmail) {
		this.concatEmail = concatEmail;
	}
	public String getConcatComments() {
		return concatComments;
	}
	public void setConcatComments(String concatComments) {
		this.concatComments = concatComments;
	}
	@Override
	public String toString() {
		return "ConcatDTO [concatSeq=" + concatSeq + ", concatName=" + concatName + ", concatEmail=" + concatEmail
				+ ", concatComments=" + concatComments + "]";
	}
	
	
	
}
