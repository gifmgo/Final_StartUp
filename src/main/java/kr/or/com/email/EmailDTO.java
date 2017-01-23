package kr.or.com.email;

public class EmailDTO {
	//제목
	private String subject;
	//내용
	private String content;
	//받는사람
	private String receiver;
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	@Override
	public String toString() {
		return "EmailDTO [subject=" + subject + ", content=" + content + ", receiver=" + receiver + "]";
	}
	
}
