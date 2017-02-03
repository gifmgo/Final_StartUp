package kr.or.com.debate;

public class debateDTO {
	
	private String debateNo;
	private String debateWord;
	private String choose;
	private String nickName;
	private String content;
	private String viewCount;
	private String writeDate;
	
	public debateDTO(){
		
	}
	
	public debateDTO(String choose, String nickName, String content, String viewCount) {
		this.choose = choose;
		this.nickName = nickName;
		this.content = content;
		this.viewCount = viewCount;
	}

	public debateDTO(String debateNo, String debateWord, String choose, String nickName, String content,
			String viewCount, String writeDate) {
		this.debateNo = debateNo;
		this.debateWord = debateWord;
		this.choose = choose;
		this.nickName = nickName;
		this.content = content;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
	}

	public String getDebateNo() {
		return debateNo;
	}

	public void setDebateNo(String debateNo) {
		this.debateNo = debateNo;
	}

	public String getChoose() {
		return choose;
	}

	public void setChoose(String choose) {
		this.choose = choose;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getViewCount() {
		return viewCount;
	}

	public void setViewCount(String viewCount) {
		this.viewCount = viewCount;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getDebateWord() {
		return debateWord;
	}

	public void setDebateWord(String debateWord) {
		this.debateWord = debateWord;
	}

	@Override
	public String toString() {
		return "debateDTO [debateNo=" + debateNo + ", debateWord=" + debateWord + ", choose=" + choose + ", nickName="
				+ nickName + ", content=" + content + ", viewCount=" + viewCount + ", writeDate=" + writeDate + "]";
	}

	

}
